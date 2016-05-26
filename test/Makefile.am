include $(top_srcdir)/gtester.mk

### General compilation flags
AM_CPPFLAGS = \
	-DPACKAGE_LOCALE_DIR=\""$(prefix)/$(DATADIRNAME)/locale"\" \
	-DPACKAGE_SRC_DIR=\""$(srcdir)"\" \
	-DPACKAGE_DATA_DIR=\""$(datadir)"\" \
	-DLIBRESCL_LOCALEDIR=\"${LIBRESCL_LOCALEDIR}\"

AM_CFLAGS = \
	-g \
	$(GXML_CFLAGS) \
	-I$(top_builddir)

noinst_PROGRAMS = $(TEST_PROGS)

TEST_PROGS += librescl_test

sources = \
	tests-config.vala \
	enums.vala \
	Test.vala \
	xml-generation-tests.vala \
	read-file.vala \
	save-file.vala \
	lscl-performance.vala \
	collectionstest.vala \
	private-test.vala

AM_VALAFLAGS = \
	--vapidir=$(VAPIDIR) \
	--vapidir=$(top_builddir)/librescl \
	--vapidir=$(top_srcdir)/vapi
	--pkg config \
	--pkg glib-2.0 \
	--pkg gio-2.0 \
	--pkg gee-0.8 \
	--pkg gxml-0.10 \
	--pkg libxml-2.0 \
	--pkg lscl-0.6 \
	-C -g


vala-stamp: $(sources)
	@rm -f vala-temp
	@touch vala-temp
	$(VALAC) $(AM_VALAFLAGS) $^
	@mv -f vala-temp $@

$(sources:.vala=.c): vala-stamp
## Recover from the removal of $@
	@if test -f $@; then :; else \
		trap ’rm -rf vala-lock vala-stamp’ 1 2 13 15; \
		if mkdir vala-lock 2>/dev/null; then \
## This code is being executed by the first process.
			rm -f vala-stamp; \
			$(MAKE) $(AM_MAKEFLAGS) vala-stamp; \
			rmdir vala-lock; \
		else \
## This code is being executed by the follower processes.
## Wait until the first process is done.
			while test -d vala-lock; do sleep 1; done; \
## Succeed if and only if the first process succeeded.
			test -f vala-stamp; exit $$?; \
		fi; \
	fi


librescl_test_SOURCES = $(sources:.vala=.c)

librescl_test_LDFLAGS = \
	$(GXML_LIBS) \
	$(top_builddir)/librescl/liblscl-0.6.la


CLEANFILES = \
	$(sources:.vala=.c) \
	librescl_test \
	write_test.cid \
	saved1.cid \
	vala-stamp

EXTRA_DIST += \
	$(sources) \
	tests-files \
	tests-config.vala.in


