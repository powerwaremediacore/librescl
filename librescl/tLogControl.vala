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
  public class tLogControl : tControlWithTriggerOpt, SerializableMapKey<string>
  {
    [Description (nick="logName", blurb="Reference to the LD, which is the owner of the log.")]
    public string log_name { get; set; }
    [Description (nick="logEna", blurb="Logging is enable if TRUE")]
    public bool log_ena { get; set; default = true;}
    [Description (nick="reasonCode", blurb="If true this Logging Control Block have Trigger Options")]
    public bool reason_code { get; set; default = true; }
    // Edition 2.0
    [Description (nick="ldInst", blurb="Logical Device instance for this log control block")]
    public string ld_inst { get; set; }
    [Description (nick="prefix", blurb="Logical Node prefix")]
    public string prefix { get; set; }
    [Description (nick="lnClass", blurb="Logical Node class")]
    public string ln_class { get; set; }
    [Description (nick="lnInst", blurb="Logical Node instance")]
    public string ln_inst { get; set; }
    [Description(nick="bufTime", blurb="Buffer time")]
    public string buf_time { get; set; default = "0"; }

    public tLogControl ()
    {
      _property_edition.set ("ld-inst", Edition.SECOND);
      _property_edition.set ("prefix", Edition.SECOND);
      _property_edition.set ("ln-class", Edition.SECOND);
      _property_edition.set ("ln-inst", Edition.SECOND);
      _property_edition.set ("buf-time", Edition.SECOND);
    }

    public string get_map_key () { return name; }
    public class Collection : GXml.SerializableHashMap<string, tLogControl>
    {
      public new tLogControl @get (string name) { return base.get (name); }
    }
  }
}
