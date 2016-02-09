m4_define([project_major_version], [0])
m4_define([project_minor_version], [4])
m4_define([project_micro_version], [0])

# LT_VERSION
#   If library source has changed since last release, increment revision
#   If public symbols have been added, removed or changed since last release,
#     increment current and set revision to 0
#   If public symbols have been added since last release, increment age
#   If public symbols have been removed since last release, set age to 0
m4_define([project_lt_current], [4])
m4_define([project_lt_revision], [0])
m4_define([project_lt_age], [0])

m4_define([project_version],project_major_version.project_minor_version.project_micro_version)

AC_CONFIG_MACRO_DIR([m4])

AC_INIT([LibreSCL],[project_version],[liblscl])
AC_SUBST(LSCL_ABI_MAJOR_VERSION, project_major_version)
AC_SUBST(LSCL_ABI_MINOR_VERSION, project_minor_version)
AC_SUBST(LSCL_ABI_MICRO_VERSION, project_micro_version)
AC_CONFIG_MACRO_DIR([m4])

AC_CONFIG_HEADERS([config.h])

AM_INIT_AUTOMAKE

AM_SILENT_RULES([yes])

AC_PROG_CC


LT_INIT(win32-dll)

LT_CURRENT=project_lt_current
LT_REVISION=project_lt_revision
LT_AGE=project_lt_age
AC_SUBST([LT_CURRENT])
AC_SUBST([LT_REVISION])
AC_SUBST([LT_AGE])

LIBRESCL_VERSION=project_version
AC_SUBST(LIBRESCL_VERSION)
API_VERSION=0.4
AC_SUBST(API_VERSION)
IT_PROG_INTLTOOL([0.35.0])

GETTEXT_PACKAGE=librescl-project_version
AC_SUBST(GETTEXT_PACKAGE)
AC_DEFINE_UNQUOTED([GETTEXT_PACKAGE], ["$GETTEXT_PACKAGE"],
                   [The domain to use with gettext])
AM_GLIB_GNU_GETTEXT

LIBRESCL_LOCALEDIR=[${datadir}/locale]
AC_SUBST(LIBRESCL_LOCALEDIR)

case "$host" in
*-mingw*)
    platform_win32=yes
    ;;
*)
esac
AM_CONDITIONAL(PLATFORM_WIN32, [test $platform_win32 = yes])

gi_system_install=no
AC_ARG_ENABLE(gi-system-install,
	AS_HELP_STRING([--enable-gi-system-install], [Enable Intalling GIR/TYPELIB GI to System [default=no]]),
        [gi_system_install=$enableval], [gi_system_install="no"])

AM_CONDITIONAL(GI_SYSTEM_INSTALL, [test $gi_system_install = yes])

debug=no
AC_ARG_ENABLE(debug,
	AS_HELP_STRING([--enable-debug], [Enable Debug options [default=no]]),
        [debug=$enableval], [debug="no"])

AM_CONDITIONAL(DEBUG, [test $debug = yes])


dnl Check for vala
VALAC_CHECK

dnl Test directory

PKG_CHECK_MODULES(GXML,gio-2.0
glib-2.0
gobject-2.0
gee-0.8 >= 0.10
gxml-0.6 >= 0.8.2)

PKG_CHECK_MODULES(GMODULE,gmodule-2.0)


GOBJECT_INTROSPECTION_CHECK([1.30.0])

AC_OUTPUT([ po/Makefile.in
Makefile
vapi/Makefile
librescl/namespace-info.vala
librescl/Makefile
librescl/lscl-0.4.pc
test/Makefile
test/tests-config.vala
plugins/Makefile
plugins/default/Makefile
scripts/Makefile

])

echo ""
echo " Configuration summary for LibreSCL Version: $LIBRESCL_VERSION"
echo "   Installation prefix:  $prefix"
echo "   GObject Introspection $found_introspection"
echo "   Documentation:        $have_valadoc"
echo "   Debug:                $debug"
echo ""
