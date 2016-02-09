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
using GXml;
using Lscl;

public class Performance
{
  public static void add_funcs ()
  {
    Test.add_func ("/librescl-test-suite/performance/read", 
    () => {
      try {
        double time;
        Test.timer_start ();
        Test.message ("Initalizing Document");
        var scl = new SclDocument ();
        scl.read_from_path (LsclTest.TEST_DIR + "/tests-files/generic.cid");
        Test.message ("Finished to read Document...");
        time = Test.timer_elapsed ();
        Test.minimized_result (time, "Read generic.cid: %g seconds", time);
        Test.timer_start ();
        Test.message ("SCL: "+scl.to_string ());
        time = Test.timer_elapsed ();
        Test.minimized_result (time, "Access to SCL: %g seconds", time);
      }
      catch (GLib.Error e) {
        Test.message (e.message);
        assert_not_reached ();
      }
    });
    Test.add_func ("/librescl-test-suite/performance/treemap", 
    () => {
      var lns = new tLN.ThreeMap ();
      double time;
      Test.timer_start ();
      for (int i = 0; i < 5; i++) {
        var ln = new tLN ();
        ln.prefix = "";
        ln.ln_class.set_string ("GGIO");
        ln.inst = i.to_string ();
        lns.set (ln.ln_class.get_string (), ln.inst, ln.prefix, ln);
      }
      foreach (tLN ln in lns.values ()) {
        Test.message (ln.to_string ());
      }
      time = Test.timer_elapsed ();
      Test.minimized_result (time, "Inserting/iterating 5 Elements: %g seconds", time);
      Test.timer_start ();
      for (int j = 5; j < 25; j++) {
        var ln = new tLN ();
        ln.prefix = "";
        ln.ln_class.set_string ("GGIO");
        ln.inst = j.to_string ();
        lns.set (ln.ln_class.get_string (), ln.inst, ln.prefix, ln);
      }
      foreach (tLN ln in lns.values ()) {
        Test.message (ln.to_string ());
      }
      time = Test.timer_elapsed ();
      Test.minimized_result (time, "Inserting/iterating 25 Elements: %g seconds", time);
      Test.timer_start ();
      for (int k = 25; k < 55; k++) {
        var ln = new tLN ();
        ln.prefix = "";
        ln.ln_class.set_string ("GGIO");
        ln.inst = k.to_string ();
        lns.set (ln.ln_class.get_string (), ln.inst, ln.prefix, ln);
      }
      foreach (tLN ln in lns.values ()) {
        Test.message (ln.to_string ());
      }
      time = Test.timer_elapsed ();
      Test.minimized_result (time, "Inserting/iterating 55 Elements: %g seconds", time);
    });
  }
}
