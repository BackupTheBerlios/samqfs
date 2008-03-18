/* chmod -- change permission modes of files
   Copyright (C) 89, 90, 91, 95, 1996 Free Software Foundation, Inc.

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
   -R	Recursively change modes of directory contents.
   -c	Verbosely describe only files whose modes actually change.
   -f	Do not print error messages about files.
   -v	Verbosely describe changed modes.

   David MacKenzie <djm@gnu.ai.mit.edu> */

#include <config.h>
#include <stdio.h>
#include <getopt.h>
#include <sys/types.h>

#include "modechange.h"
#include "system.h"
#include "error.h"

void mode_string ();
char *savedir ();
void strip_trailing_slashes ();
char *xmalloc ();
char *xrealloc ();

static int change_dir_mode __P ((const char *dir,
				 const struct mode_change *changes,
				 const struct stat *statp));

/* The name the program was run with. */
char *program_name;

/* If nonzero, change the modes of directories recursively. */
static int recurse;

/* If nonzero, force silence (no error messages). */
static int force_silent;

/* If nonzero, describe the modes we set. */
static int verbose;

/* If nonzero, describe only modes that change. */
static int changes_only;

/* If nonzero, display usage information and exit.  */
static int show_help;

/* If nonzero, print the version on standard output and exit.  */
static int show_version;

static struct option const long_options[] =
{
  {"recursive", no_argument, 0, 'R'},
  {"changes", no_argument, 0, 'c'},
  {"silent", no_argument, 0, 'f'},
  {"quiet", no_argument, 0, 'f'},
  {"verbose", no_argument, 0, 'v'},
  {"help", no_argument, &show_help, 1},
  {"version", no_argument, &show_version, 1},
  {0, 0, 0, 0}
};

/* Tell the user the mode MODE that file FILE has been set to;
   if CHANGED is zero, FILE had that mode already. */

static void
describe_change (const char *file, short unsigned int mode, int changed)
{
  char perms[11];		/* "-rwxrwxrwx" ls-style modes. */

  mode_string (mode, perms);
  perms[10] = '\0';		/* `mode_string' does not null terminate. */
  if (changed)
    printf (_("mode of %s changed to %04o (%s)\n"),
	    file, mode & 07777, &perms[1]);
  else
    printf (_("mode of %s retained as %04o (%s)\n"),
	    file, mode & 07777, &perms[1]);
}

/* Change the mode of FILE according to the list of operations CHANGES.
   If DEREF_SYMLINK is nonzero and FILE is a symbolic link, change the
   mode of the referenced file.  If DEREF_SYMLINK is zero, ignore symbolic
   links.  Return 0 if successful, 1 if errors occurred. */

static int
change_file_mode (const char *file, const struct mode_change *changes,
		  const int deref_symlink)
{
  struct stat file_stats;
  unsigned short newmode;
  int errors = 0;

  if (lstat (file, &file_stats))
    {
      if (force_silent == 0)
	error (0, errno, "%s", file);
      return 1;
    }
#ifdef S_ISLNK
  if (S_ISLNK (file_stats.st_mode))
    {
      if (! deref_symlink)
	return 0;
      else
	if (stat (file, &file_stats))
	  {
	    if (force_silent == 0)
	      error (0, errno, "%s", file);
	    return 1;
	  }
    }
#endif

  newmode = mode_adjust (file_stats.st_mode, changes);

  if (newmode != (file_stats.st_mode & 07777))
    {
      if (verbose)
	describe_change (file, newmode, 1);
      if (chmod (file, (int) newmode) == 0)
	{
	  if (changes_only)
	    describe_change (file, newmode, 1);
	}
      else
	{
	  if (force_silent == 0)
	    error (0, errno, "%s", file);
	  errors = 1;
	}
    }
  else if (verbose && changes_only == 0)
    describe_change (file, newmode, 0);

  if (recurse && S_ISDIR (file_stats.st_mode))
    errors |= change_dir_mode (file, changes, &file_stats);
  return errors;
}

/* Recursively change the modes of the files in directory DIR
   according to the list of operations CHANGES.
   STATP points to the results of lstat on DIR.
   Return 0 if successful, 1 if errors occurred. */

