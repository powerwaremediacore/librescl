/**
 *
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <esodan@gmail.com>
 *       PowerMedia Consulting <pwmediaconsulting@gmail.com>
 *
 *
 *  Copyright (c) 2013, 2014 Daniel Espinosa
 *  Copyright (c) 2014 PowerMedia Consulting
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
using GXml;
namespace Lscl
{
  public class tControlWithIEDName : tControl
  {
    [Description(nick="IEDName", blurb="")]
    public tIEDName.Array ied_names { get; set; }
    [Description(nick="confRev", blurb="")]
    public string conf_rev { get; set; }
    [Description(nick="confRevSpecified", blurb="")]
    public SerializableBool conf_rev_specified {get; set; }

    public override void init_containers ()
    {
      if (ied_names == null)
        ied_names = new tIEDName.Array ();
    }
  }
  public class tIEDName : Serializable
  {
    [Description (nick="apRef", blurb="Referenced Access Point")]
    public string ap_ref { get; set; }
    [Description (nick="ldInst")]
    public string ldinst { get;  set; }
    [Description (nick="prefix")]
    public string prefix { get; set; }
    [Description (nick="lnClass")]
    public tLNClassEnum ln_class { get; set; }
    [Description (nick="lnInst")]
    public string ln_inst { get; set; }

    public void set_value (string val) { serialized_xml_node_value = val; }
    public string get_value () { return serialized_xml_node_value; }
    public override bool serialize_use_xml_node_value () { return true; }

    public class Array : SerializableArrayList<tIEDName> {
			public new tIEDName get (int index) { return base.get (index); }
      public new tIEDName[] to_array () { return ((Gee.Collection<tIEDName>) this).to_array (); }
		}
  }
}
