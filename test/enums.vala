/* -*- Mode: vala; indent-tabs-mode: t; c-basic-offset: 2; tab-width: 2 -*-  */
/* librescl
 *
 * Copyright (C) 2013. 2014 Daniel Espinosa <esodan@gmail.com>
 *
 * librescl is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * librescl is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along
 * with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
using Lscl;
using GXml;

public class LsclTest.Enums
{
	public class EnumTest : GomElement
	{
		public tAssociationKind kind { get; set; }
		[Description (nick="::AttributeName")]
		public tAttributeName attr_name { get; set; }
		[Description (nick="::BasicType")]
		public tBasicType btype { get; set; }
		[Description (nick="::CDCEnum")]
		public tCDCEnum cdc { get; set; }
		[Description (nick="::condEq")]
		public tCommonConductingEquipment ceq { get; set; }
		[Description (nick="::ServiceType")]
		public tServiceType st { get; set; }
		[Description (nick="::FC")]
		public tFC fc { get; set; }
		[Description (nick="::GSEType")]
		public tGSEControlType gsect { get; set; }
		[Description (nick="::nameStructure")]
		public tNameStructure namestruct { get; set; }
		[Description (nick="::PhysConn")]
		public tPhysConnType phc { get; set; }
		[Description (nick="::PhysConnType")]
		public tPTypePhysConn phct { get; set; }
		[Description (nick="::PwTrnType")]
		public tPowerTransformerType pwt { get; set; }
		[Description (nick="::GEquiment")]
		public tGeneralEquipmentEnum ge { get; set; }
		[Description (nick="::smpMod")]
		public tSmpMod smpm { get; set; }
		[Description (nick="::ServiceSett")]
		public tServiceSettingsType svt { get; set; }
		[Description (nick="::SIUnit")]
		public tSIUnit siu { get; set; }
		[Description (nick="::Phase")]
		public tPhase ph { get; set; }
		[Description (nick="::TrWnd")]
		public tTransformerWindingEnum twt { get; set; }
		[Description (nick="::UM")]
		public tUnitMultiplier tum { get; set; }
		[Description (nick="::Vk")]
		public tValKind vk { get; set; }
		construct {
      try { initialize ("NodeTest"); }
      catch (GLib.Error e) { warning ("Error: "+e.message); }
    }
	}
	public static void add_funcs ()
	{
		Test.add_func ("/librescl-test-suite/enums/association-kind/write", 
		() => {
			try {
				var t = new EnumTest ();
				t.kind = new tAssociationKind ();
				t.kind.set_enum (tAssociationKind.Enum.PREESTABLISHED);
				var d = new GomDocument.from_string (t.write_string ());
				var r = d.document_element;
				assert (r != null);
				assert (r.node_name == "NodeTest");
				assert (r.get_attribute ("kind") == "PREESTABLISHED");
			}
			catch (GLib.Error e)
			{
				stdout.printf (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/association-kind/read", 
		() => {
			try {
				var t = new EnumTest ();
				t.read_from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest kind = "PREDEFINED" />""");
				assert (t.kind != null);
				assert (t.kind.get_enum () == tAssociationKind.Enum.PREDEFINED);
				assert (t.kind.value == "PREDEFINED");
			}
			catch (GLib.Error e)
			{
				GLib.message (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/attribute-name/write", 
		() => {
			try {
				var t = new EnumTest ();
				t.attr_name = new tAttributeName ();
				t.attr_name.select (tPredefinedAttributeName.Enum.OPER_TM);
				var d = new GomDocument.from_string (t.write_string ());
				var r = d.document_element;
				assert (r != null);
				assert (r.node_name == "NodeTest");
				assert (r.get_attribute ("AttributeName") == "operTm");
			}
			catch (GLib.Error e)
			{
				stdout.printf (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/attribute-name/read",
		() => {
			try {
				var t = new EnumTest ();
				t.read_from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest AttributeName = "sboTimeout" />""");
				assert (t.attr_name != null);
				assert (t.attr_name.value == "sboTimeout");
			}
			catch (GLib.Error e)
			{
				GLib.message (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/basic-type/write",
		() => {
			try {
				var t = new EnumTest ();
				t.btype = new tBasicType ();
				t.btype.set_enum (tBasicType.Enum.FLOAT32);
				var d = new GomDocument.from_string (t.write_string ());
				var r = d.document_element;
				assert (r != null);
				assert (r.node_name == "NodeTest");
				(r.get_attribute ("BasicType") == "Float32");
			}
			catch (GLib.Error e)
			{
				stdout.printf (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/basic-type/read", 
		() => {
			try {
				var t = new EnumTest ();
				t.read_from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest BasicType = "QUALITY" />""");
				assert (t.btype != null);
				assert (t.btype.get_enum () == tBasicType.Enum.QUALITY);
				assert (t.btype.value == "QUALITY");
			}
			catch (GLib.Error e)
			{
				GLib.message (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/cdcenum/write",
		() => {
			try {
				var t = new EnumTest ();
				t.cdc = new tCDCEnum ();
				t.cdc.set_enum (tPredefinedCDC.Enum.ENC);
				var d = new GomDocument.from_string (t.write_string ());
				var r = d.document_element;
				assert (r != null);
				assert (r.node_name == "NodeTest");
				(r.get_attribute ("CDCEnum") == "Enc");
			}
			catch (GLib.Error e)
			{
				stdout.printf (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/cdcenum/read",
		() => {
			try {
				var t = new EnumTest ();
				t.read_from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest CDCEnum = "VSG" />""");
				assert (t.cdc != null);
				assert (t.cdc.get_enum () == tPredefinedCDC.Enum.VSG);
				assert (t.cdc.value == "VSG");
			}
			catch (GLib.Error e)
			{
				GLib.message (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/common-conducting-equitment/write",
		() => {
			try {
				var t = new EnumTest ();
				t.ceq = new tCommonConductingEquipment ();
				t.ceq.set_enum (tPredefinedCommonConductingEquipment.Enum.RRC);
				var d = new GomDocument.from_string (t.write_string ());
				var r = d.document_element;
				assert (r != null);
				assert (r.node_name == "NodeTest");
				(r.get_attribute ("condEq") == "Rrc");
			}
			catch (GLib.Error e)
			{
				stdout.printf (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/common-conducting-equitment/read",
		() => {
			try {
				var t = new EnumTest ();
				t.read_from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest condEq = "SCR" />""");
				assert (t.ceq != null);
				assert (t.ceq.get_enum () == tPredefinedCommonConductingEquipment.Enum.SCR);
				assert (t.ceq.value == "SCR");
			}
			catch (GLib.Error e)
			{
				GLib.message (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/service-type/write", 
		() => {
			try {
				var t = new EnumTest ();
				t.st = new tServiceType ();
				t.st.set_enum (tServiceType.Enum.GOOSE);
				var d = new GomDocument.from_string (t.write_string ());
				var r = d.document_element;
				assert (r != null);
				assert (r.node_name == "NodeTest");
				(r.get_attribute ("ServiceType") == "Goose");
			}
			catch (GLib.Error e)
			{
				stdout.printf (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/service-type/read", 
		() => {
			try {
				var t = new EnumTest ();
				t.read_from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest ServiceType = "SMV" />""");
				assert (t.st != null);
				assert (t.st.get_enum () == tServiceType.Enum.SMV);
				assert (t.st.value == "SMV");
			}
			catch (GLib.Error e)
			{
				GLib.message (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/fc/write", 
		() => {
			try {
				var t = new EnumTest ();
				t.fc = new tFC ();
				t.fc.set_enum (tFC.Enum.SE);
				var d = new GomDocument.from_string (t.write_string ());
				var r = d.document_element;
				assert (r != null);
				assert (r.node_name == "NodeTest");
				(r.get_attribute ("FC") == "Se");
			}
			catch (GLib.Error e)
			{
				stdout.printf (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/fc/read", 
		() => {
			try {
				var t = new EnumTest ();
				t.read_from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest FC = "mx" />""");
				assert (t.fc != null);
				assert (t.fc.get_enum () == tFC.Enum.MX);
				assert (t.fc.value == "mx");
			}
			catch (GLib.Error e)
			{
				GLib.message (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/gsec-type/write", 
		() => {
			try {
				var t = new EnumTest ();
				t.gsect = new tGSEControlType ();
				t.gsect.set_enum (tGSEControlType.Enum.GSSE);
				var d = new GomDocument.from_string (t.write_string ());
				var r = d.document_element;
				assert (r != null);
				assert (r.node_name == "NodeTest");
				(r.get_attribute ("GSEType") == "Gsse");
			}
			catch (GLib.Error e)
			{
				stdout.printf (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/gsec-type/read", 
		() => {
			try {
				var t = new EnumTest ();
				t.read_from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest GSEType = "goose" />""");
				assert (t.gsect != null);
				assert (t.gsect.get_enum () == tGSEControlType.Enum.GOOSE);
				assert (t.gsect.value == "goose");
			}
			catch (GLib.Error e)
			{
				GLib.message (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/namestructure/write", 
		() => {
			try {
				var t = new EnumTest ();
				t.namestruct = new tNameStructure ();
				t.namestruct.set_enum (tNameStructure.Enum.IED_NAME);
				var d = new GomDocument.from_string (t.write_string ());
				var r = d.document_element;
				assert (r != null);
				assert (r.node_name == "NodeTest");
				(r.get_attribute ("nameStructure") == "IedName");
			}
			catch (GLib.Error e)
			{
				stdout.printf (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/namestructure/read",
		() => {
			try {
				var t = new EnumTest ();
				t.read_from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest nameStructure = "FUNCNAME" />""");
				assert (t.namestruct != null);
				assert (t.namestruct.get_enum () == tNameStructure.Enum.FUNC_NAME);
				assert (t.namestruct.value == "FUNCNAME");
			}
			catch (GLib.Error e)
			{
				GLib.message (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/phys-conn/write",
		() => {
			try {
				var t = new EnumTest ();
				t.phc = new tPhysConnType ();
				t.phc.set_enum (tPredefinedPhysConnType.Enum.CONNECTION);
				var d = new GomDocument.from_string (t.write_string ());
				var r = d.document_element;
				assert (r != null);
				assert (r.node_name == "NodeTest");
				(r.get_attribute ("PhysConn") == "Connection");
			}
			catch (GLib.Error e)
			{
				stdout.printf (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/phys-conn/read",
		() => {
			try {
				var t = new EnumTest ();
				t.read_from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest PhysConn = "REDCONN" />""");
				assert (t.phc != null);
				assert (t.phc.get_enum () == tPredefinedPhysConnType.Enum.RED_CONN);
				assert (t.phc.value == "REDCONN");
			}
			catch (GLib.Error e)
			{
				GLib.message (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/phys-conn-ptype/write", 
		() => {
			try {
				var t = new EnumTest ();
				t.phct = new tPTypePhysConn ();
				t.phct.set_enum (tPredefinedPTypePhysConn.Enum.CABLE);
				var d = new GomDocument.from_string (t.write_string ());
				var r = d.document_element;
				assert (r != null);
				assert (r.node_name == "NodeTest");
				(r.get_attribute ("PhysConnType") == "Cable");
			}
			catch (GLib.Error e)
			{
				stdout.printf (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/phys-conn-ptype/read", 
		() => {
			try {
				var t = new EnumTest ();
				t.read_from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest PhysConnType = "PLUG" />""");
				assert (t.phct != null);
				assert (t.phct.get_enum () == tPredefinedPTypePhysConn.Enum.PLUG);
				assert (t.phct.value == "PLUG");
			}
			catch (GLib.Error e)
			{
				GLib.message (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/power-transformer-type/write", 
		() => {
			try {
				var t = new EnumTest ();
				t.pwt = new tPowerTransformerType ();
				t.pwt.set_enum (tPowerTransformerType.Enum.PTR);
				var d = new GomDocument.from_string (t.write_string ());
				var r = d.document_element;
				assert (r != null);
				assert (r.node_name == "NodeTest");
				(r.get_attribute ("PwTrnType") == "Ptr");
			}
			catch (GLib.Error e)
			{
				stdout.printf (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/power-transformer-type/read", 
		() => {
			try {
				var t = new EnumTest ();
				t.read_from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest PwTrnType = "ptr" />""");
				assert (t.pwt != null);
				assert (t.pwt.get_enum () == tPowerTransformerType.Enum.PTR);
				assert (t.pwt.value == "ptr");
			}
			catch (GLib.Error e)
			{
				GLib.message (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/general-equiment/write", 
		() => {
			try {
				var t = new EnumTest ();
				t.ge = new tGeneralEquipmentEnum ();
				t.ge.set_enum (tPredefinedGeneralEquipment.Enum.FAN);
				var d = new GomDocument.from_string (t.write_string ());
				var r = d.document_element;
				assert (r != null);
				assert (r.node_name == "NodeTest");
				(r.get_attribute ("GEquiment") == "Fan");
			}
			catch (GLib.Error e)
			{
				stdout.printf (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/general-equiment/read", 
		() => {
			try {
				var t = new EnumTest ();
				t.read_from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest GEquiment = "vlv" />""");
				assert (t.ge != null);
				assert (t.ge.get_enum () == tPredefinedGeneralEquipment.Enum.VLV);
				assert (t.ge.value == "vlv");
			}
			catch (GLib.Error e)
			{
				GLib.message (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/smpmod/write",
		() => {
			try {
				var t = new EnumTest ();
				t.smpm = new tSmpMod ();
				t.smpm.set_enum (tSmpMod.Enum.SMP_PER_SEC);
				var d = new GomDocument.from_string (t.write_string ());
				var r = d.document_element;
				assert (r != null);
				assert (r.node_name == "NodeTest");
				(r.get_attribute ("smpMod") == "SmpPerSec");
			}
			catch (GLib.Error e)
			{
				stdout.printf (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/smpmod/read", 
		() => {
			try {
				var t = new EnumTest ();
				t.read_from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest smpMod = "SECPERSMP" />""");
				assert (t.smpm != null);
				assert (t.smpm.get_enum () == tSmpMod.Enum.SEC_PER_SMP);
				assert (t.smpm.value == "SECPERSMP");
			}
			catch (GLib.Error e)
			{
				GLib.message (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/service-settings/write",
		() => {
			try {
				var t = new EnumTest ();
				t.svt = new tServiceSettingsType ();
				t.svt.set_enum (tServiceSettingsType.Enum.CONF);
				var d = new GomDocument.from_string (t.write_string ());
				var r = d.document_element;
				assert (r != null);
				assert (r.node_name == "NodeTest");
				(r.get_attribute ("ServiceSett") == "Conf");
			}
			catch (GLib.Error e)
			{
				stdout.printf (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/service-settings/read",
		() => {
			try {
				var t = new EnumTest ();
				t.read_from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest ServiceSett = "dyn" />""");
				assert (t.svt != null);
				assert (t.svt.get_enum () == tServiceSettingsType.Enum.DYN);
				assert (t.svt.value == "dyn");
			}
			catch (GLib.Error e)
			{
				GLib.message (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/siunit/write",
		() => {
			try {
				var t = new EnumTest ();
				t.siu = new tSIUnit ();
				t.siu.select (tSIUnit.Enum.V_HZ);
				var d = new GomDocument.from_string (t.write_string ());
				var r = d.document_element;
				assert (r != null);
				assert (r.node_name == "NodeTest");
				assert (r.get_attribute ("SIUnit") == "V/Hz");
			}
			catch (GLib.Error e)
			{
				stdout.printf (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/siunit/read",
		() => {
			try {
				var t = new EnumTest ();
				t.read_from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest SIUnit = "kg/m³" />""");
				assert (t.siu != null);
				assert (t.siu.value == "kg/m³");
			}
			catch (GLib.Error e)
			{
				GLib.message (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/phase/write",
		() => {
			try {
				var t = new EnumTest ();
				t.ph = new tPhase ();
				t.ph.set_enum (tPhase.Enum.C);
				var d = new GomDocument.from_string (t.write_string ());
				var r = d.document_element;
				assert (r != null);
				assert (r.node_name == "NodeTest");
				(r.get_attribute ("Phase") == "C");
			}
			catch (GLib.Error e)
			{
				stdout.printf (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/phase/read",
		() => {
			try {
				var t = new EnumTest ();
				t.read_from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest Phase = "ALL" />""");
				assert (t.ph != null);
				assert (t.ph.value == "ALL");
			}
			catch (GLib.Error e)
			{
				GLib.message (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/trans-winding/write",
		() => {
			try {
				var t = new EnumTest ();
				t.twt = new tTransformerWindingEnum ();
				t.twt.set_enum (tPredefinedTransformerWinding.Enum.PTW);
				var d = new GomDocument.from_string (t.write_string ());
				var r = d.document_element;
				assert (r != null);
				assert (r.node_name == "NodeTest");
				(r.get_attribute ("TrWnd") == "Ptw");
			}
			catch (GLib.Error e)
			{
				stdout.printf (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/trans-winding/read",
		() => {
			try {
				var t = new EnumTest ();
				t.read_from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest TrWnd = "ptw" />""");
				assert (t.twt != null);
				assert (t.twt.get_enum () == tPredefinedTransformerWinding.Enum.PTW);
				assert (t.twt.value == "ptw");
			}
			catch (GLib.Error e)
			{
				GLib.message (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/unit-multiplier/write",
		() => {
			try {
				var t = new EnumTest ();
				t.tum = new tUnitMultiplier ();
				t.tum.select (tUnitMultiplier.Enum.DEC_U);
				var d = new GomDocument.from_string (t.write_string ());
				var r = d.document_element;
				assert (r != null);
				assert (r.node_name == "NodeTest");
				(r.get_attribute ("UM") == "d");
			}
			catch (GLib.Error e)
			{
				stdout.printf (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/unit-multiplier/read",
		() => {
			try {
				var t = new EnumTest ();
				t.read_from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest UM = "p" />""");
				assert (t.tum != null);
				assert (t.tum.get_multiplier (tUnitMultiplier.Enum.PICO) == t.tum.get_multiplier_value ());
				assert (t.tum.value == "p");
			}
			catch (GLib.Error e)
			{
				GLib.message (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/valkind/write",
		() => {
			try {
				var t = new EnumTest ();
				t.vk = new tValKind ();
				t.vk.set_enum (tValKind.Enum.RO);
				var d = new GomDocument.from_string (t.write_string ());
				var r = d.document_element;
				assert (r != null);
				assert (r.node_name == "NodeTest");
				(r.get_attribute ("Vk") == "Ro");
			}
			catch (GLib.Error e)
			{
				stdout.printf (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
		Test.add_func ("/librescl-test-suite/enums/valkind/read",
		() => {
			try {
				var t = new EnumTest ();
				t.read_from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest Vk = "set" />""");
				assert (t.vk != null);
				assert (t.vk.get_enum () == tValKind.Enum.SET);
				assert (t.vk.value == "set");
			}
			catch (GLib.Error e)
			{
				GLib.message (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
	}
}
