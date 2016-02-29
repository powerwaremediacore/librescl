AM_VALAFLAGS=


lib_LTLIBRARIES =  liblscl-0.6.la

sources = \
	namespace-info.vala \
	defaults.vala \
	initialization.vala \
	Device.vala \
	DeviceConnection.vala \
	DeviceDataRef.vala \
	DeviceDataSet.vala \
	DeviceGoExtRef.vala \
	DeviceGoose.vala \
	DeviceObject.vala \
	DeviceObjectRefence.vala \
	DeviceReport.vala \
	DuplicatedHashMap.vala \
	Collections.vala \
	Enums.vala \
	LN0.vala \
	SCL.vala \
	SclDocument.vala \
	Serializable.vala \
	ThreeMap.vala \
	tAbstractConductingEquipment.vala \
	tAbstractDataAttribute.vala \
	tAccessControl.vala \
	tAccessPoint.vala \
	tAddress.vala \
	tAnyContentFromOtherNamespace.vala \
	tAnyLN.vala \
	tAssociation.vala \
	tAssociationKind.vala \
	tAttributeName.vala \
	tBaseElement.vala \
	tBasicType.vala \
	tBay.vala \
	tBDA.vala \
	tBitRateInMbPerSec.vala \
	tCDCEnum.vala \
	tClientLN.vala \
	tCommunication.vala \
	tConductingEquipment.vala \
	tConfLNs.vala \
	tControl.vala \
	tConnectedAP.vala \
	tConnectivityNode.vala \
	tControlBlock.vala \
	tControlWithIEDName.vala \
	tControlWithTriggerOpt.vala \
	tDAI.vala \
	tDataSet.vala \
	tDataTypeTemplates.vala \
	tDAType.vala \
	tDA.vala \
	tDOI.vala \
	tDOType.vala \
	tDO.vala \
	tDurationInMilliSec.vala \
	tDurationInSec.vala \
	tEnumType.vala \
	tEnumVal.vala \
	tEquipmentContainer.vala \
	tEquipment.vala \
	tExtRef.vala \
	tFC.vala \
	tFCDA.vala \
	tFunction.vala \
	tGeneralEquipment.vala \
	tGSEControl.vala \
	tGSEControlType.vala \
	tGSESettings.vala \
	tGSE.vala \
	tHeader.vala \
	tHitem.vala \
	tIDNaming.vala \
	tIED.vala \
	tInputs.vala \
	tLDevice.vala \
	tLN0.vala \
	tLNClass.vala \
	tLNodeContainer.vala \
	tLNodeType.vala \
	tLNode.vala \
	tLN.vala \
	tLogControl.vala \
	tLogSettings.vala \
	tLog.vala \
	tNaming.vala \
	tPhysConn.vala \
	tPowerSystemResource.vala \
	tPowerTransformer.vala \
	tPredefinedGeneralEquipment.vala \
	tPrivate.vala \
	tP.vala \
	tReportControlOptFields.vala \
	tReportControl.vala \
	tReportSettings.vala \
	tRptEnabled.vala \
	tSampledValueControlSmvOpts.vala \
	tSampledValueControl.vala \
	tSCLControl.vala \
	tSDI.vala \
	tSDO.vala \
	tServerAuthentication.vala \
	tServer.vala \
	tServiceSettings.vala \
	tServicesSettingGroups.vala \
	tServices.vala \
	tServiceWithMaxAndClient.vala \
	tServiceWithMaxAndMaxAttributesAndModify.vala \
	tServiceWithMaxAndMaxAttributes.vala \
	tServiceWithMaxAndModify.vala \
	tServiceWithMax.vala \
	tServiceYesNo.vala \
	tSettingControl.vala \
	tSMVSettings.vala \
	tSMV.vala \
	tSubEquipment.vala \
	tSubFunction.vala \
	tSubNetwork.vala \
	tSubstation.vala \
	tSIUnitEnum.vala \
	tTapChanger.vala \
	tTerminal.vala \
	tText.vala \
	tTransformerWinding.vala \
	tTransformerWindingEnum.vala \
	tTrgOps.vala \
	tUnitMultiplier.vala \
	tUnNaming.vala \
	tValueWithUnit.vala \
	tValKind.vala \
	tVal.vala \
	tVoltageLevel.vala \
	tVoltage.vala \
	utils.vala

