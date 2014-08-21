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

using Gee;
using GXml;

namespace Lscl
{
  public class tEnumType : tIDNaming
  {
    [Description(nick="EnumVal",blurb="")]
    public tEnumVal.Array enum_val { get; set; }

    public void order ()
    {
      // TODO: Reorder using order
    }
    // Serializable
    public override void init_containers ()
    {
      if (enum_val == null)
        enum_val = new tEnumVal.Array ();
    }
    public class Array : SerializableArrayList<tEnumType> {}
  }
}
