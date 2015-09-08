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
  public class tConnectedAP : tUnNaming, SerializableMapDualKey<string,string>
  {
    [Description(nick="Address",blurb="Network address communication parameters")]
    public tAddress address { get; set; }
    [Description(nick="GSE",blurb="Generic Station Event control blocks")]
    public tGSE.DualKeyMap gses { get; set; default = new tGSE.DualKeyMap (); }
    [Description(nick="SMV",blurb="Sample Value control blocks")]
    public tSMV.DualKeyMap smvs { get; set; default = new tSMV.DualKeyMap (); }
    [Description(nick="PhysConn",blurb="Physical Connection")]
    public tPhysConn phys_conn { get; set; }
    [Description(nick="iedName",blurb="IED's name, connected to network")]
    public string ied_name { get; set; }
    [Description(nick="apName",blurb="IED's Access Point's name, connected to network")]
    public string ap_name  { get; set; }
    // SerializableMapDualId
    public string get_map_primary_key () { return ied_name; }
    public string get_map_secondary_key () { return ap_name; }

    public class DualKeyMap : SerializableDualKeyMap<string,string,tConnectedAP> {
			public new tConnectedAP get (string ied, string ap) { return base.get (ied, ap); }
		}
  }
}
