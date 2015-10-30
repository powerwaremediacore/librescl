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
  public class tDO : tUnNaming, SerializableMapKey<string>
  {
    public tDO() {}
    [Description(nick="name", blurb="")]
    public string name { get; set; }
    [Description(nick="type", blurb="The type references the id of a DOType definition.")]
    public string do_type { get; set; }
    [Description(nick=" accessControl", blurb="Access control definition for this DO.")]
    public string access_control { get; set; }
    [Description(nick="transient", blurb="If set to true, it indicates that the Transient definition applies.")]
    public SerializableBool transient { get; set; }
    // SerializableMapId
    public string get_map_key () { return name; }
    public class HashMap : SerializableHashMap<string,tDO> {
      public new tDO get (string name) { return base.get (name); }
    }
  }
}

