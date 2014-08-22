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
	public class tTerminal : tUnNaming 
	{
		[Description(nick="name", blurb="The optional relative name of the terminal at this Equipment")]
		public string name { get; set; default = ""; }
		[Description(nick="connectivityNode", blurb="The pathname of the connectivity node to which this terminal connects")]
		public string connectivity_node { get; set; }
		[Description(nick="substationName", blurb="The name of the substation containing the connectivityNode")]
		public string substation_name { get; set; }
		[Description(nick="voltageLevelName", blurb="The name of the voltage level containing the connectivityNode")]
		public string voltageLevel_name { get; set; }
		[Description(nick="bayName", blurb="The name of the bay containing the connectivityNode")]
		public string bay_name { get; set; }
		[Description(nick="cNodeName", blurb="The (relative) name of the connectivityNode within its bay")]
		public string connectivity_node_name { get; set; }
	}
}