static int
change_dir_mode (const char *dir, const struct mode_change *changes,
		 const struct stat *statp)
{
  char *name_space, *namep;
  char *path;			/* Full path of each entry to process. */
  unsigned dirlength;		/* Length of DIR and '\0'. */
  unsigned filelength;		/* Length of each pathname to process. */
  unsigned pathlength;		/* Bytes allocated for `path'. */
  int errors = 0;

  errno = 0;
  name_space = savedir (dir, statp->st_size);
  if (name_space == NULL)
    {
      if (errno)
	{
	  if (force_silent == 0)
	    error (0, errno, "%s", dir);
	  return 1;
	}
      else
	error (1, 0, _("virtual memory exhausted"));
    }

  dirlength = strlen (dir) + 1;	/* + 1 is for the trailing '/'. */
  pathlength = dirlength + 1;
  /* Give `path' a dummy value; it will be reallocated before first use. */
  path = xmalloc (pathlength);
  strcpy (path, dir);
  path[dirlength - 1] = '/';

  for (namep = name_space; *namep; namep += filelength - dirlength)
    {
      filelength = dirlength + strlen (namep) + 1;
      if (filelength > pathlength)
	{
	  pathlength = filelength * 2;
	  path = xrealloc (path, pathlength);
	}
      strcpy (path + dirlength, namep);
      errors |= change_file_mode (path, changes, 0);
    }
  free (path);
  free (name_space);
  return errors;
}

static void
usage (int status)
{
  if (status != 0)
    fprintf (stderr, _("Try `%s --help' for more information.\n"),
	     program_name);
  else
    {
      printf (_("\
Usage: %s [OPTION]... MODE[,MODE]... FILE...\n\
  or:  %s [OPTION]... OCTAL_MODE FILE...\n\
"),
	      program_name, program_name);
      printf (_("\
\n\
  -c, --changes           like verbose but report only when a change is made\n\
  -f, --silent, --quiet   suppress most error messages\n\
  -v, --verbose           output a diagnostic for every file processed\n\
  -R, --recursive         change files and directories recursively\n\
      --help              display this help and exit\n\
      --version           output version information and exit\n\
\n\
Each MODE is one or more of the letters ugoa, one of the symbols +-= and\n\
one or more of the letters rwxXstugo.\n\
"));
      puts (_("\nReport bugs to fileutils-bugs@gnu.ai.mit.edu"));
    }
  exit (status);
}

/* Parse the ASCII mode given on the command line into a linked list
   of `struct mode_change' and apply that to each file argument. */

int
main (int argc, char **argv)
{
  struct mode_change *changes;
  int errors = 0;
  int modeind = 0;		/* Index of the mode argument in `argv'. */
  int thisind;
  int c;

  program_name = argv[0];
  setlocale (LC_ALL, "");
  bindtextdomain (PACKAGE, LOCALEDIR);
  textdomain (PACKAGE);

  recurse = force_silent = verbose = changes_only = 0;

  while (1)
    {
      thisind = optind ? optind : 1;

      c = getopt_long (argc, argv, "RcfvrwxXstugoa,+-=", long_options,
		       (int *) 0);
      if (c == EOF)
	break;

      switch (c)
	{
	case 0:
	  break;
	case 'r':
	case 'w':
	case 'x':
	case 'X':
	case 's':
	case 't':
	case 'u':
	case 'g':
	case 'o':
	case 'a':
	case ',':
	case '+':
	case '-':
	case '=':
	  if (modeind != 0 && modeind != thisind)
	    error (1, 0, _("invalid mode"));
	  modeind = thisind;
	  break;
	case 'R':
	  recurse = 1;
	  break;
	case 'c':
	  changes_only = 1;
	  break;
	case 'f':
	  force_silent = 1;
	  break;
	case 'v':
	  verbose = 1;
	  break;
	default:
	  usage (1);
	}
    }

  if (show_version)
    {
      printf ("chmod (%s) %s\n", GNU_PACKAGE, VERSION);
      exit (0);
    }

  if (show_help)
    usage (0);

  if (modeind == 0)
    modeind = optind++;

  if (optind >= argc)
    {
      error (0, 0, _("too few arguments"));
      usage (1);
    }

  changes = mode_compile (argv[modeind],
			  MODE_MASK_EQUALS | MODE_MASK_PLUS | MODE_MASK_MINUS);
  if (changes == MODE_INVALID)
    error (1, 0, _("invalid mode"));
  else if (changes == MODE_MEMORY_EXHAUSTED)
    error (1, 0, _("virtual memory exhausted"));

  for (; optind < argc; ++optind)
    {
      strip_trailing_slashes (argv[optind]);
      errors |= change_file_mode (argv[optind], changes, 1);
    }

  exit (errors);
}
