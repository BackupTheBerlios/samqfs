# $Revision: 1.41 $

#    SAM-QFS_notice_begin
#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at pkg/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at pkg/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright 2009 Sun Microsystems, Inc.  All rights reserved.
# Use is subject to license terms.
#
#    SAM-QFS_notice_end

#	sun.mk - definitions for a Sun build environment

#	uname -p output:
#	32-bit sparc: sparc
#	64-bit sparc: sparc
#	32-bit amd64: i386
#	64-bit amd64: i386

#	isainfo -k output:
#	32-bit sparc: sparc
#	64-bit sparc: sparcv9
#	32-bit amd64: i386
#	64-bit amd64: amd64

OS_REVISION := $(shell uname -r)
PLATFORM := $(shell uname -p)
ISA_KERNEL := $(shell isainfo -k)

#
# set sparc/i386 specific options
#
PLATFLAGS := -Xa
ifeq ($(PLATFORM), sparc)
	ifeq ($(SPARCV9), yes)
		64DIR := /sparcv9
		ISA_TARGET := sparcv9
		PLATFLAGS += -m64 -xchip=ultra2
	else
		ISA_TARGET := sparc
		PLATFLAGS += -m32 -xchip=ultra2
	endif
	KERNFLAGS := -xregs=no%float
endif
ifeq ($(PLATFORM), i386)
	ifeq ($(AMD64), yes)
		64DIR := /amd64
		ISA_TARGET := amd64
		ifeq ($(OS_REVISION), 5.10)
			PLATFLAGS += -xarch=amd64 -Ui386 -U__i386
		else
		ifeq ($(OS_REVISION), 5.11)
			PLATFLAGS += -m64 -Ui386 -U__i386
		else
		$(error "Unknown Solaris version $(OS_REVISION)")
		endif
		endif
		KERNFLAGS := -xmodel=kernel -Wu,-save_args
	else
		ISA_TARGET := i386
	endif
endif

#
# turn compiler warnings into errors
#
CERRWARN := -errtags=yes -errwarn=%all

#
# Solaris common commands
#
PERL = /usr/bin/perl
BISON_KLUDGE = /usr/bin/bison

AWK = /usr/bin/nawk
INSTALL = /usr/ucb/install
MAKEDEPEND = /usr/openwin/bin/makedepend

CMDECHO = /usr/bin/echo
CMDMCS = /usr/ccs/bin/mcs
CMDWHOAMI = /usr/xpg4/bin/who

MSGDEST = $(BASEDIR)/usr/lib/locale/C/LC_MESSAGES

COPYRIGHT = $(SAMFS_TOOLS)/bin/copyright

CSTYLE = $(SAMFS_TOOLS)/bin/cstyle
CSTYLETREE = $(SAMFS_TOOLS)/bin/cstyletree

#
# Solaris version specific commands
#
OS_ARCH := $(OS)_$(OS_REVISION)_$(ISA_TARGET)
VERS := $(shell $(CMDECHO) -DSOL`uname -r | cut -d . -f1-2 | tr . _` )

ifeq ($(OS_REVISION), 5.10)
	OS_VERS := Solaris 10
	CC = /opt/solarisstudio12.3/bin/cc
	LINT = /opt/solarisstudio12.3/bin/lint
	CSCOPE = /opt/solarisstudio12.3/bin/cscope
else
ifeq ($(OS_REVISION), 5.11)
	OS_VERS := Solaris 11
	CC = /opt/solarisstudio12.3/bin/cc
	LINT = /opt/solarisstudio12.3/bin/lint
	CSCOPE = /opt/solarisstudio12.3/bin/cscope
#	CC = $(SAMFS_TOOLS)/SS12/bin/cc
#	LINT = $(SAMFS_TOOLS)/SS12/bin/lint
#	CSCOPE = $(SAMFS_TOOLS)/SS12/bin/cscope
else
$(error "Unknown Solaris version $(OS_REVISION)")
endif
endif

LD = $(CC)
GCC = $(SAMFS_TOOLS)/gcc/4.4.4/bin/gcc

#
# Kernel Stabs (Symbol TABle entrieS) support.  Each Solaris release
# should use the corresponding Solaris ON tools.
#
ifeq ($(OS_REVISION), 5.10)
	CTFCONVERT = $(SAMFS_TOOLS)/on10-tools/bin/$(PLATFORM)/ctfconvert
	CTFCVTFLAGS = -l $(SAMQFS_VERSION)
	CTFCONVERT_CMD = $(CTFCONVERT) $(CTFCVTFLAGS) $@

	CTFMERGE = $(SAMFS_TOOLS)/on10-tools/bin/$(PLATFORM)/ctfmerge
	CTFMRGFLAGS = -l $(SAMQFS_VERSION)
	CTFMERGE_CMD = cd $(OBJ_DIR); $(CTFMERGE) $(CTFMRGFLAGS) -o $(MODULE) $(MODULE_OBJS_BASE)
