/**
 *
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <esodan@gmail.com>
 *
 *
 *  Copyright (c) 2013, 2014 Daniel Espinosa
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
        GXml.Document doc = new GXml.GDocument ();
        var dscl = new SclDocument ();
        try {
          dscl.serialize (doc);
          Test.message (@"[OUTPUT SCL:\n$((doc as GDocument).libxml_to_string ())]");
          assert (doc.root != null);
          assert (doc.root.name.up () == "SCL");
          assert (doc.root.namespaces.size == 2);
          bool found1, found2;
          found1 = found2 = false;
          foreach (GXml.Namespace n in doc.root.namespaces) {
            if (n.uri == "http://www.iec.ch/61850/2003/SCL")
              found1 = true;
            if (n.uri == "http://www.librescl.org/SCL")
              found2 = true;
          }
          assert (found1);
          assert (found2);
          assert (doc.root.namespaces.get (0) != null);
          assert (doc.root.namespaces[0].uri == "http://www.iec.ch/61850/2003/SCL");
          assert (doc.root.namespaces.get (1) != null);
          assert (doc.root.namespaces[1].uri == "http://www.librescl.org/SCL");
          assert (doc.root.children.size == 0);
        } catch (GLib.Error e) {
          GLib.message (@"ERROR: $(e.message)");
          assert_not_reached ();
        }
      });
    Test.add_func ("/librescl/write-data_type_templates-scl-ed1", 
      () => {
       GXml.Document doc = new GXml.GDocument ();
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
         dscl.serialize (doc);
         //        GLib.message (@"SCL:\n $(doc)\n");
         if (doc.root == null) {
           GLib.message (@"ERROR: SCL NODE: no node");
           assert_not_reached ();
         }
         if (doc.root.name.up () != "SCL") {
           GLib.message (@"ERROR: SCL NODE: node name $(doc.root.name)");
           assert_not_reached ();
         }
         GXml.Element element = (GXml.Element) doc.root;
         if (!(element.children.size > 0)) {
           GLib.message (@"ERROR: SCL NODE: no child nodes $(doc.root)");
           assert_not_reached ();
         }
         bool found = false;
         GXml.Element dt = (GXml.Element) doc.root;
         foreach (GXml.Node n in doc.root.children) {
           if (n is GXml.Element) {
             if (n.name == "DataTypeTemplates") {
               found = true;
               dt = (GXml.Element) n;
             }
           }
         }
         if (!found) {
           GLib.message (@"ERROR: SCL NODE: No DataTypeTemplates node found\n$(doc)");
           assert_not_reached ();
         }
         if (!(dt.children.size > 0)) {
           GLib.message (@"ERROR: SCL NODE: DataTypeTemplates has NO nodes\n$(doc)");
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
       GXml.Document doc = new GXml.GDocument ();
       var dscl = new SclDocument ();
       //string tn = typeof (tDataTypeTemplates).name ().replace ("Lsclt","");
       //GLib.message (@"Test Node name: $(tn)");
       try {
         dscl.ieds = new tIED.HashMap ();
         dscl.serialize (doc);
         //        GLib.message (@"SCL:\n $(doc)\n");
         if (doc.root == null) {
           GLib.message (@"ERROR: SCL NODE: no node");
           assert_not_reached ();
         }
         if (doc.root.name.up () != "SCL") {
           GLib.message (@"ERROR: SCL NODE: node name $(doc.root.name)");
           assert_not_reached ();
         }
         GXml.Element element = (GXml.Element) doc.root;
         if (element.children.size > 0) {
           GLib.message (@"ERROR: SCL NODE: have child nodes $(doc.root)");
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
       GXml.Document doc = new GXml.GDocument ();
       var dscl = new SclDocument ();
       //string tn = typeof (tDataTypeTemplates).name ().replace ("Lsclt","");
       //GLib.message (@"Test Node name: $(tn)");
       try {
         dscl.communication = new tCommunication ();
         dscl.serialize (doc);
         //        GLib.message (@"SCL:\n $(doc)\n");
         assert (doc.root != null);
         assert (doc.root.name.up () == "SCL");
         GXml.Element element = (GXml.Element) doc.root;
         assert (element.children.size > 0);
         bool found = false;
         GXml.Element dt = (GXml.Element) doc.root;
         foreach (GXml.Node n in doc.root.children) {
           if (n is Element) {
             if (n.name == "Communication") {
               found = true;
               dt = (Element) n;
             }
           }
         }
         assert (found);
         assert (dt.children.size == 0);
       }
       catch (GLib.Error e)
       {
         GLib.message (@"ERROR: $(e.message)");
         assert_not_reached ();
       }
      });
    Test.add_func ("/librescl/write-substation-scl-ed1", 
      () => {
       GXml.Document doc = new GXml.GDocument ();
       var dscl = new SclDocument ();
       //string tn = typeof (tDataTypeTemplates).name ().replace ("Lsclt","");
       //GLib.message (@"Test Node name: $(tn)");
       try {
         dscl.substation = new tSubstation ();
         dscl.serialize (doc);
         //        GLib.message (@"SCL:\n $(doc)\n");
         if (doc.root == null) {
           GLib.message (@"ERROR: SCL NODE: no node");
           assert_not_reached ();
         }
         if (doc.root.name.up () != "SCL") {
           GLib.message (@"ERROR: SCL NODE: node name $(doc.root.name)");
           assert_not_reached ();
         }
         GXml.Element element = (GXml.Element) doc.root;
         if (!(element.children.size > 0)) {
           GLib.message (@"ERROR: SCL NODE: no child nodes $(doc.root)");
           assert_not_reached ();
         }
         bool found = false;
         GXml.Element dt = (GXml.Element) doc.root;
         foreach (GXml.Node n in doc.root.children) {
           if (n is Element) {
             if (n.name == "Substation") {
               found = true;
               dt = (Element) n;
             }
           }
         }
         if (!found) {
           GLib.message (@"ERROR: SCL NODE: No Substation node found\n$(doc)");
           assert_not_reached ();
         }
         if (dt.children.size > 0) {
           GLib.message (@"ERROR: SCL NODE: Substationhas nodes\n$(doc)");
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
       GXml.Document doc = new GXml.GDocument ();
       var dscl = new SclDocument ();
       //string tn = typeof (tDataTypeTemplates).name ().replace ("Lsclt","");
       //GLib.message (@"Test Node name: $(tn)");
       try {
         dscl.header = new tHeader ();
         dscl.serialize (doc);
         //        GLib.message (@"SCL:\n $(doc)\n");
         if (doc.root == null) {
           GLib.message (@"ERROR: SCL NODE: no node");
           assert_not_reached ();
         }
         if (doc.root.name.up () != "SCL") {
           GLib.message (@"ERROR: SCL NODE: node name $(doc.root.name)");
           assert_not_reached ();
         }
         GXml.Element element = (GXml.Element) doc.root;
         if (!(element.children.size > 0)) {
           GLib.message (@"ERROR: SCL NODE: no child nodes $(doc.root)");
           assert_not_reached ();
         }
         bool found = false;
         GXml.Element dt =(GXml.Element) doc.root;
         foreach (GXml.Node n in doc.root.children) {
           if (n is Element) {
             if (n.name == "Header") {
               //          GLib.message (@"Node: $(n.node_name)");
               found = true;
               dt = (Element) n;
             }
           }
         }
         if (!found) {
           GLib.message (@"ERROR: SCL NODE: No Header node found\n$(doc)");
           assert_not_reached ();
         }
         if (dt.children.size > 0) {
           GLib.message (@"ERROR: SCL NODE: Header has nodes\n$(doc)");
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
         var idoc = new GXml.GDocument.from_path (LsclTest.TEST_DIR + "/tests-files/data-type-template-datypes.cid");
         GLib.message (@"INITIAL SCL\n$(idoc)");
         var iscl = new Scl ();
         iscl.deserialize (idoc);
         {
           assert (iscl.data_type_templates != null);
           assert (iscl.data_type_templates.data_attribute_types != null);
           assert (iscl.data_type_templates.data_attribute_types.deserialize_children ());
           if (iscl.data_type_templates.data_attribute_types.duplicated != null) {
             //var datd = iscl.data_type_templates.data_attribute_types.duplicated.size;
             //GLib.message (@"INITIAL SCL: datypes size $(datd)\n");
             foreach (tDAType d in iscl.data_type_templates.data_attribute_types.values)
             {
               if (d.serialized_xml_node_value != null) {
                 //GLib.message (@"$(d.id): $(d.serialized_xml_node_value)\n");
               }
             }
           }
         }
         GXml.Document doc = new GXml.GDocument ();
         iscl.serialize (doc);
         var scl = new Scl ();
         GLib.message (@"FINALY SCL\n$doc");
         scl.deserialize (doc);
         assert (scl.data_type_templates != null);
         assert (scl.data_type_templates.data_attribute_types != null);
         assert (scl.data_type_templates.data_attribute_types.size == 0);
         assert (scl.data_type_templates.data_attribute_types.deserialize_children ());
         assert (scl.data_type_templates.data_attribute_types.size == 12);
         assert (scl.data_type_templates.data_attribute_types.duplicated != null);
         assert (scl.data_type_templates.data_attribute_types.duplicated.size == 1);
         //GLib.message (@"ORIGINAL:$idoc\n>>>>>><\n");
         var dt = scl.data_type_templates;
         var dats = dt.data_attribute_types;
         assert (dats != null);
         // This return the one in main collection, no the duplicated one
         var dat = dats.get ("RRECRecModStruct");
         assert (dat != null);
         assert (dat.bdas != null);
         assert (dat.bdas.deserialize_children ());
         assert (dat.bdas.duplicated != null);
         assert (dat.bdas.duplicated.size == 1);
         GLib.message ("Duplicated size: "+dat.bdas.duplicated.size.to_string ());
         var dup = dat.bdas.duplicated.get (0);
         assert (dup != null);
         assert (dup.name.get_string () == "Operated");
         assert (dup.b_type.get_string ().down () == "BOOLEAN".down ());
				 assert (dup.val_kind.get_value () == (Enumeration.parse (typeof (tValKind.Enum), "RO")).value);
         assert (dup.count.get_value () == 2);
         assert (dup.vals != null);
         assert (dup.vals.deserialize_children ());
         assert (dup.vals.size == 2);
         assert (dup.vals[0].get_value () == "FALSE");
         assert (dup.vals[1].get_value () == "TRUE");
       }
       catch (GLib.Error e)
       {
         GLib.message (@"ERROR: $(e.message)");
         assert_not_reached ();
       }
      });
    }
}
