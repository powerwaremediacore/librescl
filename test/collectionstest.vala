/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*-  */
/* librescl
 *
 * Copyright (C) 2016 Daniel Espinosa <daniel.espinosa@pwmc.mx>
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

public class LsclTest.Collections
{
  class Value : SerializableObjectModel {
    public override bool serialize_use_xml_node_value () { return true; }
    public override string node_name () { return "Value"; }
    public override string to_string () { return "Value"+serialized_xml_node_value; }
  }
  class DataTemplate : SerializableObjectModel, SerializableMapKey<string> {
    public string id { get; set; }
    public Value value { get; set; }
    public override string node_name () { return "DataTemplate"; }
    public override string to_string () { return "DataTemplate"+id; }
    public string get_map_key () { return id; }
    public class HashMap : Lscl.HashMap<string,DataTemplate> {}
  }
  class Templates : SerializableObjectModel { 
    public DataTemplate.HashMap templates { get; set; default = new DataTemplate.HashMap (); }
    public override string node_name () { return "Templates"; }
    public override string to_string () { return "Templates"; }
  }
  public static void add_funcs ()
  {
    Test.add_func ("/librescl/collections/dup-hashmap/api", 
    () => {
      try {
        var d = new GomDocument ();
        d.append_child (d.create_element ("Templates"));
        var e1 = d.create_element ("DataTemplate");
        d.document_element.append_child (e1);
        (e1 as Element).set_attr ("id","1");
        var e2 = d.create_element ("DataTemplate");
        d.document_element.append_child (e2);
        (e2 as Element).set_attr ("id","1");
        var ts = new Templates ();
        assert (ts.templates.size == 0);
        // TODO: ts.read_from_string (d.document_element.write_string ());
        assert (ts.templates.size == 1);
        assert (ts.templates.duplicated != null);
        assert (ts.templates.duplicated.size == 1);
      } catch (GLib.Error e) {
        GLib.message ("ERROR: "+e.message);
      }
    });
    Test.add_func ("/librescl/collections/dup-hashmap/deserialize", 
    () => {
      try {
        var ts = new Templates ();
        assert (ts.templates.size == 0);
        // TODO: ts.read_from_string ("""<Templates><DataTemplate id="1"/><DataTemplate id="1"/></Templates>""");
        assert (!ts.templates.deserialized ());
        assert (ts.templates.deserialize_children ());
        assert (ts.templates.size == 1);
        assert (ts.templates.duplicated != null);
        assert (ts.templates.duplicated.size == 1);
      } catch (GLib.Error e) {
        GLib.message ("ERROR: "+e.message);
      }
    });
    Test.add_func ("/librescl/collections/dup-hashmap/serialize", 
    () => {
      try {
        var ts = new Templates ();
        assert (ts.templates.size == 0);
        // TODO: ts.read_from_string ("""<Templates><DataTemplate id="1"><Value>TEXT</Value></DataTemplate><DataTemplate id="1"/>FAKE_TEXT</Templates>""");
        assert (!ts.templates.deserialized ());
        assert (ts.templates.deserialize_children ());
        assert (ts.templates.size == 1);
        assert (ts.templates.duplicated != null);
        assert (ts.templates.duplicated.size == 1);
        assert (ts.templates["1"].value != null);
        assert (ts.templates["1"].value.serialized_xml_node_value == "TEXT");
        // TODO: ts.write_string ()
        var ds = new GomDocument.from_string ("");
        assert (ds.document_element != null);
        assert (ds.document_element.node_name == "Templates");
        assert (ds.document_element.child_nodes.length == 2);
        assert (ds.document_element.child_nodes.item(0).node_name == "DataTemplate");
        assert ((ds.document_element.child_nodes.item(0) as DomElement).get_attribute ("id") == "1");
        assert (ds.document_element.child_nodes.item(0).child_nodes.length == 1);
        assert (ds.document_element.child_nodes.item(0).child_nodes.item(0).node_name == "Value");
        assert (ds.document_element.child_nodes.item(0).child_nodes.item(0).child_nodes.length == 1);
        assert (ds.document_element.child_nodes.item(0).child_nodes.item(0).child_nodes.item(0).node_value == "TEXT");
        assert (ds.document_element.child_nodes.length == 2);
        assert (ds.document_element.child_nodes.item(0).node_name == "DataTemplate");
        assert ((ds.document_element.child_nodes.item(0) as DomElement).get_attribute ("id") == "1");
      } catch (GLib.Error e) {
        GLib.message ("ERROR: "+e.message);
      }
    });
  }
}
