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
  public class tLDevice : tUnNaming, SerializableMapKey<string>
  {
    [Description(nick="LN0",blurb="Logical Device's Logical Node")]
    public LN0 ln0 { get; set; }
    [Description(blurb="Logical Nodes defined in the Logical Node")]
    public tLN.Collection logical_nodes { get; set; }
    [Description(nick="AccessControl",blurb="")]
    public tAccessControl access_control { get; set; }
    [Description(nick="inst",blurb="")]
    public string inst { get; set; }
    // SerializableMapKey
    public string get_map_key () { return inst; }
    // Serializable
    public override void init_containers ()
    {
      if (logical_nodes == null)
        logical_nodes = new tLN.Collection ();
    }
    public class HashMap : SerializableHashMap<string,tLDevice> {}
  }
}

