/**
 *
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <esodan@gmail.com>
 *
 *
 *  Copyright (c) 2013, 2014, 2017 Daniel Espinosa
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Lesser General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
     *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

using Lscl;
using GXml;


class LsclTest.XmlGeneration
{
  public static void add_funcs ()
  {
    Test.add_func ("/librescl/write-empty-scl-ed1", 
      () => {
        var dscl = new SclDocument ();
        try {
          var doc = new GXml.GomDocument.from_string (dscl.write_string ());
          Test.message (@"[OUTPUT SCL:\n$((doc as TDocument).to_string ())]");
          assert (doc.document_element != null);
          assert (doc.document_element.node_name.up () == "SCL");
          assert (doc.document_element.get_attribute_ns ("http://www.w3.org/2000/xmlns", "scl") == "http://www.iec.ch/61850/2003/SCL");
          assert (doc.document_element.get_attribute_ns ("http://www.w3.org/2000/xmlns", "lscl") == "http://www.librescl.org/SCL");
          assert (doc.document_element.get_attribute_ns ("http://www.w3.org/2000/xmlns", "scl") != null);
          assert (doc.document_element.get_attribute_ns ("http://www.w3.org/2000/xmlns", "lscl") != null);
        } catch (GLib.Error e) {
          GLib.message (@"ERROR: $(e.message)");
          assert_not_reached ();
        }
      });
    Test.add_func ("/librescl/write-data_type_templates-scl-ed1",
      () => {
       var dscl = new SclDocument ();
       //string tn = typeof (tDataTypeTemplates).name ().replace ("Lsclt","");
       //GLib.message (@"Test Node name: $(tn)");
       try {
         dscl.data_type_templates = new tDataTypeTemplates ();
         // DAType
         var dat = new tDAType ();
         dat.id = "TEMPLATE1";
         dat.ied_type = "TEMPLATE";
         //        dat.BDA = new tBdaArray ();
         dscl.data_type_templates.data_attribute_types = new tDAType.HashMap ();
         dscl.data_type_templates.data_attribute_types.@set (dat.id, dat);
         var t = dscl.data_type_templates.data_attribute_types.@get (dat.id);
         if (t == null)
           GLib.message (@"No Object Exists:\n");
         //        var bda = new tBDA ();
         //        bda.name = "attr1";
         //        dat.BDA.set_at (bda.name, bda);
         var doc = new GXml.GomDocument.from_string (dscl.write_string ());
         //        GLib.message (@"SCL:\n $(doc)\n");
         if (doc.document_element == null) {
           GLib.message (@"ERROR: SCL NODE: no node");
           assert_not_reached ();
         }
         if (doc.document_element.node_name.up () != "SCL") {
           GLib.message (@"ERROR: SCL NODE: node name $(doc.document_element.node_name)");
           assert_not_reached ();
         }
         var element = doc.document_element as DomElement;
         if (!(element.child_nodes.length > 0)) {
           GLib.message (@"ERROR: SCL NODE: no child nodes $((doc.document_element as GomElement).write_string ())");
           assert_not_reached ();
         }
         bool found = false;
         var dt = doc.document_element as DomElement;
         for (int i = 0; i < doc.document_element.child_nodes.length; i++) {
           var n = doc.document_element.child_nodes.item (i);
           if (n is GXml.DomElement) {
             if (n.node_name == "DataTypeTemplates") {
               found = true;
               dt = n as DomElement;
             }
           }
         }
         if (!found) {
           GLib.message (@"ERROR: SCL NODE: No DataTypeTemplates node found\n$((doc.document_element as GomElement).write_string ()))");
           assert_not_reached ();
         }
         if (!(dt.child_nodes.length > 0)) {
           GLib.message (@"ERROR: SCL NODE: DataTypeTemplates has NO nodes\n$((doc.document_element as GomElement).write_string ()))");
           assert_not_reached ();
         }
       }
       catch (GLib.Error e)
       {
         GLib.message (@"ERROR: $(e.message)");
         assert_not_reached ();
       }
      });
    Test.add_func ("/librescl/write-ieds-scl-ed1", 
      () => {
       var dscl = new SclDocument ();
       //string tn = typeof (tDataTypeTemplates).name ().replace ("Lsclt","");
       //GLib.message (@"Test Node name: $(tn)");
       try {
         dscl.ieds = new tIED.HashMap ();
         var doc = new GXml.GomDocument.from_string (dscl.write_string ());
         //        GLib.message (@"SCL:\n $(doc)\n");
         if (doc.document_element == null) {
           GLib.message (@"ERROR: SCL NODE: no node");
           assert_not_reached ();
         }
         if (doc.document_element.node_name.up () != "SCL") {
           GLib.message (@"ERROR: SCL NODE: node name $(doc.document_element.node_name)");
           assert_not_reached ();
         }
         GXml.DomElement element = doc.document_element;
         if (element.child_nodes.length > 0) {
           GLib.message (@"ERROR: SCL NODE: have child nodes $((doc.document_element as GomElement).write_string ()))");
           assert_not_reached ();
         }
       }
       catch (GLib.Error e)
       {
         GLib.message (@"ERROR: $(e.message)");
         assert_not_reached ();
       }
      });
    Test.add_func ("/librescl/write-communication-scl-ed1",
      () => {
       var dscl = new SclDocument ();
       //string tn = typeof (tDataTypeTemplates).name ().replace ("Lsclt","");
       //GLib.message (@"Test Node name: $(tn)");
       try {
         dscl.communication = new tCommunication ();
         var doc = new GomDocument.from_string (dscl.write_string ());
         //        GLib.message (@"SCL:\n $(doc)\n");
         assert (doc.document_element != null);
         assert (doc.document_element.node_name.up () == "SCL");
         GXml.DomElement element = doc.document_element;
         assert (element.child_nodes.length > 0);
         bool found = false;
         GXml.DomElement dt = doc.document_element;
         for (int i = 0; i < doc.document_element.child_nodes.length; i++) {
           var n = doc.document_element.child_nodes.item (i);
           if (n is DomElement) {
             if (n.node_name == "Communication") {
               found = true;
               dt = (DomElement) n;
             }
           }
         }
         assert (found);
         assert (dt.child_nodes.length == 0);
       }
       catch (GLib.Error e)
       {
         GLib.message (@"ERROR: $(e.message)");
         assert_not_reached ();
       }
      });
    Test.add_func ("/librescl/write-substation-scl-ed1", 
      () => {
       var dscl = new SclDocument ();
       //string tn = typeof (tDataTypeTemplates).name ().replace ("Lsclt","");
       //GLib.message (@"Test Node name: $(tn)");
       try {
         dscl.substation = new tSubstation ();
         var doc = new GomDocument.from_string (dscl.write_string ());
         //        GLib.message (@"SCL:\n $(doc)\n");
         if (doc.document_element == null) {
           GLib.message (@"ERROR: SCL NODE: no node");
           assert_not_reached ();
         }
         if (doc.document_element.node_name.up () != "SCL") {
           GLib.message (@"ERROR: SCL NODE: node name $(doc.document_element.node_name)");
           assert_not_reached ();
         }
         GXml.DomElement element = doc.document_element;
         if (!(element.child_nodes.length > 0)) {
           GLib.message (@"ERROR: SCL NODE: no child nodes $((doc.document_element as GomElement).write_string ()))");
           assert_not_reached ();
         }
         bool found = false;
         GXml.DomElement dt = doc.document_element;
         for (int i = 0; i < doc.document_element.child_nodes.length; i++) {
           var n = doc.document_element.child_nodes.item (i);
           if (n is DomElement) {
             if (n.node_name == "Substation") {
               found = true;
               dt = (DomElement) n;
             }
           }
         }
         if (!found) {
           GLib.message (@"ERROR: SCL NODE: No Substation node found\n$((doc.document_element as GomElement).write_string ())");
           assert_not_reached ();
         }
         if (dt.child_nodes.length > 0) {
           GLib.message (@"ERROR: SCL NODE: Substationhas nodes\n$((doc.document_element as GomElement).write_string ()))");
           assert_not_reached ();
         }
       }
       catch (GLib.Error e)
       {
         GLib.message (@"ERROR: $(e.message)");
         assert_not_reached ();
       }
      });
    Test.add_func ("/librescl/write-header-scl-ed1",
      () => {
       var dscl = new SclDocument ();
       //string tn = typeof (tDataTypeTemplates).name ().replace ("Lsclt","");
       //GLib.message (@"Test Node name: $(tn)");
       try {
         dscl.header = new tHeader ();
         var doc = new GomDocument.from_string (dscl.write_string ());
         //        GLib.message (@"SCL:\n $(doc)\n");
         if (doc.document_element == null) {
           GLib.message (@"ERROR: SCL NODE: no node");
           assert_not_reached ();
         }
         if (doc.document_element.node_name.up () != "SCL") {
           GLib.message (@"ERROR: SCL NODE: node name $(doc.document_element.node_name)");
           assert_not_reached ();
         }
         GXml.DomElement element = doc.document_element;
         if (!(element.child_nodes.length > 0)) {
           GLib.message (@"ERROR: SCL NODE: no child nodes $((doc.document_element as GomElement).write_string ()))");
           assert_not_reached ();
         }
         bool found = false;
         GXml.DomElement dt =doc.document_element;
         for (int i = 0; i < doc.document_element.child_nodes.length; i++) {
           var n = doc.document_element.child_nodes.item (i);
           if (n is DomElement) {
             if (n.node_name == "Header") {
               //          GLib.message (@"Node: $(n.node_name)");
               found = true;
               dt = (DomElement) n;
             }
           }
         }
         if (!found) {
           GLib.message (@"ERROR: SCL NODE: No Header node found\n$((doc.document_element as GomElement).write_string ()))");
           assert_not_reached ();
         }
         if (dt.child_nodes.length > 0) {
           GLib.message (@"ERROR: SCL NODE: Header has nodes\n$((doc.document_element as GomElement).write_string ()))");
           assert_not_reached ();
         }
       }
       catch (GLib.Error e)
       {
         GLib.message (@"ERROR: $(e.message)");
         assert_not_reached ();
       }
      });
    Test.add_func ("/librescl/write-data_attribute_types-duplicated-dba-ed1",
      () => {
       try {
         var fdoc = GLib.File.new_for_path (LsclTest.TEST_DIR + "/tests-files/data-type-template-datypes.cid");
         assert (fdoc.query_exists ());
         var iscl = new Scl ();
         (iscl as GomElement).read_from_file (fdoc);
         {
           assert (iscl.data_type_templates != null);
           assert (iscl.data_type_templates.data_attribute_types != null);
         }
         var scl = new Scl ();
         (scl as GomElement).read_from_string (iscl.write_string ());
         assert (scl.data_type_templates != null);
         assert (scl.data_type_templates.data_attribute_types != null);
         assert (scl.data_type_templates.data_attribute_types.length == 12);
         var dt = scl.data_type_templates;
         var dats = dt.data_attribute_types;
         assert (dats != null);
         // This return the one in main collection, no the duplicated one
         var dat = dats.get ("RRECRecModStruct") as tDAType;
         assert (dat != null);
         assert (dat.bdas != null);
       }
       catch (GLib.Error e)
       {
         GLib.message (@"ERROR: $(e.message)");
         assert_not_reached ();
       }
      });
    }
}
