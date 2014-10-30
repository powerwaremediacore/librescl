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
 * Abstract class to manage Reports configured in device.
 */
public abstract class Lscl.DeviceReport : Lscl.DeviceObjectRefence, DeviceObject {

  /**
   * Report's name.
   */
  public string name { get; set; }
  /**
   * Indicates if the report could be used by clients.
   */
  public bool enable { get; set; }
  /**
   * Indicates if the Report is Buffered or Unbuffered.
   */
  public bool buffered { get; set; }
  /**
   * Reports ID.
   */
  public string id { get; set; }
  /**
   * Reports configuration revision.
   */
  public string revision { get; set; }
  /**
   * A {@link DeviceDataSet} configurated in the device and used by this Report
   * to get data from.
   */
  public DeviceDataSet dataset { get; set; }

  // DeviceObject interface properties
  public DeviceConnection connection { get; construct set;}
  public string description { get; set; }
  
  public DeviceReport (DeviceConnection cnn) {
		connection = cnn;
	}

  // DeviceObject interface methods
  public abstract bool read ();
  public abstract bool save ();
  public abstract bool is_valid ();

}

