/* rpmatch - determine whether string value is affirmation or negative
	     response according to current locale's data
Copyright (C) 1996 Free Software Foundation, Inc.

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

#ifdef HAVE_CONFIG_H
# include <config.h>
#endif

#if STDC_HEADERS || _LIBC
# include <stddef.h>
# include <stdlib.h>
#else
# ifndef NULL
#  define NULL 0
# endif
#endif

#include <sys/types.h>
#ifdef WITH_REGEX
# include <regex.h>
#else
# include <rx.h>
#endif

#if ENABLE_NLS
# include <libintl.h>
# define _(Text) gettext (Text)
#else
# define _(Text) Text
#endif

static int
try (response, pattern, match, nomatch, lastp, re)
     const char *response;
     const char *pattern;
     const int match;
     const int nomatch;
     const char **lastp;
     regex_t *re;
{
  if (pattern != *lastp)
    {
      /* The pattern has changed.  */
      if (*lastp)
	{
	  /* Free the old compiled pattern.  */
	  regfree (re);
	  *lastp = NULL;
	}
      /* Compile the pattern and cache it for future runs.  */
      if (regcomp (re, pattern, REG_EXTENDED) != 0)
	return -1;
      *lastp = pattern;
    }

  /* See if the regular expression matches RESPONSE.  */
  return regexec (re, response, 0, NULL, 0) == 0 ? match : nomatch;
}


int
rpmatch (response)
     const char *response;
{
  /* Match against one of the response patterns, compiling the pattern
     first if necessary.  */

  /* We cache the response patterns and compiled regexps here.  */
  static const char *yesexpr, *noexpr;
  static regex_t yesre, nore;
  int result;

  return ((result = try (response, _("^[yY]"), 1, 0,
			 &yesexpr, &yesre))
	  ? result
	  : try (response, _("^[nN]"), 0, -1, &noexpr, &nore));
}