else
ifeq ($(OS_REVISION), 5.11)
	CTFCONVERT = $(SAMFS_TOOLS)/onbld/bin/$(PLATFORM)/ctfconvert
	CTFCVTFLAGS = -l $(SAMQFS_VERSION)
	CTFCONVERT_CMD = $(CTFCONVERT) $(CTFCVTFLAGS) $@

	CTFMERGE = $(SAMFS_TOOLS)/onbld/bin/$(PLATFORM)/ctfmerge
	CTFMRGFLAGS = -l $(SAMQFS_VERSION)
	CTFMERGE_CMD = cd $(OBJ_DIR); $(CTFMERGE) $(CTFMRGFLAGS) -o $(MODULE) $(MODULE_OBJS_BASE)
else
$(error "Unknown Solaris version $(OS_REVISION)")
endif
endif

#
# This is to enable the build of the SunCluster agent for SAM-QFS.
# This requires that SUNWscdev be installed on the build machine.
# To force the build, set BUILD_SC_AGENT to yes.
#
ifeq ($(COMPLETE), yes)
	BUILD_SC_AGENT = yes
endif
ifeq ($(shell [ ! -d /usr/cluster/include ] || echo "yes"), yes)
	BUILD_SC_AGENT = yes
endif

#
# Set additional debug options (generate symbols for all architectures)
#
DEBUGCFLAGS += -g
ifeq ($(PLATFORM), sparc)
	# The "-Wc,-Qiselect-T1" enables tail-call optimization when using "-g".
	DEBUGCFLAGS += -Wc,-Qiselect-T1
endif

#
# New java setup rules
#
# JBASE = /usr/java
JBASE = /usr/jdk/instances/jdk1.6.0
JPKG = $(DEPTH)/pkg/vendor/java
JBASEINC = $(JBASE)/include
JBASEBIN = $(JBASE)/bin
JSOLINC = $(JBASE)/include/solaris
J3LIB = $(DEPTH)/src/java/jcbwt.jar
JRETAR = $(JPKG)/jre.tar
JCLSPATH = $(JBASE)/lib/classes.zip:$(J3LIB):$(DEPTH)/src/java:.
#JDEBUG = -deprecation
JFLAGS = -classpath $(JCLSPATH)
JC = $(JBASEBIN)/javac
JP = $(JBASEBIN)/javap
JH = $(JBASEBIN)/javah
JAR = $(JBASEBIN)/jar
JD = $(JBASEBIN)/javadoc
ANT = /opt/csw/bin/ant

#
# Berkeley DB definitions
#
ifeq ($(PLATFORM), sparc)
	ifeq ($(SPARCV9), yes)
		DB_ARCH = solaris_sparcv9
	else
		DB_ARCH = solaris_sparc
	endif
endif
ifeq ($(PLATFORM), i386)
	ifeq ($(AMD64), yes)
		DB_ARCH = amd_64
	else
		DB_ARCH = i386
	endif
endif
DB_VERSION = V4/4.5.20
DB_INCLUDE = $(DEPTH)/src/lib/bdb/$(DB_VERSION)/$(OS_ARCH)/include
DB_LIB = -ldb

#
# MySQL DB definitions
#
ifeq ($(PLATFORM), i386)
	MYSQL_ARCH = i386
else
	MYSQL_ARCH = sparc
endif
MYSQL_VERSION = V5/5.0.51a
MYSQL_INCLUDE = -I$(DEPTH)/src/lib/mysql/$(MYSQL_VERSION)/$(MYSQL_ARCH)/include
MYSQL_LIB = -lmysqlclient
MYSQL_LIB_R = -lmysqlclient_r

#
# StorageTek 5800 API definitions
#
# ifeq ($(PLATFORM), sparc)
# 	HC_ARCH = sol_10_sparc
# endif
# ifeq ($(PLATFORM), i386)
# 	HC_ARCH = sol_10_x86
# endif
# HC_VERSION = StorageTek5800_SDK_1_1_74
# HC_INCLUDE = -I$(DEPTH)/src/lib/honeycomb/$(HC_VERSION)/include -I$(DEPTH)/src/lib/honeycomb/$(HC_VERSION)/$(HC_ARCH)/include
# HC_LIB = -lstk5800

#
# mcs definitions
#
MCSOPT = $(shell echo "-c -a '@(=)Copyright (c) `/bin/date +%Y`, Sun Microsystems, Inc.  All Rights Reserved' -a '@(=)Built `/bin/date +%D` by `$(CMDWHOAMI)` on `/bin/uname -n` `/bin/uname -s` `/bin/uname -r`.'" | /bin/tr = '\043')
MCS = $(CMDMCS) $(MCSOPT)

#
# libraries to link with when using threads
#
THRLIBS = -lpthread -lthread

METADATA_SERVER = -DMETADATA_SERVER

# not build IBM Tivoly support
NO_BUILD_SANERGY = -D_NoTIVOLI_
# not build ST5800 and ACSLS
NO_BUILD_STK = -D_NoSTK_
# not build OSD
NO_BUILD_OSD = -D_NoOSD_

#
# Final default CFLAGS settings
#
LIBSO_OPT = -R
STATIC_OPT = -Bstatic
DYNAMIC_OPT = -Bdynamic
SHARED_CFLAGS = -G -K PIC
DEPCFLAGS = -I$(INCLUDE) $(VERS) $(METADATA_SERVER) $(NO_BUILD_SANERGY) $(NO_BUILD_STK) $(NO_BUILD_OSD)

