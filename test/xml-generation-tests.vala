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
    Test.add_func ("/librescl-test-suite/write-empty-scl-ed1", 
      () => {
        var doc = new Document ();
        var dscl = new SclDocument ();
        try {
          dscl.serialize (doc);
          //        stdout.printf (@"[OUTPUT SCL:\n$doc]");
          if (doc.document_element == null) {
            stdout.printf (@"ERROR: SCL NODE: no node");
            assert_not_reached ();
          }
          if (doc.document_element.node_name.up () != "SCL") {
            stdout.printf (@"ERROR: SCL NODE: node name $(doc.document_element.node_name)");
            assert_not_reached ();
          }
          if (doc.document_element.namespace_definitions.length != 1) {
            stdout.printf (@"ERROR: SCL NODE: No Namespace \n$(doc.document_element)");
            assert_not_reached ();
          }
          bool found = false;
          foreach (GXml.Node n in doc.document_element.namespace_definitions) {
            if (n is NamespaceAttr) {
              if (n.node_value == "http://www.iec.ch/61850/2003/SCL")
                found = true;
            }
          }
          if (!found) {
            stdout.printf (@"ERROR: SCL NODE: No default Ed 1.0 Namespace found\n$(doc.document_element)");
            assert_not_reached ();
          }
          if (doc.document_element.has_child_nodes ()) {
            stdout.printf (@"ERROR: SCL NODE: Have child nodes \n$(doc.document_element)");
            assert_not_reached ();
          }
        }
        catch (GLib.Error e)
        {
          stdout.printf (@"ERROR: $(e.message)");
          assert_not_reached ();
        }
      });
    Test.add_func ("/librescl-test-suite/write-data_type_templates-scl-ed1", 
      () => {
       var doc = new Document ();
       var dscl = new SclDocument ();
       //string tn = typeof (tDataTypeTemplates).name ().replace ("Lsclt","");
       //stdout.printf (@"Test Node name: $(tn)");
       try {
         dscl.data_type_templates = new tDataTypeTemplates ();
         // DAType
         var dat = new tDAType ();
         dat.id = "TEMPLATE1";
         dat.ied_type = "TEMPLATE";
         //        dat.BDA = new tBdaArray ();
         dscl.data_type_templates.data_attribute_types = new tDAType.Collection ();
         dscl.data_type_templates.data_attribute_types.@set (dat.id, dat);
         var t = dscl.data_type_templates.data_attribute_types.@get (dat.id);
         if (t == null)
           stdout.printf (@"No Obeject Exists:\n");
         //        var bda = new tBDA ();
         //        bda.name = "attr1";
         //        dat.BDA.set_at (bda.name, bda);
         dscl.serialize (doc);
         //        stdout.printf (@"SCL:\n $(doc)\n");
         if (doc.document_element == null) {
           stdout.printf (@"ERROR: SCL NODE: no node");
           assert_not_reached ();
         }
         if (doc.document_element.node_name.up () != "SCL") {
           stdout.printf (@"ERROR: SCL NODE: node name $(doc.document_element.node_name)");
           assert_not_reached ();
         }
         Element element = doc.document_element;
         if (!element.has_child_nodes ()) {
           stdout.printf (@"ERROR: SCL NODE: no child nodes $(doc.document_element)");
           assert_not_reached ();
         }
         bool found = false;
         Element dt = doc.document_element;
         foreach (GXml.Node n in doc.document_element.child_nodes) {
           if (n is Element) {
             if (n.node_name == "DataTypeTemplates") {
               found = true;
               dt = (Element) n;
             }
           }
         }
         if (!found) {
           stdout.printf (@"ERROR: SCL NODE: No DataTypeTemplates node found\n$(doc)");
           assert_not_reached ();
         }
         if (!dt.has_child_nodes ()) {
           stdout.printf (@"ERROR: SCL NODE: DataTypeTemplates has NO nodes\n$(doc)");
           assert_not_reached ();
         }
       }
       catch (GLib.Error e)
       {
         stdout.printf (@"ERROR: $(e.message)");
         assert_not_reached ();
       }
      });
    Test.add_func ("/librescl-test-suite/write-ieds-scl-ed1", 
      () => {
       var doc = new Document ();
       var dscl = new SclDocument ();
       //string tn = typeof (tDataTypeTemplates).name ().replace ("Lsclt","");
       //stdout.printf (@"Test Node name: $(tn)");
       try {
         dscl.ieds = new tIED.Collection ();
         dscl.serialize (doc);
         //        stdout.printf (@"SCL:\n $(doc)\n");
         if (doc.document_element == null) {
           stdout.printf (@"ERROR: SCL NODE: no node");
           assert_not_reached ();
         }
         if (doc.document_element.node_name.up () != "SCL") {
           stdout.printf (@"ERROR: SCL NODE: node name $(doc.document_element.node_name)");
           assert_not_reached ();
         }
         Element element = doc.document_element;
         if (element.has_child_nodes ()) {
           stdout.printf (@"ERROR: SCL NODE: have child nodes $(doc.document_element)");
           assert_not_reached ();
         }
       }
       catch (GLib.Error e)
       {
         stdout.printf (@"ERROR: $(e.message)");
         assert_not_reached ();
       }
      });
    Test.add_func ("/librescl-test-suite/write-communication-scl-ed1", 
      () => {
       var doc = new Document ();
       var dscl = new SclDocument ();
       //string tn = typeof (tDataTypeTemplates).name ().replace ("Lsclt","");
       //stdout.printf (@"Test Node name: $(tn)");
       try {
         dscl.communication = new tCommunication ();
         dscl.serialize (doc);
         //        stdout.printf (@"SCL:\n $(doc)\n");
         if (doc.document_element == null) {
           stdout.printf (@"ERROR: SCL NODE: no node");
           assert_not_reached ();
         }
         if (doc.document_element.node_name.up () != "SCL") {
           stdout.printf (@"ERROR: SCL NODE: node name $(doc.document_element.node_name)");
           assert_not_reached ();
         }
         Element element = doc.document_element;
         if (!element.has_child_nodes ()) {
           stdout.printf (@"ERROR: SCL NODE: no child nodes $(doc.document_element)");
           assert_not_reached ();
         }
         bool found = false;
         Element dt = doc.document_element;
         foreach (GXml.Node n in doc.document_element.child_nodes) {
           if (n is Element) {
             if (n.node_name == "Communication") {
               found = true;
               dt = (Element) n;
             }
           }
         }
         if (!found) {
           stdout.printf (@"ERROR: SCL NODE: No Communication node found\n$(doc)");
           assert_not_reached ();
         }
         if (dt.has_child_nodes ()) {
           stdout.printf (@"ERROR: SCL NODE: Communication has nodes\n$(doc)");
           assert_not_reached ();
         }
       }
       catch (GLib.Error e)
       {
         stdout.printf (@"ERROR: $(e.message)");
         assert_not_reached ();
       }
      });
    Test.add_func ("/librescl-test-suite/write-substation-scl-ed1", 
      () => {
       var doc = new Document ();
       var dscl = new SclDocument ();
       //string tn = typeof (tDataTypeTemplates).name ().replace ("Lsclt","");
       //stdout.printf (@"Test Node name: $(tn)");
       try {
         dscl.substation = new tSubstation ();
         dscl.serialize (doc);
         //        stdout.printf (@"SCL:\n $(doc)\n");
         if (doc.document_element == null) {
           stdout.printf (@"ERROR: SCL NODE: no node");
           assert_not_reached ();
         }
         if (doc.document_element.node_name.up () != "SCL") {
           stdout.printf (@"ERROR: SCL NODE: node name $(doc.document_element.node_name)");
           assert_not_reached ();
         }
         Element element = doc.document_element;
         if (!element.has_child_nodes ()) {
           stdout.printf (@"ERROR: SCL NODE: no child nodes $(doc.document_element)");
           assert_not_reached ();
         }
         bool found = false;
         Element dt = doc.document_element;
         foreach (GXml.Node n in doc.document_element.child_nodes) {
           if (n is Element) {
             if (n.node_name == "Substation") {
               found = true;
               dt = (Element) n;
             }
           }
         }
         if (!found) {
           stdout.printf (@"ERROR: SCL NODE: No Substation node found\n$(doc)");
           assert_not_reached ();
         }
         if (dt.has_child_nodes ()) {
           stdout.printf (@"ERROR: SCL NODE: Substationhas nodes\n$(doc)");
           assert_not_reached ();
         }
       }
       catch (GLib.Error e)
       {
         stdout.printf (@"ERROR: $(e.message)");
         assert_not_reached ();
       }
      });
    Test.add_func ("/librescl-test-suite/write-header-scl-ed1", 
      () => {
       var doc = new Document ();
       var dscl = new SclDocument ();
       //string tn = typeof (tDataTypeTemplates).name ().replace ("Lsclt","");
       //stdout.printf (@"Test Node name: $(tn)");
       try {
         dscl.header = new tHeader ();
         dscl.serialize (doc);
         //        stdout.printf (@"SCL:\n $(doc)\n");
         if (doc.document_element == null) {
           stdout.printf (@"ERROR: SCL NODE: no node");
           assert_not_reached ();
         }
         if (doc.document_element.node_name.up () != "SCL") {
           stdout.printf (@"ERROR: SCL NODE: node name $(doc.document_element.node_name)");
           assert_not_reached ();
         }
         Element element = doc.document_element;
         if (!element.has_child_nodes ()) {
           stdout.printf (@"ERROR: SCL NODE: no child nodes $(doc.document_element)");
           assert_not_reached ();
         }
         bool found = false;
         Element dt = doc.document_element;
         foreach (GXml.Node n in doc.document_element.child_nodes) {
           if (n is Element) {
             if (n.node_name == "Header") {
               //          stdout.printf (@"Node: $(n.node_name)");
               found = true;
               dt = (Element) n;
             }
           }
         }
         if (!found) {
           stdout.printf (@"ERROR: SCL NODE: No Header node found\n$(doc)");
           assert_not_reached ();
         }
         if (dt.has_child_nodes ()) {
           stdout.printf (@"ERROR: SCL NODE: Header has nodes\n$(doc)");
           assert_not_reached ();
         }
       }
       catch (GLib.Error e)
       {
         stdout.printf (@"ERROR: $(e.message)");
         assert_not_reached ();
       }
      });
    Test.add_func ("/librescl-test-suite/write-data_attribute_types-duplicated-dba-ed1", 
      () => {
       try {
         var idoc = new Document.from_path (LsclTest.TEST_DIR + "/tests-files/data-type-template-datypes.cid");
         var iscl = new Scl ();
         //        stdout.printf ("INITIAL SCL\n");
         iscl.deserialize (idoc);
         {
           if (iscl.data_type_templates.data_attribute_types.duplicated != null) {
             var datd = iscl.data_type_templates.data_attribute_types.duplicated.size;
             //stdout.printf (@"INITIAL SCL: datypes size $(datd)\n");
             foreach (tDAType d in iscl.data_type_templates.data_attribute_types.values)
             {
               if (d.serialized_xml_node_value != null) {
                 //stdout.printf (@"$(d.id): $(d.serialized_xml_node_value)\n");
               }
             }
           }
         }
         var doc = new Document ();
         iscl.serialize (doc);
         var scl = new Scl ();
         //stdout.printf (@"FINALY SCL\n$doc");
         scl.deserialize (doc);
         {
           assert (scl.data_type_templates != null);
           assert (scl.data_type_templates.data_attribute_types != null);
           assert (scl.data_type_templates.data_attribute_types.duplicated != null);
         }
         if (scl.data_type_templates.data_attribute_types.duplicated.size != 1) {
           stdout.printf (@"ERROR: Wrong duplicated DA type: find $(scl.data_type_templates.data_attribute_types.duplicated.size)\n");
         }
         if (scl.data_type_templates.data_attribute_types.duplicated.size != 1) {
           stdout.printf (@"ERROR: Wrong duplicated DA type: find $(scl.data_type_templates.data_attribute_types.duplicated.size)\n");
         }
         //stdout.printf (@"ORIGINAL:$idoc\n>>>>>><\n");
         var dt = scl.data_type_templates;
         var dats = dt.data_attribute_types;
         // This return the one in main collection, no the duplicated one
         var dat = dats.get ("RRECRecModStruct");
         if (dat.bdas.duplicated.size != 1) {
           stdout.printf (@"ERROR: BDA: Wrong duplicated size. Expected 1, got: $(dat.bdas.duplicated.size)\n");
           foreach (tBDA b in dat.bdas.duplicated) {
             stdout.printf (@"Duplicated: $(b.name)\n");
           }
           stdout.printf (@"$(doc)\n");
           assert_not_reached ();
         }
         var dup = dat.bdas.duplicated.get (0);
         if (dup == null) {
           stdout.printf (@"ERROR: BDA: No duplicated found!\n");
           assert_not_reached ();
         }
         if (dup.name != "Operated") {
           stdout.printf (@"ERROR: BDA: Duplicated bad name. Expected 'Operated', got: $(dup.name)\n");
           assert_not_reached ();
         }
         if (dup.b_type != "BOOLEAN") {
           stdout.printf (@"ERROR: BDA: Wrong value for bType. Expected BOOLEAN, got: $(dup.b_type)\n");
           assert_not_reached ();
         }
         if (dup.val_kind != (Enumeration.parse (typeof (tValKindEnum), "RO")).value) {
           stdout.printf (@"ERROR: BDA: Wrong value for valKind. Expected RO, got: $(dup.val_kind)\n");
           assert_not_reached ();
         }
         if (dup.count != 2) {
           stdout.printf (@"ERROR: BDA: Wrong value for count. Expected 2, got: $(dup.count)\n");
           assert_not_reached ();
         }
         string[] vals = {"FALSE","TRUE"};
         for (int k = 0; k < vals.length; k++) {
           if ((dup.vals.get (k)).get_value () != vals[k]) {
             stdout.printf (@"ERROR: BDA: Wrong value for array element $k. Expected $(vals[k]), got: $((dup.vals.get (k)).get_value ())\n");
             assert_not_reached ();
           }
         }
       }
       catch (GLib.Error e)
       {
         stdout.printf (@"ERROR: $(e.message)");
         assert_not_reached ();
       }
      });
    }
}
