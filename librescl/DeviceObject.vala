/**
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <esodan@gmail.com>
 *
 *
 *  Copyright (c) 2014 Daniel Espinosa
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
/**
 * Base interface for most Device classes, for basic functionality.
 */
public interface Lscl.DeviceObject : Object {

  /**
   * Holds a connection reference to a device.
   * 
   * This property should be set on construction by {@link Device} object and should
   * be read only.
   * 
   * Should be used by implentor when {@link is_valid} is called.
   */
  public abstract DeviceConnection connection { get; construct set; }
  /**
   * Holds a description of the object.
   * 
   * This property could be set on construction and read only, depends on
   * Manufacturer implementation.
   */
  public abstract string description { get; set; }

  /**
   * Read configuration information to set up this object.
   */
  public abstract bool read ();
  /**
   * Saves configuration information as changes to be sent by {@link DeviceConnection}
   * object to the device.
   */
  public abstract bool save ();
  /**
   * Verify if the information in the object is valid, for a given device connection.
   */
  public abstract bool is_valid ();

}

