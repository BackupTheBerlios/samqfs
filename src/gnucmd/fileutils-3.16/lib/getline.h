/*  Copyright (C) 1995 Free Software Foundation, Inc.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */

/* For the avoidance of doubt, except that if any license choice other
than GPL or LGPL is available it will apply instead, Sun elects to
use only the General Public License version 2 (GPLv2) at this time
for any software where a choice of GPL license versions is made
available with the language indicating that GPLv2 or any later
version may be used, or where a choice of which version of the GPL
is applied is otherwise unspecified. */

#ifndef GETLINE_H_
# define GETLINE_H_ 1

# include <stdio.h>

# ifndef PARAMS
#  if defined (__GNUC__) || __STDC__
#   define PARAMS(args) args
#  else
#   define PARAMS(args) ()
#  endif
# endif

int
getline PARAMS ((char **_lineptr, size_t *_n, FILE *_stream));

int
getdelim PARAMS ((char **_lineptr, size_t *_n, int _delimiter, FILE *_stream));

#endif /* not GETLINE_H_ */
