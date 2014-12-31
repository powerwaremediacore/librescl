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
  public class tReportControl : tControlWithTriggerOpt, SerializableMapKey<string>
  {
    [Description(nick="OptFields", blurb="Contains the list of client LNs for which this report shall be enabled")]
    public tReportControlOptFields opt_fields { get; set; }
    [Description(nick="RptEnabled", blurb="Contains the list of client LNs for which this report shall be enabled")]
    public tRptEnabled rpt_enabled  { get; set; }
    [Description(nick="rptID", blurb="Identifier for the report control block")]
    public string rpt_id  { get; set; }
    [Description(nick="confRev", blurb="The configuration revision number of this report control block")]
    public string conf_rev { get; set; default = "0"; }
    [Description(nick="buffered",blurb="Specifies if reports are buffered or not")]
    public bool buffered { get; set; default = false; }
    [Description(nick="bufTime", blurb="Buffer time")]
    public string buf_time { get; set; default = "0"; }

    public string get_map_key () { return name; }
    public class Collection : GXml.SerializableHashMap<string, tReportControl>
    {
      public new tReportControl @get (string name) { return base.get (name); }
    }
  }
}

