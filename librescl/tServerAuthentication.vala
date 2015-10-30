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
  public class tServerAuthentication : SerializableObjectModel
  {
    [Description(nick="none", blurb="No authentication.")]
    public SerializableBool none { get; set; }
    [Description(nick="password", blurb="Key for authentication.")]
    public SerializableBool password { get; set; }
    [Description(nick="weak", blurb="A weak password for authentication.")]
    public SerializableBool @weak { get; set; }
    [Description(nick="strong", blurb="A strong password for authentication.")]
    public SerializableBool strong { get; set; }
    [Description(nick="certificate", blurb="A certificate for authentication.")]
    public SerializableBool certificate { get; set; }

    public override string node_name () { return "Authentication"; }
    public override string to_string () { return node_name (); }
  }
}

