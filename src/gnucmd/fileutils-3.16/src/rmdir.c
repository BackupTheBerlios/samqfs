/* rmdir -- remove directories
   Copyright (C) 90, 91, 95, 1996 Free Software Foundation, Inc.

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
   -p, --parent		Remove any parent dirs that are explicitly mentioned
			in an argument, if they become empty after the
			argument file is removed.

   David MacKenzie <djm@ai.mit.edu>  */

#include <config.h>
#include <stdio.h>
#include <getopt.h>
#include <sys/types.h>

#include "system.h"
#include "error.h"

void strip_trailing_slashes ();

/* The name this program was run with. */
char *program_name;

/* If nonzero, remove empty parent directories. */
static int empty_paths;

/* If nonzero, display usage information and exit.  */
static int show_help;

/* If nonzero, print the version on standard output and exit.  */
static int show_version;

static struct option const longopts[] =
{
  {"path", no_argument, &empty_paths, 1},
  {"parents", no_argument, &empty_paths, 1},
  {"help", no_argument, &show_help, 1},
  {"version", no_argument, &show_version, 1},
  {NULL, 0, NULL, 0}
};

/* Remove any empty parent directories of `path'.
   Replaces '/' characters in `path' with NULs. */

static void
remove_parents (char *path)
{
  char *slash;

  do
    {
      slash = strrchr (path, '/');
      if (slash == NULL)
	break;
      /* Remove any characters after the slash, skipping any extra
	 slashes in a row. */
      while (slash > path && *slash == '/')
	--slash;
      slash[1] = 0;
    }
  while (rmdir (path) == 0);
}

static void
usage (int status)
{
  if (status != 0)
    fprintf (stderr, _("Try `%s --help' for more information.\n"),
	     program_name);
  else
    {
      printf (_("Usage: %s [OPTION]... DIRECTORY...\n"), program_name);
      printf (_("\
Remove the DIRECTORY(ies), if they are empty.\n\
\n\
  -p, --parents   remove explicit parent directories if being emptied\n\
      --help      display this help and exit\n\
      --version   output version information and exit\n\
"));
      puts (_("\nReport bugs to fileutils-bugs@gnu.ai.mit.edu"));
    }
  exit (status);
}

int
main (int argc, char **argv)
{
  int errors = 0;
  int optc;

  program_name = argv[0];
  setlocale (LC_ALL, "");
  bindtextdomain (PACKAGE, LOCALEDIR);
  textdomain (PACKAGE);

  empty_paths = 0;

  while ((optc = getopt_long (argc, argv, "p", longopts, (int *) 0)) != EOF)
    {
      switch (optc)
	{
	case 0:			/* Long option. */
	  break;
	case 'p':
	  empty_paths = 1;
	  break;
	default:
	  usage (1);
	}
    }

  if (show_version)
    {
      printf ("rmdir (%s) %s\n", GNU_PACKAGE, VERSION);
      exit (0);
    }

  if (show_help)
    usage (0);

  if (optind == argc)
    {
      error (0, 0, _("too few arguments"));
      usage (1);
    }

  for (; optind < argc; ++optind)
    {
      /* Stripping slashes is harmless for rmdir;
	 if the arg is not a directory, it will fail with ENOTDIR.  */
      strip_trailing_slashes (argv[optind]);
      if (rmdir (argv[optind]) != 0)
	{
	  error (0, errno, "%s", argv[optind]);
	  errors = 1;
	}
      else if (empty_paths)
	remove_parents (argv[optind]);
    }

  exit (errors);
}
