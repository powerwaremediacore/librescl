/**
 *
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <esodan@gmail.com>
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
using Gee;

namespace Lscl
{
   /**
    * LSCL_EDITION:
    * 
    * Holds actual version used to generate SCL compliant files.
    * 
    * Generate Edition 2.0 compliant files are considered incomplete.
    * You can read and write Edition 2.0 files, but some attributes could
    * not be available on actual API.
    */
    public enum Edition {
	    FIRST,
	    SECOND
    }
    public class Serializable : GXml.GomElement
    {
    protected Edition _edition;
    protected bool _enable_proprietary = false;
    /**
     * Add elements to this property in order to mark any property
     * as present just on a defined version. Use property's canonical 
     * name as collection value and edition number it belongs to.
     * 
     * To set a property 'trg_ops' as a second edition property use
     * 'trg-ops' as value and a Lscl.Edition.SECOND as key.
     * 
     * See at Lscl.Edition enum for supported editions.
     * 
     */
	  protected Gee.HashMultiMap<string,Edition> _property_edition;
    /**
     * 
     */
    public bool set_edition (Edition edition) {
      return_val_if_fail (edition == Edition.FIRST || edition == Edition.SECOND, false);
      _edition = edition;
      return true;
    }
    public Edition get_edition () {
      return _edition;
    }

    protected string nname = null;

    construct {
      Init.init ();
      _edition = Edition.FIRST;
      _property_edition = new Gee.HashMultiMap<string,Edition> ();
      nname = get_type ().name ();
      if ("Lsclt" in nname)
        nname = nname.replace ("Lsclt","");
      else {
        if ("Lscl" in nname)
          nname = nname.replace ("Lscl","");
      }
      try { initialize (nname); }
      catch (GLib.Error e ) {
        warning ("Error: "+e.message);
      }
    }
    public virtual string to_string () {
      string s = "";
      try { s = write_string (); } catch { return ""; }
      return s;
    }
    public virtual string get_id ()
    {
      return get_type ().name ();
    }
  }
}

