/*
 *    SAM-QFS_notice_begin
 *
 * CDDL HEADER START
 *
 * The contents of this file are subject to the terms of the
 * Common Development and Distribution License (the "License").
 * You may not use this file except in compliance with the License.
 *
 * You can obtain a copy of the license at pkg/OPENSOLARIS.LICENSE
 * or http://www.opensolaris.org/os/licensing.
 * See the License for the specific language governing permissions
 * and limitations under the License.
 *
 * When distributing Covered Code, include this CDDL HEADER in each
 * file and include the License file at pkg/OPENSOLARIS.LICENSE.
 * If applicable, add the following below this CDDL HEADER, with the
 * fields enclosed by brackets "[]" replaced with your own identifying
 * information: Portions Copyright [yyyy] [name of copyright owner]
 *
 * CDDL HEADER END
 */
/*
 * Copyright 2008 Sun Microsystems, Inc.  All rights reserved.
 * Use is subject to license terms.
 *
 *    SAM-QFS_notice_end
 */

#pragma ident "$Revision: 1.16 $"

#include <sam/fs/ino.h>

#define	STATVFS	statvfs64

struct releaser_info {
	char age_key;	/* A, M, R for access, modify, residence time, age */
	int	seg_num;	/* Segment number */
	clock_t age;	/* age of file */
	clock_t time;	/* corresponding time of file */
	long long size;	/* size of file in blocks */
};

struct data {
	sam_id_t id;
	struct releaser_info info;
};

boolean_t Daemon;
FILE	*log;	/* stream for logging */

#define	KEEP_HOW_MANY	10000
#define	LIST_MAX	1000000

/* Public functions. */
int finish();
void add_entry(float priority, struct data *data);
void init();
int read_cmd_file(char *cfgFname);
