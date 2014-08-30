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
	Test.vala \
	xml-generation-tests.vala \
	read-file.vala \
	lscl-performance.vala

AM_VALAFLAGS = \
	--vapidir=$(top_builddir)/librescl \
	$(top_srcdir)/vapi/config.vapi \
	--pkg glib-2.0 \
	--pkg gio-2.0 \
	--pkg gee-0.8 \
	--pkg gxml-0.4 \
	--pkg xom-0.4 \
	--pkg libxml-2.0 \
	--pkg lscl-0.2 \
	-C -g

lscl_test.stamp: $(sources)
	$(VALAC) $(AM_VALAFLAGS) $^

$(sources:.vala=.c): lscl_test.stamp

librescl_test_SOURCES = $(sources:.vala=.c)

librescl_test_LDFLAGS = \
	$(GXML_LIBS) \
	$(top_builddir)/librescl/liblscl-0.2.la

BUILT_SOURCES = \
	lscl_test.stamp


CLEANFILES = \
	$(sources:.vala=.c) \
	lscl_test.stamp \
	librescl_test \
	write_test.cid

EXTRA_DIST += \
	$(sources) \
	tests-files \
	tests-config.vala.in


