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
 *  Copyright (c) 2013, 2014, 2017 Daniel Espinosa
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
  public class tGSE : tControlBlock, SerializableMapDualKey<string,string>
  {
    [Description(nick="MinTime", blurb="Minimal Time")]
    public tMinTime min_time { get; set; }
    [Description(nick="MaxTime", blurb="Max Time")]
    public tMaxTime max_time  { get; set; }

    public string get_map_primary_key  () { return ld_inst; }
    public string get_map_secondary_key () { return cb_name; }

    public class DualKeyMap : SerializableDualKeyMap<string,string,tGSE> {
      public new tGSE get (string ldinst, string cbname) { return base.get (ldinst, cbname); }
    }
    public class tMinTime : tDurationInMilliSec
    {
      construct {
        try { initialize ("MinTime"); }
        catch (GLib.Error e ) {
          warning ("Error: "+e.message);
        }
      }
    }
    public class tMaxTime : tDurationInMilliSec
    {
      construct {
        try { initialize ("MaxTime"); }
        catch (GLib.Error e ) {
          warning ("Error: "+e.message);
        }
      }
    }
  }
}
