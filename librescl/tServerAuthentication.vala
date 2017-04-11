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

namespace Lscl
{
  public class tServerAuthentication : Serializable
  {
    [Description(nick="::none")]
    public SerializableBool none { get; set; }
    [Description(nick="::password")]
    public SerializableBool password { get; set; }
    [Description(nick="::weak")]
    public SerializableBool @weak { get; set; }
    [Description(nick="::strong")]
    public SerializableBool strong { get; set; }
    [Description(nick="::certificate")]
    public SerializableBool certificate { get; set; }

    construct {
      try { initialize ("Authentication"); }
      catch (GLib.Error e) { warning ("Error: "+e.message); }
    }
  }
}

