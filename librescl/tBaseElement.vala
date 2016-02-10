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

using GXml;

namespace Lscl
{
  public class tBaseElement : Lscl.Serializable
  {
    private GXml.Node node;
    private tPrivateArray _privates = new tPrivateArray ();

    [Description(nick="Text", blurb="")]
    public tText text { get; set; }

    [Description(blurb="Logical Node Types templates")]
    public tPrivateArray privates {
        get {
            if (_privates.size == 0) {
                if (node == null) return _privates;
                _privates.clear ();
                _privates.deserialize (node);
            }
            return _privates;
        }
        set { _privates = value; }
    }
  }
}

