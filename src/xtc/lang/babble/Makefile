# Makefile
#***************************************************************************
#
# Master Makefile
#
# (C) 1999 Jacob Dreyer - Geotechnical Software Services
# jacob.dreyer@geosoft.no - http://geosoft.no
#
# Modifications Copyright (C) 2001-2007 Robert Grimm
# rgrimm@alum.mit.edu
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
#
#***************************************************************************

ifdef JAVA_DEV_ROOT
include $(JAVA_DEV_ROOT)/Makebase
endif

#***************************************************************************
#
# Packages
#
# Use fully qualified package names for the list of packages.
#
#***************************************************************************

PACKAGES = \
	xtc.lang.babble.boat \
	xtc.lang.babble.brooklet \
	xtc.lang.babble.sql \
	xtc.lang.babble.cql \
	xtc.lang.babble.jdl \
	xtc.lang.babble.optimizer \
	xtc.lang.babble.sawzall \
	xtc.lang.babble.ra \
	xtc.lang.babble.sra \
	xtc.lang.babble.streamit \
	xtc.lang.babble.texttemplate \
	xtc.lang.babble.util \
	xtc.lang.babble.watson 

#***************************************************************************
#
# Rules and dependencies.
#
# The following commands are valid:
#
#  1. make configure       - Configure local system's xtc.Limits
#  2. make classes         - Make all class files for all packages
#  3. make                 - Same as (2)
#  4. make parsers         - Make all parsers
#  5. make analyzers       - Make all Typical-based semantic analyzers
#  6. make doc             - Make all documentation
#  7. make jars            - Make binary distribution
#  8. make dist            - Make source distribution
#  9. make stats           - Print source code statistics
# 10. make check           - Run all regression tests
# 11. make clean           - Clean classes
# 12. make clobber         - Clean classes, documentation, distributions
# 13. make clobber-parsers - Clean parser sources
#
#
# For the CLASS, JNI, JAR, and CLEAN variables, all backslashes are
# replaced by forward slashes. This substitution is only important
# when using this makefile on Windows. When building in an MS-DOS
# shell, make treats both backslash and forward slash as a path
# segment delimiter. However, Unix shells, such as bash, require
# forward slashes. File names passed to the Java tools may have a mix
# of backslash and forward slash, because they treat both as a path
# segment delimiter.
#
#***************************************************************************

PACK_PATHS  = $(subst .,/,$(PACKAGES))
CLASS       = $(subst \,/,$(PACK_PATHS:%=$(SOURCE_DIR)/%.class))
PARSER      = $(subst \,/,$(PACK_PATHS:%=$(SOURCE_DIR)/%.parser))
ANALYZER    = $(subst \,/,$(PACK_PATHS:%=$(SOURCE_DIR)/%.analyzer))
FACTORY     = $(subst \,/,$(PACK_PATHS:%=$(SOURCE_DIR)/%.factory))
CLEAN       = $(subst \,/,$(PACK_PATHS:%=$(SOURCE_DIR)/%.clean))

.PHONY  : default classes parsers factories
.PHONY  : configure clean clobber clobber-parsers
.PHONY  : all doc jars dist stats

default : classes

classes : $(CLASS)
%.class :
	$(MAKE) -C $* classes

parsers  : $(PARSER)
%.parser :
	$(MAKE) -C $* parsers

analyzers  : $(ANALYZER)
%.analyzer :
	$(MAKE) -C $* analyzers

factories : $(FACTORY)
%.factory :
	$(MAKE) -C $* factories

RUNTESTFLAGS = 

check : site.exp all
	runtest $(RUNTESTFLAGS) --tool babble


clean   : $(CLEAN)
%.clean :
	$(MAKE) -C $* clean

clobber-parsers :
ifdef JAVA_DEV_ROOT
	$(RM) $(SOURCE_DIR)/xtc/lang/babble/boat/FactoryParser.java
	$(RM) $(SOURCE_DIR)/xtc/lang/babble/boat/Parser.java
	$(RM) $(SOURCE_DIR)/xtc/lang/babble/brooklet/BrookletParser.java
	$(RM) $(SOURCE_DIR)/xtc/lang/babble/sql/SQLParser.java
	$(RM) $(SOURCE_DIR)/xtc/lang/babble/cql/CQLParser.java
	$(RM) $(SOURCE_DIR)/xtc/lang/babble/jdl/JDLParser.java
	$(RM) $(SOURCE_DIR)/xtc/lang/babble/sawzall/SawzallParser.java
	$(RM) $(SOURCE_DIR)/xtc/lang/babble/sra/RAParser.java
	$(RM) $(SOURCE_DIR)/xtc/lang/babble/sra/SRAParser.java
	$(RM) $(SOURCE_DIR)/xtc/lang/babble/streamit/StreamItParser.java
	$(RM) $(SOURCE_DIR)/xtc/lang/babble/texttemplate/TextTemplateParser.java
endif
