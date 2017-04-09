/* -*- Mode: vala; indent-tabs-mode: t; c-basic-offset: 2; tab-width: 2 -*- */
/**
 *
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <esodan@gmail.com>
 *
 *
 *  Copyright (c) 2013-2017 Daniel Espinosa
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

using Lscl;

namespace LsclTest
{
	class Suite : Object
	{
		public static const string GENERIC_CID = "template.cid";
		public static const string WRITE_TEST = "write_test.cid";
		static int main (string args[])
		{
			Test.init (ref args);
			SclTest.add_funcs ();
			ReadFile.add_funcs ();/*
			XmlGeneration.add_funcs ();
			SaveFile.add_funcs ();
			Performance.add_funcs ();
			Enums.add_funcs ();
			Collections.add_funcs ();
			PrivateTest.add_funcs ();*/
			return Test.run ();
		}
	}
}
