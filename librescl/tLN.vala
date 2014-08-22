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
  /**
   * A Logical Node to be added to a collection in Logical Devices.
   *
   * {link tLN.Collection} has three keys. First to use must be ln_class; second
   * use inst and third use prefix, when you set a Logical Node to this collection.
   */
  public class tLN : tAnyLN, SerializableMapThreeKey<string,string,string>
  {
    [Description(nick="lnClass",blurb="")]
    public string ln_class { get; set; }
    [Description(nick="inst",blurb="")]
    public string inst { get; set; default = "1"; }
    [Description(nick="prefix",blurb="")]
    public string prefix { get; set; default = ""; }

    public string get_map_primary_key  () { return ln_class; }
    public string get_map_secondary_key () { return inst; }
    public string get_map_tertiary_key () { return prefix; }

    public class Collection : ThreeMap<string,string,string,tLN>
    {
      public tLN find (string prefix, string lnclass, string inst)
      {
        return @get (lnclass, inst, prefix);
      }
    }
  }
}
