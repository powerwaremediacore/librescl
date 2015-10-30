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
  public class tLNode : tUnNaming 
  {
    [Description(nick="lnInst",blurb="Logical Node instance")]
    public string ln_inst { get; set; }
    [Description(nick="lnClass",blurb="Logical Node Class")]
    public tLNClassEnum ln_class { get; set; }
    [Description(nick="iedName",blurb="IED's name")]
    public string ied_name { get; set; }
    [Description(nick="ldInst",blurb="Logical Device instance")]
    public string ld_inst { get; set; }
    [Description(nick="prefix",blurb="Logical Node prefix")]
    public string prefix { get; set; }
    [Description(nick="lnType",blurb="Logical Node type")]
    public string ln_type { get; set; }

    public class Array : SerializableArrayList<tLNode> {
			public new tLNode get (int index) { return base.get (index); } 
		}
  }
}

