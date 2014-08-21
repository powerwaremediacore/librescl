/**
 *
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <esodan@gmail.com>
 *
 *
 *  Copyright (c) 2013 Daniel Espinosa
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
  public class tLogControl : tControlWithTriggerOpt, SerializableMapKey<string>
  {
    [Description (nick="logName", blurb="Reference to the LD, which is the owner of the log.")]
    public string log_name { get; set; }
    [Description (nick="logEna", blurb="Logging is enable if TRUE")]
    public bool logEna { get; set; default = true;}
    [Description (nick="reasonCode", blurb="If true this Logging Control Block have Trigger Options")]
    public bool reasonCode { get; set; default = true; }

    public string get_map_key () { return name; }
    public class Collection : GXml.SerializableHashMap<string, tLogControl>
    {
      public new tLogControl @get (string name) { return base.get (name); }
    }
  }
}
