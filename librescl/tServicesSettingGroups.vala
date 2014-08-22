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

namespace Lscl
{
  public class tServicesSettingGroups : Serializable
  {
    [Description(nick="SGEdit",blurb="The capability of online editing is decided with the SGEdit element")]
    public tGSEdit sg_edit { get; set; }

    [Description(nick="ConfSG",blurb="The capability to configure the (number of) setting groups by SCL can be also available")]
    public tConfSG conf_sg { get; set; }
  }
  public class tGSEdit : tServiceYesNo {}
  public class tConfSG : tServiceYesNo {}
}

