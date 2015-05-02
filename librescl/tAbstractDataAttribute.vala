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
  public class tAbstractDataAttribute : tUnNaming
  {
    private tBasicType _btypeenum;
    public tAbstractDataAttribute() 
    {
      //this.valKind = tValKindEnum.Set;
      //this.count = ((uint)(0));
      this._btypeenum = new tBasicType();
    }
    [Description(blurb="Attribute's value.")]
    public tVal.Array vals { get; set; }
    [Description(nick="name", blurb="The attribute name.")]
    public string name { get; set; }
    [Description(nick="sAddr", blurb="A short address of this BDA attribute.")]
    public string s_addr { get; set; }
    [Description(nick="bType", blurb="The basic type of the attribute.")]
    public string b_type
    { get {
        if (_btypeenum == null)
          _btypeenum = new tBasicType ();
        return _btypeenum.b_type;
      }
      set {
        if (_btypeenum == null)
          _btypeenum = new tBasicType ();
        _btypeenum.b_type = value;
      }
    }
    [Description(nick="valKind", blurb="Determines how the value shall be interpreted if any is given.")]
    public tValKindEnum val_kind { get; set; }
    [Description(nick="type", blurb="It's used to refer to the appropriate enumeration type or DAType definition.")]
    public string data_type { get; set; }
    [Description(nick="count", blurb="Shall state the number of array elements in the case where the attribute is an array.")]
    public string count { get; set; }
    // Serializable
    public override GXml.Node? deserialize (GXml.Node node)
                                    throws GLib.Error
                                    requires (node is Element)
    {
      var element = (Element) node;
      if (element.childs.size > 0) {
        if (vals == null)
          vals = new tVal.Array ();
        vals.deserialize (element);
      }
      return default_deserialize (node);
    }
  }
	public enum tValKindEnum
  {
    SPEC, //Spec,
    CONF, //Conf,
    RO,
    SET; // Set
    public string to_string ()
    {
      try {
        return GXml.Enumeration.get_nick_camelcase (typeof (tValKindEnum), this);
      } catch (GLib.Error e) {
        GLib.warning ("tValKindEnum get nick camelcase error: %s", e.message);
      }
      return "<<INVALID VALUE KIND>>";
    }
    public static tValKindEnum parse (string str)
    {
      try {
        return (tValKindEnum) (GXml.Enumeration.parse (typeof (tValKindEnum), str)).value;
      } catch (GLib.Error e) {
        GLib.warning ("tValKindEnum parse error: %s", e.message);
      }
      return tValKindEnum.SET;
    }
  }
}
