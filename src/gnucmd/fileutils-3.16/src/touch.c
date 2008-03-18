/* touch -- change modification and access times of files
   Copyright (C) 87, 89, 90, 91, 95, 1996 Free Software Foundation Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software Foundation,
   Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */

/* For the avoidance of doubt, except that if any license choice other
   than GPL or LGPL is available it will apply instead, Sun elects to
   use only the General Public License version 2 (GPLv2) at this time
   for any software where a choice of GPL license versions is made
   available with the language indicating that GPLv2 or any later
   version may be used, or where a choice of which version of the GPL
   is applied is otherwise unspecified. */

/* Options:
   -a, --time={atime,access,use}	Change access time only.
   -c, --no-create		Do not create files that do not exist.
   -d, --date=TIME		Specify time and date in various formats.
   -f				Ignored.
   -m, --time={mtime,modify}	Change modification time only.
   -r, --reference=FILE		Use the time and date of reference file FILE.
   -t TIME			Specify time and date in the form
				`MMDDhhmm[[CC]YY][.ss]'.

   If no options are given, -am is the default, using the current time.
   The -r, -t, and -d options are mutually exclusive.  If a file does not
   exist, create it unless -c is given.

   Written by Paul Rubin, Arnold Robbins, Jim Kingdon, David MacKenzie,
   and Randy Smith. */

#include <config.h>
#include <stdio.h>
#include <getopt.h>
#include <sys/types.h>

#include "system.h"
#include "error.h"
#include "argmatch.h"

#ifndef STDC_HEADERS
time_t time ();
#endif

time_t get_date ();
time_t posixtime ();
int safe_read ();
int full_write ();
void invalid_arg ();

#ifndef HAVE_UTIME_NULL
static int utime_now ();
#endif

/* Bitmasks for `change_times'. */
#define CH_ATIME 1
#define CH_MTIME 2

/* The name by which this program was run. */
char *program_name;

/* Which timestamps to change. */
static int change_times;

/* (-c) If nonzero, don't create if not already there. */
static int no_create;

/* (-d) If nonzero, date supplied on command line in get_date formats. */
static int flexible_date;

/* (-r) If nonzero, use times from a reference file. */
static int use_ref;

/* (-t) If nonzero, date supplied on command line in POSIX format. */
static int posix_date;

/* If nonzero, the only thing we have to do is change both the
   modification and access time to the current time, so we don't
   have to own the file, just be able to read and write it.  */
static int amtime_now;

/* New time to use when setting time. */
static time_t newtime;

/* File to use for -r. */
static char *ref_file;

/* Info about the reference file. */
static struct stat ref_stats;

/* If nonzero, display usage information and exit.  */
static int show_help;

/* If nonzero, print the version on standard output and exit.  */
static int show_version;

static struct option const longopts[] =
{
  {"time", required_argument, 0, 130},
  {"no-create", no_argument, 0, 'c'},
  {"date", required_argument, 0, 'd'},
  {"file", required_argument, 0, 'r'},
  {"reference", required_argument, 0, 'r'},
  {"help", no_argument, &show_help, 1},
  {"version", no_argument, &show_version, 1},
  {0, 0, 0, 0}
};

/* Valid arguments to the `--time' option. */
static char const* const time_args[] =
{
  "atime", "access", "use", "mtime", "modify", 0
};

/* The bits in `change_times' that those arguments set. */
static int const time_masks[] =
{
  CH_ATIME, CH_ATIME, CH_ATIME, CH_MTIME, CH_MTIME
};

/* Update the time of file FILE according to the options given.
   Return 0 if successful, 1 if an error occurs. */

static int
touch (char *file)
{
  int status;
  struct stat sbuf;
  int fd;

  if (stat (file, &sbuf))
    {
      if (errno != ENOENT)
	{
	  error (0, errno, "%s", file);
	  return 1;
	}
      if (no_create)
	return 0;
      fd = creat (file, 0666);
      if (fd == -1)
	{
	  error (0, errno, "%s", file);
	  return 1;
	}
      if (amtime_now)
	{
	  if (close (fd) < 0)
	    {
	      error (0, errno, "%s", file);
	      return 1;
	    }
	  return 0;		/* We've done all we have to. */
	}
      if (fstat (fd, &sbuf))
	{
	  error (0, errno, "%s", file);
	  close (fd);
	  return 1;
	}
      if (close (fd) < 0)
	{
	  error (0, errno, "%s", file);
	  return 1;
	}
    }

  if (amtime_now)
    {
#ifndef HAVE_UTIME_NULL
      status = utime_now (file, sbuf.st_size);
#else
      /* Pass NULL to utime so it will not fail if we just have
	 write access to the file, but don't own it.  */
      status = utime (file, NULL);
#endif
    }
  else
    {
      struct utimbuf utb;

      if (use_ref)
	{
	  utb.actime = ref_stats.st_atime;
	  utb.modtime = ref_stats.st_mtime;
	}
      else
	utb.actime = utb.modtime = newtime;

      if (!(change_times & CH_ATIME))
	utb.actime = sbuf.st_atime;

      if (!(change_times & CH_MTIME))
	utb.modtime = sbuf.st_mtime;

      status = utime (file, &utb);
    }

  if (status)
    {
      error (0, errno, "%s", file);
      return 1;
    }

  return 0;
}

