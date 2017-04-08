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
 *  Copyright (c) 2014, 2017 Daniel Espinosa
 *  Copyright (c) 2014 PowerMedia Consultinga
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
  public class tReportControlOptFields : Serializable
  {
    [Description(nick="seqNum", blurb="Current sequence number of the reports")]
    public SerializableBool seq_num { get; set; }
    [Description(nick="timeStamp", blurb="Represent a UTC time with the epoch of midnight (00:00:00) of 1970-01-01")]
    public SerializableBool time_stamp { get; set; }
    [Description(nick="dataSet", blurb="Identifies a DATA-SET that is contained in the LN")]
    public SerializableBool data_set { get; set; }
    [Description(nick="reasonCode", blurb="Reason for inclusion in the report")]
    public SerializableBool reason_code { get; set; }
    [Description(nick="dataRef", blurb="Data Object Reference")]
    public SerializableBool data_ref { get; set; }
    [Description(nick="entryID", blurb="Used to identify an entry in a sequence of events such as a log or a buffered report")]
    public SerializableBool entry_id { get; set; }
    [Description(nick="configRef", blurb="Configuration reference")]
    public SerializableBool config_ref { get; set; }
    /*Edition 2.0 */
    [Description(nick="bufOvfl", blurb="Configuration reference")]
    public SerializableBool buf_ovfl { get; set; }


    construct {
      try { initialize ("OptFields"); }
      catch (GLib.Error e ) {
        warning ("Error: "+e.message);
      }
      _property_edition.set ("buf-ovfl", Edition.SECOND);
    }
  }
}

