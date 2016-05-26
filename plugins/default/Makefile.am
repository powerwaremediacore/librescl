AM_VALAFLAGS=
INTLTOOL_FILES = intltool-extract.in \
                 intltool-merge.in \
                 intltool-update.in

sources= \
	DeviceDefault.vala \
	DeviceDefaultConnection.vala \
	DeviceDefaultDataSet.vala \
	DeviceDefaultGoExtRef.vala \
	DeviceDefaultGoose.vala \
	DeviceDefaultReport.vala

lib_LTLIBRARIES = liblscl-plugin-default-0.4.la


AM_CPPFLAGS = \
	-include $(CONFIG_HEADER) \
	-DPACKAGE_DATA_DIR=\""$(datadir)"\" \
	-DPACKAGE_LOCALE_DIR=\""$(prefix)/$(DATADIRNAME)/locale"\" \
	-DPACKAGE_SRC_DIR=\""$(srcdir)"\" \
	-DG_LOG_DOMAIN=\"lscl\"

AM_CFLAGS = \
	$(GXML_CFLAGS) \
	$(top_builddir)/librescl/liblscl-0.6.la

liblscl_plugin_default_0_4_la_LDFLAGS= \
	-version-info "$(LT_CURRENT)":"$(LT_REVISION)":"$(LT_AGE)"


if DEBUG
  AM_VALAFLAGS += \
    -D DEBUG \
    --enable-mem-profiler \
    -g
endif

AM_VALAFLAGS += \
	--vapidir=$(VAPIDIR) \
	$(top_srcdir)/vapi/config.vapi \
	$(top_builddir)/librescl/lscl-0.6.vapi \
	--pkg gxml-0.10 \
	-C -H lscl-plugin-default.h

liblscl_plugin_default_0_4_la_vala.stamp: $(sources)
	$(VALAC) $(AM_VALAFLAGS) $^

$(sources:.vala=.c): liblscl_plugin_default_0_4_la_vala.stamp

liblscl_plugin_default_0_4_la_SOURCES= $(sources:.vala=.c)

liblscl_plugin_default_0_4_la_LIBADD=$(GXML_LIBS)

lscl-plugin-default.h: liblscl_plugin_default_0_4_la_vala.stamp
headerdir = $(includedir)/librescl-$(API_VERSION)/librescl/plugins/default
header_HEADERS = lscl-plugin-default.h

#pkgconfigdir = $(libdir)/pkgconfig
#pkgconfig_DATA = lscl-plugin-default-0.4.pc


EXTRA_DIST = \
	$(sources)

BUILT_SOURCES = \
	liblscl_plugin_default_0_4_la_vala.stamp \
	lscl-plugin-default.h


CLEANFILES = \
	$(sources:.vala=.c) \
	lscl-plugin-default.h


if PLATFORM_WIN32
AM_VALAFLAGS += \
  --symbols=librescl-plugin-default.symbols

librescl-plugin-default.symbols: liblscl_plugin_default_0_4_la_vala.stamp

liblscl_plugin_default_0_4_la_LDFLAGS += -shared -o lscl-plugin-default-0.4.dll -no-undefined \
	-out-imlib -export-all-symbols -output-def

liblscl-plugin-default-0.4.def: librescl-plugin-default.symbols
	(echo -e EXPORTS; $(CPP) -P $(DEF_FLAGS) - <$(srcdir)/librescl-plugin-default.symbols | \
	 sed -e '/^$$/d' -e 's/^/ /' -e 's/G_GNUC_[^ ]*//g' | \
	 sort) > liblscl-plugin-default-0.4.def.tmp && mv liblscl-plugin-default-0.4.def.tmp liblscl-plugin-default-0.4.def

liblscl-plugin-default-0.4.def: liblscl-plugin-default-0.4.la
defdir=$(libdir)
def_DATA=liblscl-plugin-default-0.4.def

BUILT_SOURCES += \
	librescl-plugin-default.symbols \
	liblscl-plugin-default-0.4.def

CLEANFILES += \
	librescl-plugin-default.symbols \
	liblscl-plugin-default-0.4.def

endif
