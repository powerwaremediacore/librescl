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
 *  Copyright (c) 2013, 2015 Daniel Espinosa
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
  public class tAssociation : Serializable
  {
    [Description(nick="kind", blurb="The kind of pre-configured association, pre-established or predefined")]
    public tAssociationKind kind  { get; set; }
    [Description(nick="associationID", blurb="The identification of a pre-configured association")]
    public string association_id { get; set; }
    [Description(nick="iedName", blurb="The reference identifying the IED on which the client resides")]
    public string ied_name { get; set; }
    [Description(nick="ldInst", blurb="The reference to the client logical device")]
    public string ld_inst { get; set; }
    [Description(nick="prefix",blurb="The LN prefix")]
    public string prefix { get; set; default = ""; }
    [Description(nick="lnClass", blurb="The class of the client LN")]
    public tLNClassEnum ln_class { get; set; }
    [Description(nick="lnInst", blurb="The instance number of the client LN")]
    public string ln_inst { get; set; }
  }
}
