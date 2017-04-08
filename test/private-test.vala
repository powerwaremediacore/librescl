/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*-  */
/* librescl
 *
 * Copyright (C) 2013. 2014 Daniel Espinosa <esodan@gmail.com>
 *
 * librescl is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * librescl is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along
 * with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
using Lscl;
using GXml;

public class LsclTest.PrivateTest
{
  public static void add_funcs ()
  {
    Test.add_func ("/librescl/private/enable",
    () => {
      try {
        string path = LsclTest.TEST_DIR + "/tests-files/scl-private.cid";
        var f = File.new_for_path (path);
        assert (f.query_exists ());
        var scl = new SclDocument ();
        scl.set_file (f);
        assert (scl.get_file () != null);
        assert (scl.get_file ().query_exists ());
        assert (scl.read ());
        assert (scl.privates != null);
        assert (scl.privates.deserialize_children ());
        assert (scl.privates.size == 1);
        assert (scl.privates[0] != null);
        assert (scl.privates[0].private_type == "lscl");
        assert (scl.privates[0].source == "http://www.librescl.org");
      }
      catch (GLib.Error e)
      {
        GLib.message (@"ERROR: $(e.message)");
        assert_not_reached ();
      }
    });
    Test.add_func ("/librescl/private/disable",
    () => {
      try {
        string path = LsclTest.TEST_DIR + "/tests-files/scl-private.cid";
        var f = File.new_for_path (path);
        assert (f.query_exists ());
        var scl = new SclDocument ();
        scl.set_enable_private (false);
        scl.set_file (f);
        assert (scl.get_file () != null);
        assert (scl.get_file ().query_exists ());
        assert (scl.read ());
        assert (scl.privates != null);
        assert (scl.privates.deserialize_children ());
        assert (scl.privates.size == 0);
      }
      catch (GLib.Error e)
      {
        GLib.message (@"ERROR: $(e.message)");
        assert_not_reached ();
      }
    });
    Test.add_func ("/librescl/private/from_file/disable",
    () => {
      try {
        string path = LsclTest.TEST_DIR + "/tests-files/ied.cid";
        var f = File.new_for_path (path);
        assert (f.query_exists ());
        var scl = new SclDocument ();
        scl.set_enable_private (false);
        scl.read_from_file (f);
        var d = new GomDocument.from_string (scl.write_string ());
        assert (scl.ieds != null);
        scl.ieds.deserialize_children ();
        var ied = scl.ieds.get ("IED1");
        assert (ied != null);
        assert (ied.privates != null);
        ied.privates.deserialize_children ();
        assert (ied.privates.size == 0);
        assert (ied.access_points != null);
        ied.access_points.deserialize_children ();
        assert (ied.access_points.size == 1);
      }
      catch (GLib.Error e)
      {
        GLib.message (@"ERROR: $(e.message)");
        assert_not_reached ();
      }
    });
  }
}
