/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*-  */
/*
 * Lscl
 *
 *  Authors:
 *
 *       Daniel Espinosa <esodan@gmail.com>
 *       PowerMedia Consulting <pwmediaconsulting@gmail.com>
 *
 *
 *  Copyright (c) 2014-2017 Daniel Espinosa
 *  Copyright (c) 2014 PowerMedia Consulting
 *
 * librescl is free software: you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * librescl is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.";
 */
 using GXml;
namespace Lscl
{
  public class tExtRef : Serializable
  {
    [Description (nick="::tIEDName")]
    public string ied_name { get; set; }
    [Description (nick="::ldInst")]
    public string ld_inst { get; set; }
    public new string prefix { get; set; }
    [Description (nick="::lnClass")]
    public tLNClassEnum ln_class { get; set; }
    [Description (nick="::lnInst")]
    public string ln_inst { get; set; }
    [Description (nick="::doName")]
    public string do_name { get; set; }
    [Description (nick="::daName")]
    public string da_name { get; set; }
    [Description (nick="::intAddr")]
    public string int_addr { get; set; }
    [Description (nick="::serviceType")]
    public tServiceType service_type { get; set; }
    [Description (nick="::srcLDInst")]
    public string src_ld_inst { get; set; }
    [Description (nick="::srcPrefix")]
    public string src_prefix { get; set; }
    [Description (nick="::srcLNClass")]
    public tLNClassEnum src_ln_class { get; set; }
    [Description (nick="::srcLNInst")]
    public string src_ln_inst { get; set; }
    [Description (nick="::srcCBName")]
    public string src_cb_name { get; set; }
    
    public class Array : GomArrayList {
      construct {
        try { initialize (typeof (tExtRef)); }
        catch (GLib.Error e) { warning ("Error: "+e.message); }
      }
    }
  }
  // tExtRef.service_type must have just one of this enum value
  public class tServiceType : GomEnum
  {
    construct {
      try { initialize_enum (typeof (Enum)); }
      catch (GLib.Error e) { warning ("Error: "+e.message); }
	  }
    public enum Enum
    {
      POLL,
      REPORT,
      GOOSE,
      SMV
    }
  }
}
