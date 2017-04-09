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
 *  Copyright (c) 2013, 2017 Daniel Espinosa
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
  public class tHitem : Serializable
  {
    [Description(nick="::version", blurb="Version")]
    public string version { get; set; }
    [Description(nick="::revision", blurb="Revision")]
    public string revision { get; set; }
    [Description(nick="::when", blurb="When was made")]
    public GomDateTime when { get; set; }
    [Description(nick="::who", blurb="Who do it")]
    public string who { get; set; }
    [Description(nick="::what", blurb="What changed/worked on")]
    public string what { get; set; }
    [Description(nick="::why", blurb="Why it was done")]
    public string why { get; set; }
    construct {
      version = "0";
      revision = "0";
      var t = new DateTime.now_local ();
      when = new GomDateTime ();
      when.set_datetime (t);
      what = "";
      who = Defaults.HISTORY_ITEM_WHO;
      why = Defaults.HISTORY_ITEM_WHY;
    }
    public override string to_string ()
    {
      return @"Ver $(version) / Rev $(revision) / When '$(when.value)'";
    }
    public class Array : GomArrayList {
      construct {
        try { initialize (typeof (tHitem)); }
        catch (GLib.Error e) { warning ("Error: "+e.message); }
      }
    }
  }
}