#ifndef HAVE_UTIME_NULL
/* Emulate utime (file, NULL) for systems (like 4.3BSD) that do not
   interpret it to set the access and modification times of FILE to
   the current time.  FILESIZE is the correct size of FILE, used to
   make sure empty files are not lengthened to 1 byte.
   Return 0 if successful, -1 if not. */

static int
utime_now (const char *file, off_t filesize)
{
  int fd;
  char c;
  int status = 0;

  fd = open (file, O_RDWR, 0666);
  if (fd < 0
      || safe_read (fd, &c, sizeof (char)) < 0
      || lseek (fd, (off_t) 0, SEEK_SET) < 0
      || full_write (fd, &c, sizeof (char)) < 0
      || ftruncate (fd, filesize) < 0
      || close (fd) < 0)
    status = -1;
  return status;
}
#endif

static void
usage (int status)
{
  if (status != 0)
    fprintf (stderr, _("Try `%s --help' for more information.\n"),
	     program_name);
  else
    {
      printf (_("Usage: %s [OPTION]... FILE...\n"), program_name);
      printf (_("\
Update the access and modification times of each FILE to the current time.\n\
\n\
  -a                     change only the access time\n\
  -c                     do not create any files\n\
  -d, --date=STRING      parse STRING and use it instead of current time\n\
  -f                     (ignored)\n\
  -m                     change only the modification time\n\
  -r, --reference=FILE   use this file's times instead of current time\n\
  -t STAMP               use MMDDhhmm[[CC]YY][.ss] instead of current time\n\
      --time=WORD        access -a, atime -a, mtime -m, modify -m, use -a\n\
      --help             display this help and exit\n\
      --version          output version information and exit\n\
\n\
STAMP may be used without -t if none of -drt, nor --, are used.\n\
"));
      puts (_("\nReport bugs to fileutils-bugs@gnu.ai.mit.edu"));
    }
  exit (status);
}

int
main (int argc, char **argv)
{
  int c, i;
  int date_set = 0;
  int err = 0;

  program_name = argv[0];
  setlocale (LC_ALL, "");
  bindtextdomain (PACKAGE, LOCALEDIR);
  textdomain (PACKAGE);

  change_times = no_create = use_ref = posix_date = flexible_date = 0;
  newtime = (time_t) -1;

  while ((c = getopt_long (argc, argv, "acd:fmr:t:", longopts, (int *) 0))
	 != EOF)
    {
      switch (c)
	{
	case 0:
	  break;

	case 'a':
	  change_times |= CH_ATIME;
	  break;

	case 'c':
	  no_create++;
	  break;

	case 'd':
	  flexible_date++;
	  newtime = get_date (optarg, NULL);
	  if (newtime == (time_t) -1)
	    error (1, 0, _("invalid date format `%s'"), optarg);
	  date_set++;
	  break;

	case 'f':
	  break;

	case 'm':
	  change_times |= CH_MTIME;
	  break;

	case 'r':
	  use_ref++;
	  ref_file = optarg;
	  break;

	case 't':
	  posix_date++;
	  newtime = posixtime (optarg);
	  if (newtime == (time_t) -1)
	    error (1, 0, _("invalid date format `%s'"), optarg);
	  date_set++;
	  break;

	case 130:
	  i = argmatch (optarg, time_args);
	  if (i < 0)
	    {
	      invalid_arg (_("time selector"), optarg, i);
	      usage (1);
	    }
	  change_times |= time_masks[i];
	  break;

	default:
	  usage (1);
	}
    }

  if (show_version)
    {
      printf ("touch (%s) %s\n", GNU_PACKAGE, VERSION);
      exit (0);
    }

  if (show_help)
    usage (0);

  if (change_times == 0)
    change_times = CH_ATIME | CH_MTIME;

  if ((use_ref && (posix_date || flexible_date))
      || (posix_date && flexible_date))
    {
      error (0, 0, _("cannot specify times from more than one source"));
      usage (1);
    }

  if (use_ref)
    {
      if (stat (ref_file, &ref_stats))
	error (1, errno, "%s", ref_file);
      date_set++;
    }

  if (!date_set && optind < argc && strcmp (argv[optind - 1], "--"))
    {
      newtime = posixtime (argv[optind]);
      if (newtime != (time_t) -1)
	{
	  optind++;
	  date_set++;
	}
    }
  if (!date_set)
    {
      if ((change_times & (CH_ATIME | CH_MTIME)) == (CH_ATIME | CH_MTIME))
	amtime_now = 1;
      else
	time (&newtime);
    }

  if (optind == argc)
    {
      error (0, 0, _("file arguments missing"));
      usage (1);
    }

  for (; optind < argc; ++optind)
    err += touch (argv[optind]);

  exit (err != 0);
}
