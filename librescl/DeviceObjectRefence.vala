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
 * Base class for objects holding information to know a data location in a SCL
 * configuration.
 */
public class  Lscl.DeviceObjectRefence : Object {

  /**
   * IED's name in the system.
   * 
   * This name should be valid in the system to refer valid data objects.
   */
  public string ied { get; set; }
  /**
   * IED's Access Point. Name to identify the interface used to connect the referenced
   * device to the network.
   */
  public string ap { get; set; }
  /**
   * Logical Device instance name in the given {@link ied}, holding refered data object.
   */
  public string ld_inst { get; set; }
  /**
   * Logical Lode's class in the given {@link ld_inst}, holding refered data object.
   */
  public string ln_class { get; set; }
  /**
   * Logical Lode's prefix in the given {@link ld_inst}, holding refered data object.
   */
  public string ln_prefix { get; set; }
  /**
   * Logical Lode's instance in the given {@link ld_inst}, holding refered data object.
   */
  public string ln_inst { get; set; }

}

