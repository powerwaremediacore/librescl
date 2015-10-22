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
	}
}
