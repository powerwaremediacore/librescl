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
namespace Lscl {
  /**
   * Interface used to manage connection to Devices.
   * 
   * Implementators should allow to open and close the connection.
   * 
   * Configuration should be hold before to be sent to the Device, using {@link send}
   * method.
   */
  public interface DeviceConnection : Object {

    /**
     * Indicates if the connection is active, when {@link open} has been called.
     */
    public abstract bool active { get; set; }
    /**
     * IP address of the device connected to.
     */
    public abstract string ip { get; set; }
    /**
     * Device specific connection paramenters, used by manufacturer.
     * 
     * Contents and structure should be defined by manufacturer.ç
     */
    public abstract string @params { get; set; }
    /**
     * Manufacturer's name.
     */
    public abstract string manufacturer { get; }
    /**
     * Device's model.
     * 
     * Is expected to be set using connection paramenters.
     */
    public abstract string model { get; }
    /**
     * SCL configuration representation.
     * 
     * Manufacturer should export internal configuration using standard SCL representation.
     */
    public abstract Scl scl { get; set; }

    /**
     * Open a connection to a Device, using {@link ip} and {@link params} properties.
     */
    public abstract bool open ();
    /**
     * Closes a connection to a device.
     */
    public abstract bool close ();
    /**
     * Sends configuration changes to the device.
     */
    public abstract bool send ();

  }
}

