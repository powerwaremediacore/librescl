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
  public class tAccessPoint : tNaming, GXml.SerializableMapKey<string>
  {
    [Description(nick="router", blurb="This is a function of the communication network on the IED.")]
    public bool router { get; set; default= false; }
    [Description(nick="clock", blurb="The presence and setting to true defines this IED to be a master clock at this bus.")]
    public bool clock { get; set; default= false; }
    [Description(nick="Server", blurb="A communication entity within an IED.")]
    public tServer server { get; set; }
    [Description(blurb="List of Logical Nodes related with access point")]
    public tLN.ThreeMap logical_nodes { get; set; }
    // SerializableMapId
    public string get_map_key () { return name; }

    // Serializable
    public override GXml.Node? deserialize (GXml.Node node)
                                    throws GLib.Error
                                    requires (node is Element)
    {
      var element = (Element) node;
      if (element.has_child_nodes ()) {
        if (logical_nodes == null)
          logical_nodes = new tLN.ThreeMap ();
        logical_nodes.deserialize (element);
      }
      return default_deserialize (node);
    }

    public class HashMap : SerializableHashMap<string,tAccessPoint> {}
  }
}

