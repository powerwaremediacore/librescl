AM_VALAFLAGS=


lib_LTLIBRARIES =  liblscl-0.2.la

sources = \
	namespace-info.vala \
	initialization.vala \
	Collections.vala \
	Serializable.vala \
	tAnyLN.vala \
	tLN0.vala \
	SclDocument.vala \
	Enums.vala \
	defaults.vala \
	tLnClassEnum.vala \
	tGSEControl.vala \
	tSampledValueControl.vala \
	tSettingControl.vala \
	tSCLControl.vala \
	tLog.vala \
	tSampledValueControlSmvOpts.vala \
	tUnNaming.vala \
	tDataSet.vala \
	tReportControl.vala \
	tLogControl.vala \
	tDOI.vala \
	tInputs.vala \
	tBaseElement.vala \
	tNaming.vala \
	tFCDA.vala \
	tControlWithTriggerOpt.vala \
	tReportControlOptFields.vala \
	tRptEnabled.vala \
	tSDI.vala \
	tDAI.vala \
	tText.vala \
	tControl.vala \
	tPrivate.vala \
	tLDevice.vala \
	tTrgOps.vala \
	tClientLN.vala \
	tVal.vala \
	tAccessControl.vala \
	LN0.vala \
	tLN.vala \
	SCL.vala \
	tAbstractConductingEquipment.vala \
	tAbstractDataAttribute.vala \
	tAccessPoint.vala \
	tAddress.vala \
	tAssociation.vala \
	tBasicType.vala \
	tBay.vala \
	tBDA.vala \
	tBitRateInMbPerSec.vala \
	tCommunication.vala \
	tConductingEquipment.vala \
	tConfLNs.vala \
	tConnectedAP.vala \
	tConnectivityNode.vala \
	tControlBlock.vala \
	tControlWithIEDName.vala \
	tDA.vala \
	tDataTypeTemplates.vala \
	tDAType.vala \
	tDO.vala \
	tDOType.vala \
	tDurationInMilliSec.vala \
	tDurationInSec.vala \
	tEnumType.vala \
	tEnumVal.vala \
	tEquipment.vala \
	tEquipmentContainer.vala \
	tFunction.vala \
	tGeneralEquipment.vala \
	tGSE.vala \
	tGSESettings.vala \
	tHeader.vala \
	tHitem.vala \
	tIDNaming.vala \
	tIED.vala \
	tLNode.vala \
	tLNodeContainer.vala \
	tLNodeType.vala \
	tLogSettings.vala \
	tP.vala \
	tPhysConn.vala \
	tPowerSystemResource.vala \
	tPowerTransformer.vala \
	tReportSettings.vala \
	tSDO.vala \
	tServer.vala \
	tServerAuthentication.vala \
	tServices.vala \
	tServiceSettings.vala \
	tServicesSettingGroups.vala \
	tServiceWithMax.vala \
	tServiceWithMaxAndClient.vala \
	tServiceWithMaxAndMaxAttributes.vala \
	tServiceWithMaxAndMaxAttributesAndModify.vala \
	tServiceWithMaxAndModify.vala \
	tServiceYesNo.vala \
	tSMV.vala \
	tSMVSettings.vala \
	tSubEquipment.vala \
	tSubFunction.vala \
	tSubNetwork.vala \
	tSubstation.vala \
	tTapChanger.vala \
	tTerminal.vala \
	tTransformerWinding.vala \
	tValueWithUnit.vala \
	tVoltage.vala \
	tVoltageLevel.vala \
	tExtRef.vala \
	utils.vala

AM_CPPFLAGS = \
	-include $(CONFIG_HEADER) \
	-DPACKAGE_DATA_DIR=\""$(datadir)"\" \
	-DPACKAGE_LOCALE_DIR=\""$(prefix)/$(DATADIRNAME)/locale"\" \
	-DPACKAGE_SRC_DIR=\""$(srcdir)"\" \
	-DG_LOG_DOMAIN=\"lscl\"

