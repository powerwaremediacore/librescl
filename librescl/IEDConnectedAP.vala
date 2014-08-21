/**
 *  LibreSCL
 *
 *  Author:
 *       Daniel Espinosa <esodan@gmail.com>
 *
 *  Copyright (c) 2011 Daniel Espinosa
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

namespace Lscl
{
	public struct IEDConnectedAP
	{
		int i;
		int a;
		int s;
		int c;
		public IEDConnectedAP (int i, int a, int s, int c)
		{
			this.i = i;
			this.a = a;
			this.s = s;
			this.c = c;
		}
		public int ied {
			set { i = value; }
			get { return i;}
		}
		public int ap {
			set { a = value; }
			get { return a; }
		}
		public int subnetwork {
			set { s = value; }
			get { return s; }
		}
		public int connectedap {
			set { c = value;}
			get { return c; }
		}
	}
}

