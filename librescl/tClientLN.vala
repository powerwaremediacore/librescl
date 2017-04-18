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
 *  Copyright (c) 2013 Daniel Espinosa
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
  public class tClientLN : Serializable
  {
		construct {
      _property_edition.set ("ap-ref", Edition.SECOND);
      _property_edition.set ("desc", Edition.SECOND);
		}
    [Description(nick="iedName", blurb="The name of the IED where the LN resides")]
    public string ied_name { get; set; }
    [Description(nick="ldInst", blurb="The instance identification of the LD where the LN resides")]
    public string ld_inst { get; set; }
    [Description(nick="prefix", blurb="The Logical Node prefix")]
    public string prefix { get; set; }
    [Description(nick="lnClass", blurb="The Logical Node class")]
    public tLNClassEnum ln_class { get; set; }
    [Description(nick="lnInst", blurb="The instance id of this LN instance of below LN class in the IED")]
    public string ln_inst { get; set; }
    /* Edition 2.0 */
    [Description(nick="apRef", blurb="The name of the access point via which the IED shall be accessed. Optional, not needed if the IED has only one access point")]
    public string ap_ref { get; set; }
    [Description(nick="desc", blurb="Description")]
    public string desc { get; set; }

    public new string to_string () {
      string str = "";
      if (ied_name != null) str += ied_name + ".";
      if (ap_ref != null) str += ap_ref + "/";
      if (ld_inst != null) str += ld_inst + "/";
      if (prefix != null) str += prefix;
      if (ln_class.value != null) str += ln_class.value;
      if (ln_inst != null) str += ln_inst;
      return str;
    }

    public class Array : SerializableArrayList<tClientLN> {
			public new tClientLN get (int index) { return base.get (index); }
      public new tClientLN[] to_array () { return ((Gee.Collection<tClientLN>) this).to_array (); }
		}
  }
}

