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

namespace Lscl
{
  public class tRptEnabled : tUnNaming
  {
    [Description(nick="max", blurb="Defines the maximum number of report control blocks of this type")]
    public string max { get; set; default="1"; }
    /* Edition 2.0 */
    [Description(nick="ClientLN", blurb="Logical Node client in the system of this report")]
    public tClientLN.Array clients_ln { get; set; default = new tClientLN.Array (); }
		public tRptEnabled ()
		{
			_property_edition.set ("clients-ln", Edition.SECOND);
		}
  }
}

