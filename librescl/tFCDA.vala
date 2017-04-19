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
  public class tFCDA : Serializable
  {
    [Description(nick="::ldInst", blurb="Logical Device instance")]
    public string ld_inst { get; set; default=""; }
    public tLDevice logical_device { get; set; }
    [Description(nick="::prefix",blurb="Prefix")]
    public new string prefix { get; set; default = ""; }
    [Description(nick="::lnClass",blurb="Logical Node class")]
    public tLNClassEnum ln_class { get; set; }
    [Description(nick="::lnInst",blurb="Logical Node instance")]
    public string ln_inst { get; set; }
    [Description(nick="::doName",blurb="Data Object name")]
    public string do_name { get; set; }
    [Description(nick="::daName",blurb="Data Attribute name")]
    public string da_name { get; set; }
    [Description(nick="::fc",blurb="Functional Code")]
    public tFC fc { get; set; }

    public class Array : GomArrayList {
      construct {
        try { initialize (typeof (tFCDA)); }
        catch (GLib.Error e) { warning ("Error: "+e.message); }
      }
    }
  }
}

