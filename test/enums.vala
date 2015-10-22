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
	public class EnumTest : SerializableObjectModel
	{
		public tAssociationKind kind { get; set; }
		[Description (nick="AttributeName")]
		public tAttributeName attr_name { get; set; }
		[Description (nick="BasicType")]
		public tBasicType btype { get; set; }
		[Description (nick="CDCEnum")]
		public tCDCEnum cdc { get; set; }
		[Description (nick="condEq")]
		public tCommonConductingEquipment ceq { get; set; }
		[Description (nick="ServiceType")]
		public tServiceType st { get; set; }
		[Description (nick="FC")]
		public tFC fc { get; set; }
		[Description (nick="GSEType")]
		public tGSEControlType gsect { get; set; }
		[Description (nick="nameStructure")]
		public tNameStructure namestruct { get; set; }
		[Description (nick="PhysConn")]
		public tPhysConnType phc { get; set; }
		[Description (nick="PhysConnType")]
		public tPTypePhysConn phct { get; set; }
		public EnumTest () {}
		public override string to_string () { return "EnumTest class"; }
		public override string node_name () { return "NodeTest"; }
		public override bool property_use_nick () { return true; }
	}
	public static void add_funcs ()
	{
		Test.add_func ("/librescl-test-suite/enums/association-kind/write", 
		() => {
			try {
				var t = new EnumTest ();
				t.kind = new tAssociationKind ();
				t.kind.set_value (tAssociationKind.Enum.PREESTABLISHED);
				var d = new xDocument ();
				t.serialize (d);
				var r = d.root;
				assert (r != null);
				assert (r.name == "NodeTest");
				assert (r.attrs.has_key ("kind"));
				var c = r.attrs.get ("kind");
				assert (c != null);
				assert (c.value.up () == "PREESTABLISHED");
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
				var d = new xDocument.from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest kind = "PREDEFINED" />""");
				t.deserialize (d);
				assert (t.kind != null);
				assert (t.kind.get_value () == tAssociationKind.Enum.PREDEFINED);
				assert (t.kind.get_string () == "PREDEFINED");
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
				var d = new xDocument ();
				t.serialize (d);
				var r = d.root;
				assert (r != null);
				assert (r.name == "NodeTest");
				assert (r.attrs.has_key ("AttributeName"));
				var c = r.attrs.get ("AttributeName");
				assert (c != null);
				assert (c.value == "operTm");
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
				var d = new xDocument.from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest AttributeName = "sboTimeout" />""");
				t.deserialize (d);
				assert (t.attr_name != null);
				Test.message ("tAttributeName is Serializable: "+(t.attr_name.get_type ().is_a (typeof(GXml.Serializable))).to_string ());
				Test.message ("tAttributeName is SerializableProperty: "+(t.attr_name.get_type ().is_a (typeof(SerializableProperty))).to_string ());
				var vals = t.attr_name.get_values ();
				assert (vals != null);
				Test.message ("Vals size = "+vals.size.to_string ());
				assert (vals.size != 0);
				assert (vals.get (0) == "T");
				Test.message ("Value at: "+t.attr_name.get_value_at (tPredefinedAttributeName.Enum.SBO_TIMEOUT));
				assert (t.attr_name.get_value_at (tPredefinedAttributeName.Enum.SBO_TIMEOUT) == "sboTimeout");
				assert (t.attr_name.is_value ());
				assert (t.attr_name.get_string () != null);
				Test.message ("Actual value = "+t.attr_name.get_string ());
				assert (t.attr_name.get_string () == "sboTimeout");
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
				t.btype.set_value (tBasicType.Enum.FLOAT32);
				var d = new xDocument ();
				t.serialize (d);
				var r = d.root;
				assert (r != null);
				assert (r.name == "NodeTest");
				var c = r.attrs.get ("BasicType");
				assert (c != null);
				assert (c.value == "Float32");
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
				var d = new xDocument.from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest BasicType = "QUALITY" />""");
				t.deserialize (d);
				assert (t.btype != null);
				assert (t.btype.get_value () == tBasicType.Enum.QUALITY);
				assert (t.btype.get_string () == "QUALITY");
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
				t.cdc.set_value (tPredefinedCDC.Enum.ENC);
				var d = new xDocument ();
				t.serialize (d);
				var r = d.root;
				assert (r != null);
				assert (r.name == "NodeTest");
				var c = r.attrs.get ("CDCEnum");
				assert (c != null);
				assert (c.value == "Enc");
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
				var d = new xDocument.from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest CDCEnum = "VSG" />""");
				t.deserialize (d);
				assert (t.cdc != null);
				assert (t.cdc.get_value () == tPredefinedCDC.Enum.VSG);
				assert (t.cdc.get_string () == "VSG");
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
				t.ceq.set_value (tPredefinedCommonConductingEquipment.Enum.RRC);
				var d = new xDocument ();
				t.serialize (d);
				var r = d.root;
				assert (r != null);
				assert (r.name == "NodeTest");
				var c = r.attrs.get ("condEq");
				assert (c != null);
				assert (c.value == "Rrc");
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
				var d = new xDocument.from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest condEq = "SCR" />""");
				t.deserialize (d);
				assert (t.ceq != null);
				assert (t.ceq.get_value () == tPredefinedCommonConductingEquipment.Enum.SCR);
				assert (t.ceq.get_string () == "SCR");
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
				t.st.set_value (tServiceType.Enum.GOOSE);
				var d = new xDocument ();
				t.serialize (d);
				var r = d.root;
				assert (r != null);
				assert (r.name == "NodeTest");
				var c = r.attrs.get ("ServiceType");
				assert (c != null);
				assert (c.value == "Goose");
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
				var d = new xDocument.from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest ServiceType = "SMV" />""");
				t.deserialize (d);
				assert (t.st != null);
				assert (t.st.get_value () == tServiceType.Enum.SMV);
				assert (t.st.get_string () == "SMV");
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
				t.fc.set_value (tFC.Enum.SE);
				var d = new xDocument ();
				t.serialize (d);
				var r = d.root;
				assert (r != null);
				assert (r.name == "NodeTest");
				var c = r.attrs.get ("FC");
				assert (c != null);
				assert (c.value == "Se");
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
				var d = new xDocument.from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest FC = "mx" />""");
				t.deserialize (d);
				assert (t.fc != null);
				assert (t.fc.get_value () == tFC.Enum.MX);
				assert (t.fc.get_string () == "mx");
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
				t.gsect.set_value (tGSEControlType.Enum.GSSE);
				var d = new xDocument ();
				t.serialize (d);
				var r = d.root;
				assert (r != null);
				assert (r.name == "NodeTest");
				var c = r.attrs.get ("GSEType");
				assert (c != null);
				assert (c.value == "Gsse");
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
				var d = new xDocument.from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest GSEType = "goose" />""");
				t.deserialize (d);
				assert (t.gsect != null);
				assert (t.gsect.get_value () == tGSEControlType.Enum.GOOSE);
				assert (t.gsect.get_string () == "goose");
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
				t.namestruct.set_value (tNameStructure.Enum.IED_NAME);
				var d = new xDocument ();
				t.serialize (d);
				var r = d.root;
				assert (r != null);
				assert (r.name == "NodeTest");
				var c = r.attrs.get ("nameStructure");
				assert (c != null);
				assert (c.value == "IedName");
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
				var d = new xDocument.from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest nameStructure = "FUNCNAME" />""");
				t.deserialize (d);
				assert (t.namestruct != null);
				assert (t.namestruct.get_value () == tNameStructure.Enum.FUNC_NAME);
				assert (t.namestruct.get_string () == "FUNCNAME");
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
				t.phc.set_value (tPredefinedPhysConnType.Enum.CONNECTION);
				var d = new xDocument ();
				t.serialize (d);
				var r = d.root;
				assert (r != null);
				assert (r.name == "NodeTest");
				var c = r.attrs.get ("PhysConn");
				assert (c != null);
				assert (c.value == "Connection");
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
				var d = new xDocument.from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest PhysConn = "REDCONN" />""");
				t.deserialize (d);
				assert (t.phc != null);
				assert (t.phc.get_value () == tPredefinedPhysConnType.Enum.RED_CONN);
				assert (t.phc.get_string () == "REDCONN");
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
				t.phct.set_value (tPredefinedPTypePhysConn.Enum.CABLE);
				var d = new xDocument ();
				t.serialize (d);
				var r = d.root;
				assert (r != null);
				assert (r.name == "NodeTest");
				var c = r.attrs.get ("PhysConnType");
				assert (c != null);
				assert (c.value == "Cable");
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
				var d = new xDocument.from_string ("""<?xml version="1.0" encoding="UTF-8"?>
				<NodeTest PhysConnType = "PLUG" />""");
				t.deserialize (d);
				assert (t.phct != null);
				assert (t.phct.get_value () == tPredefinedPTypePhysConn.Enum.PLUG);
				assert (t.phct.get_string () == "PLUG");
			}
			catch (GLib.Error e)
			{
				GLib.message (@"ERROR: $(e.message)");
				assert_not_reached ();
			}
		});
	}
}
