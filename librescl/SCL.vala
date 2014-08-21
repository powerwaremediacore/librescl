/**
 *  LibOpenSCL
 *  Copyright (C) 2013, 2014 Daniel Espinosa <esodan@gmail.com>
 *  
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public
 *  License as published by the Free Software Foundation; either
 *  version 3 of the License, or (at your option) any later version.
 *  
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *  
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

namespace Lscl
{
  public class Scl : tBaseElement
  {
    [Description (nick="Header", blurb="History information about changes")]
    public tHeader header { get; set; }
    [Description (nick="Substation",
                  blurb="Substation configuration and nodes association")]
    public tSubstation substation { get; set; }
    [Description (nick="Communication",
                  blurb="Subneworks and communications descriptions")]
    public tCommunication communication { get; set; }
    [Description (blurb="IEDs defined in this configuration file")]
    public tIED.Collection ieds { get; set; }
    [Description (nick="DataTypeTemplates", blurb="Templates")]
    public tDataTypeTemplates data_type_templates { get; set; }

    public override GXml.Node? serialize (GXml.Node node) throws GLib.Error
    {
      var n = default_serialize (node);
      n.add_namespace_attr ("http://www.iec.ch/61850/2003/SCL", "scl");
      return n;
    }
    public override string node_name ()
    {
      return "SCL";
    }
    public override void init_containers ()
    {
      if (ieds == null)
        ieds = new tIED.Collection ();
    }

   public new string to_string ()
   {
     string str = "SCL File:\n";
     if (header != null)
       str += _("Version: ") + header.version + "\n"
       + "Revision: " + header.revision + "\n";
     if (communication != null) {
       if (communication.subnetworks != null)
         str += "Subnetworks: "+ communication.subnetworks.size.to_string () + "\n";
     }
     if (ieds != null)
       str += "Total IED number: " + ieds.size.to_string () + "\n";
     if (data_type_templates != null) {
       if (data_type_templates.logical_node_types != null)
         str += "Total LN Types: " + data_type_templates.logical_node_types.size.to_string ()
         + "\n";
       if (data_type_templates.data_object_types != null)
         str += "Total DO Types: " + data_type_templates.data_object_types.size.to_string ()
         + "\n";
       if (data_type_templates.data_attribute_types != null)
         str += "Total DA Types: " + data_type_templates.data_attribute_types.size.to_string ()
         + "\n";
       if (data_type_templates.enum_types != null)
         str += "Total Enum Types: " + data_type_templates.enum_types.size.to_string ()
         + "\n";
     }
     return str;
   }
  }
}
