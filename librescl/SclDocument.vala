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

public class Lscl.SclDocument : Scl
{
  private string _file_name;
  private bool _backup;
  
  public string get_file_name () { return _file_name; }
  public void set_file_name (string file) { _file_name = file; }
  public bool get_backup () { return _backup; }
  public void set_backup (bool backup) { _backup = false; }
  /**
   * Signal for operation on a file.
   *
   * An operation in a File has stared and is in progress, for reading or writting.
   */
  public signal void file_operation_start (string path);
/**
   * Signal for operation on a file.
   *
   * An operation in a File has been ended, for reading or writting.
   */
  public signal void file_operation_end (string path);

  public SclDocument () {
    _file_name  = "generic.scd";
    _backup = false;
  }

  /**
   * Saves SCL Document to the current file using the given IEC 61850 Edition version.
   */
  public void save (int edition = 1) 
    throws GLib.Error
  {
    var document = new GXml.Document ();
    serialize (document);
    var file = File.new_for_path (_file_name);
    var outs = file.replace (null, true, FileCreateFlags.NONE, null);
    file_operation_start (_file_name);
    document.save_to_stream (outs);
    file_operation_end (_file_name);
  }

  /**
   * Saves SCL Document to the current file using the given IEC 61850 Edition version
   * and file path.
   */
  public void save_as (string file, int edition = 1) throws GLib.Error
  {
    _file_name = file;
    save (edition);
  }

  /**
   * Read an {@link Lscl.Scl} document from path in file.
   *
   */
  public void read (string file) throws GLib.Error
  {
    // FIXME: firts create a File to check path is valid
    _file_name = file;
    file_operation_start (_file_name);
    var document = new GXml.Document.from_path (_file_name);
    deserialize (document);
    file_operation_end (_file_name);
  }
  /**
   * Read SCL Document from given {@link GLib.File}.
   */
  public void read_from_file (File file) throws GLib.Error
  {
    if (file.get_path () != null) {
      _file_name = file.get_path ();
      file_operation_start (_file_name);
      var document = new GXml.Document.from_gfile (file);
      deserialize (document);
      file_operation_end (_file_name);
    }
  }

  /**
   * Read an {@link Lscl.Scl} document in a string
   */
  public void read_from_string (string str) throws GLib.Error
  {
    file_operation_start (_file_name);
    var document = new Document.from_string (str);
    deserialize (document);
    file_operation_end (_file_name);
  }
}
