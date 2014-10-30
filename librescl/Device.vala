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
using Gee;

/**
 * Main interface to be implemented by Manufacturer's Plugins.
 * 
 * This object should manage connection to a device and use it to read and send
 * configurations to it.
 * 
 * Object should hold references to its {@link DeviceDataSet}, {@link DeviceGoose},
 * {@link DeviceGoExtRef} and {@link DeviceReport}, objects.
 */
public interface Lscl.Device : Object, Lscl.DeviceObject {

  /**
   * List of GOOSE messages configured in the device.
   * 
   * This is a read only list, you should use {@link create_goose} and
   * {@link remove_goose} to manage its contents.
   * 
   * See {@link DeviceGoose} for more information.
   */
  public abstract BidirList<DeviceGoose> gooses { owned get; }
  /**
   * List of Reports configured in the device.
   * 
   * This is a read only list, you should use {@link create_report} and
   * {@link remove_report} to manage its contents.
   * 
   * See {@link DeviceReport} for more information.
   */
  public abstract BidirList<DeviceReport> reports { owned get; }
  /**
   * List of DataSet configured in the device.
   * 
   * This is a read only list, you should use {@link create_dataset} and
   * {@link remove_dataseet} to manage its contents.
   * 
   * See {@link DeviceDataSet} for more information.
   */
  public abstract BidirList<DeviceDataSet> datasets { owned get; }
  /**
   * List of GOOSE external references to internal variables, configured in the device.
   * 
   * This is a read only list, you should use {@link create_goexref} and
   * {@link remove_goextref} to manage its contents.
   * 
   * See {@link DeviceGoExtRef} for more information.
   */
  public abstract BidirList<DeviceGoExtRef> goextrefs { owned get; }


  /**
   * Creates a new unconfigure GOOSE message representation in the device configuration.
   * 
   * Returned object could have intialized information, depends on the Manufacturer
   * implementation. Farder setup is expected, to configure a valid GOOSE message in
   * the device.
   * 
   * For devices with fixed GOOSE message, this method could return next unconfigured
   * GOOSE message available in the device.
   * 
   * See {@link DeviceGoose} for more information.
   */
  public abstract unowned DeviceGoose create_goose ();
  /**
   * Creates a new unconfigured DataSet representation in the device configuration.
   * 
   * Returned object could have intialized information, depends on the Manufacturer
   * implementation. Farder setup is expected, to configure a valid DataSet in
   * the device.
   * 
   * See {@link DeviceDataSet} for more information.
   */
  public abstract unowned DeviceDataSet create_dataset ();
  /**
   * Creates a new unconfigured Report representation in the device configuration.
   * 
   * Returned object could have intialized information, depends on the Manufacturer
   * implementation. Farder setup is expected, to configure a valid Report in
   * the device.
   * 
   * For devices with fixed Reports, this method could return next unconfigured
   * GOOSE message available in the device.
   * 
   * See {@link DeviceReport} for more information.
   */
  public abstract unowned DeviceReport create_report ();
  /**
   * Creates a new unconfigured GOOSE external reference representation in the
   * device configuration.
   * 
   * Returned object could have intialized information, depends on the Manufacturer
   * implementation. Farder setup is expected, to configure a valid {@link DeviceGoExtRef} in
   * the device.
   * 
   * For devices with fixed GOOSE external references, this method could return
   * next unconfigured GOOSE external reference available in the device.
   * 
   * See {@link DeviceReport} for more information.
   */
  public abstract unowned DeviceGoExtRef create_goexref ();
  /**
   * Removes a configured GOOSE messagein the
   * device configuration.
   * 
   * For devices with fixed GOOSE messages, this method should desable
   * a given {@link DeviceGoose} and set it as avaiable when {@link create_goose}
   * is called.
   * 
   * Returns: true on success.
   */
  public abstract bool remove_goose (DeviceGoose goose);
  /**
   * Removes a configured DataSet in the
   * device configuration.
   * 
   * For devices with fixed DataSet, this method should desable
   * a given {@link DeviceDataSet} and set it as avaiable when {@link create_dataset}
   * is called.
   * 
   * Returns: true on success.
   */
  public abstract bool remove_dataset (DeviceDataSet dataset);
  /**
   * Removes a configured Report in the
   * device configuration.
   * 
   * For devices with fixed Reports, this method should disable
   * a given {@link DeviceReport} and set it as avaiable when {@link create_report}
   * is called.
   * 
   * Returns: true on success.
   */
  public abstract bool remove_report (DeviceReport report);
  /**
   * Removes a configured GOOSE external reference in the
   * device configuration.
   * 
   * For devices with fixed GOOSE external references, this method should disable
   * a given {@link DeviceGoExtRef} and set it as avaiable when {@link create_goexref}
   * is called.
   * 
   * Returns: true on success.
   */
  public abstract bool remove_goexref (DeviceGoExtRef goextref);

}

