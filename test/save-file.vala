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

public class LsclTest.SaveFile
{
  public static void add_funcs ()
  {
    Test.add_func ("/librescl-test-suite/read/set-file", 
    () => {
      try {
        var scl = new SclDocument ();
        scl.communication = new tCommunication ();
        scl.header = new tHeader ();
        scl.ieds = new tIED.HashMap ();
        var ied = new tIED ();
        ied.name = "TEMPLATE";
        ied.access_points = new tAccessPoint.HashMap ();
        var ap = new tAccessPoint ();
        ap.name = "AP";
        ied.access_points.set (ap.name, ap);
        scl.ieds.set (ied.name, ied);
        var f = File.new_for_path (LsclTest.TEST_SAVE_DIR + "/saved1.cid");
        scl.save_to (f);
        assert (f.query_exists ());
        var scl2 = new SclDocument ();
        scl2.read_from_file (f);
        assert (scl2.communication != null);
        assert (scl2.header != null);
        assert (scl2.ieds != null);
        assert (scl2.ieds.size == 1);
        var i = scl2.ieds.get ("TEMPLATE");
        assert (i != null);
        assert (i.name == "TEMPLATE");
        assert (i.access_points != null);
        assert (i.access_points.size == 1);
        var a = i.access_points.get ("AP");
        assert (a != null);
        f.delete ();
      }
      catch (GLib.Error e)
      {
        stdout.printf (@"ERROR: $(e.message)");
        assert_not_reached ();
      }
    });
  }
}
