/**
 *
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <esodan@gmail.com>
 *
 *
 *  Copyright (c) 2013, 2014 Daniel Espinosa
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
  public class tServer : tUnNaming 
  {
    [Description(nick="Authentication", blurb="Defines the authentication possibilities or method(s) to be used.")]
    public tServerAuthentication authentication { get; set; }
    [Description(blurb="Logical Devices Configured")]
    public tLDevice.Collection logical_devices { get; set; }
    [Description(nick="Association", blurb="")]
    public tAssociation association { get; set; }
    [Description(nick="timeout", blurb="Time out in seconds.")]
    public uint timeout { get; set; default = 30; }

    public override void init_containers ()
    {
      if (logical_devices == null)
        logical_devices = new tLDevice.Collection ();
    }
  }
}