AM_CPPFLAGS = \
	-include $(CONFIG_HEADER) \
	-DPACKAGE_DATA_DIR=\""$(datadir)"\" \
	-DPACKAGE_LOCALE_DIR=\""$(prefix)/$(DATADIRNAME)/locale"\" \
	-DPACKAGE_SRC_DIR=\""$(srcdir)"\" \
	-DG_LOG_DOMAIN=\"lscl\"

AM_CFLAGS = \
	$(GXML_CFLAGS)

liblscl_0_6_la_LDFLAGS= \
	-version-info "$(LT_CURRENT)":"$(LT_REVISION)":"$(LT_AGE)"


if DEBUG
  AM_VALAFLAGS += \
    -D DEBUG \
    --enable-mem-profiler \
    -g
endif

AM_VALAFLAGS += \
	$(top_srcdir)/vapi/config.vapi \
	--pkg gxml-0.10 \
	-C -H lscl.h \
	--library lscl-0.6

liblscl_0_6_la_LIBADD = $(GXML_LIBS)


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

liblscl_0_6_la_SOURCES= $(sources:.vala=.c)

lscl.h: liblscl-0.6.la
lscldir = $(includedir)/librescl-$(API_VERSION)/librescl
lscl_HEADERS = lscl.h

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = lscl-0.6.pc

lscl-0.6.vapi: liblscl-0.6.la
vapidir = $(datadir)/vala/vapi
dist_vapi_DATA = \
	lscl-0.6.vapi \
	lscl-0.6.deps

EXTRA_DIST = \
	$(sources) \
	lscl-0.6.pc

BUILT_SOURCES = \
	lscl.h \
	lscl-0.6.vapi


CLEANFILES = \
	$(sources:.vala=.c) \
	namespace-info.vala \
	lscl.h \
	lscl-0.6.vapi \
	lscl-0.6.pc

if HAVE_INTROSPECTION

AM_VALAFLAGS += \
	--gir=Lscl-0.6.gir


liblscl_dlname=\
	`$(SED) -n "s/^dlname='\([A-Za-z0-9.+-]\+\)'/\1/p" liblscl-0.6.la`

INTROSPECTION_GIRS = Lscl-$(API_VERSION).gir
INTROSPECTION_COMPILER_ARGS = --includedir=. -l $(liblscl_dlname)

Lscl-0.6.gir: liblscl-0.6.la
Lscl-0.6.typelib: $(INTROSPECTION_GIRS)
	$(INTROSPECTION_COMPILER) $(INTROSPECTION_COMPILER_ARGS)  $< -o $@

if GI_SYSTEM_INSTALL
girdir = $(INTROSPECTION_GIRDIR)
typelibsdir = $(INTROSPECTION_TYPELIBDIR)
else
girdir = $(datadir)/gir-1.0
typelibsdir = $(libdir)/girepository-1.0
endif

gir_DATA = $(INTROSPECTION_GIRS)
typelibs_DATA= Lscl-0.6.typelib

CLEANFILES += $(gir_DATA) $(typelibs_DATA)

endif

if PLATFORM_WIN32
AM_VALAFLAGS += \
  --symbols=librescl.symbols

librescl.symbols: liblscl-0.6.la

liblscl_0_6_la_LDFLAGS += -shared -o lscl-0.6.dll -no-undefined \
	-out-imlib -export-all-symbols -output-def

liblscl-0.6.def: librescl.symbols
	(echo -e EXPORTS; $(CPP) -P $(DEF_FLAGS) - <$(srcdir)/librescl.symbols | \
	 sed -e '/^$$/d' -e 's/^/ /' -e 's/G_GNUC_[^ ]*//g' | \
	 sort) > liblscl-0.6.def.tmp && mv liblscl-0.6.def.tmp liblscl-0.6.def

liblscl-0.6.def: liblscl-0.6.la
liblscldefdir=$(libdir)
liblscldef_DATA=liblscl-0.6.def

BUILT_SOURCES += \
	librescl.symbols \
	liblscl-0.6.def

CLEANFILES += \
	librescl.symbols \
	liblscl-0.6.def

endif