AM_CFLAGS = \
	$(GXML_CFLAGS)

liblscl_0_2_la_LDFLAGS= \
	-version-info "$(LT_CURRENT)":"$(LT_REVISION)":"$(LT_AGE)"


if DEBUG
  AM_VALAFLAGS += \
    -D DEBUG \
    --enable-mem-profiler \
    -g
endif

AM_VALAFLAGS += \
	$(top_srcdir)/vapi/config.vapi \
	--pkg gxml-0.4 \
	-C -H lscl.h \
	--library lscl-0.2

liblscl_0_2_la_LIBADD = $(GXML_LIBS)

lscl_0_2_la_vala.stamp: $(sources)
	$(VALAC) $(AM_VALAFLAGS) $^

$(sources:.vala=.c): lscl_0_2_la_vala.stamp

liblscl_0_2_la_SOURCES= $(sources:.vala=.c)

lscl.h: lscl_0_2_la_vala.stamp
lscldir = $(includedir)/librescl-$(API_VERSION)/librescl
lscl_HEADERS = lscl.h

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = lscl-0.2.pc

lscl-0.2.vapi: lscl_0_2_la_vala.stamp
vapidir = $(datadir)/vala/vapi
dist_vapi_DATA = \
	lscl-0.2.vapi \
	lscl-0.2.deps

EXTRA_DIST = \
	$(sources) \
	lscl-0.2.pc

BUILT_SOURCES = \
	lscl_0_2_la_vala.stamp \
	lscl.h \
	lscl-0.2.vapi


CLEANFILES = \
	$(sources:.vala=.c) \
	namespace-info.vala \
	lscl.h \
	lscl-0.2.vapi \
	lscl-0.2.pc

if HAVE_INTROSPECTION

AM_VALAFLAGS += \
	--gir=Lscl-0.2.gir


liblscl_dlname=\
	`$(SED) -n "s/^dlname='\([A-Za-z0-9.+-]\+\)'/\1/p" liblscl-0.2.la`

INTROSPECTION_GIRS = Lscl-$(API_VERSION).gir
INTROSPECTION_COMPILER_ARGS = --includedir=. -l $(liblscl_dlname)

Lscl-0.2.gir: lscl_0_2_la_vala.stamp
Lscl-0.2.typelib: $(INTROSPECTION_GIRS)
	$(INTROSPECTION_COMPILER) $(INTROSPECTION_COMPILER_ARGS)  $< -o $@

if GI_SYSTEM_INSTALL
girdir = $(INTROSPECTION_GIRDIR)
typelibsdir = $(INTROSPECTION_TYPELIBDIR)
else
girdir = $(datadir)/gir-1.0
typelibsdir = $(libdir)/girepository-1.0
endif

gir_DATA = $(INTROSPECTION_GIRS)
typelibs_DATA= Lscl-0.2.typelib

CLEANFILES += $(gir_DATA) $(typelibs_DATA)

endif

if PLATFORM_WIN32
AM_VALAFLAGS += \
  --symbols=librescl.symbols

librescl.symbols: lscl_0_2_la_vala.stamp

liblscl_0_2_la_LDFLAGS += -shared -o lscl-0.4.dll -no-undefined \
	-out-imlib -export-all-symbols -output-def

liblscl-0.2.def: librescl.symbols
	(echo -e EXPORTS; $(CPP) -P $(DEF_FLAGS) - <$(srcdir)/librescl.symbols | \
	 sed -e '/^$$/d' -e 's/^/ /' -e 's/G_GNUC_[^ ]*//g' | \
	 sort) > liblscl-0.2.def.tmp && mv liblscl-0.2.def.tmp liblscl-0.2.def

liblscl-0.2.def: liblscl-0.2.la
liblscldefdir=$(libdir)
liblscldef_DATA=liblscl-0.2.def

BUILT_SOURCES += \
	librescl.symbols \
	liblscl-0.2.def

CLEANFILES += \
	librescl.symbols \
	liblscl-0.2.def

endif


