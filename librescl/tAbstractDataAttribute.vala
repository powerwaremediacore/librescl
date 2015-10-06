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
    [Description(blurb="Attribute's value.")]
    public tVal.Array vals { get; set; default = new tVal.Array (); }
    [Description(nick="name", blurb="The attribute name.")]
    public string name { get; set; }
    [Description(nick="sAddr", blurb="A short address of this BDA attribute.")]
    public string s_addr { get; set; }
    [Description(nick="bType", blurb="The basic type of the attribute.")]
    public tBasicType b_type { get; set; default = new tBasicType ("bType"); }
    [Description(nick="valKind", blurb="Determines how the value shall be interpreted if any is given.")]
    public tValKind val_kind { get; set; default = new tValKind ("valKind"); }
    [Description(nick="type", blurb="It's used to refer to the appropriate enumeration type or DAType definition.")]
    public string data_type { get; set; }
    [Description(nick="count", blurb="Shall state the number of array elements in the case where the attribute is an array.")]
    public string count { get; set; }
  }
}
