/**
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <daniel.espinosa@pwmc.mx>
 *
 *
 *  Copyright (c) 2015, 2017 Daniel Espinosa
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
using GXml;

public class Lscl.tLNClassEnum : GomArrayString
{
	public new Gee.List<string> get_values ()
	{
	  var pd = new tPredefinedLNClassEnum ();
		var l = new ArrayList<string> ();
		l.add_all (pd.get_values ());
		return l;
	}
}


public class Lscl.tPredefinedLNClassEnum : GomArrayString
{
	public new Gee.List<string> get_values ()
	{
		var phd = new tLPHDEnum ();
		var ln0 = new tLPHDEnum ();
		var domain = new tDomainLNEnum ();
		var l = new ArrayList<string> ();
		l.add_all (phd.get_values ());
		l.add_all (ln0.get_values ());
		l.add_all (domain.get_values ());
		return l;
	}
}
public class Lscl.tLPHDEnum : GomArrayString
{
	construct {
		_values = {"LPHD"};
	}
	public new Gee.List<string> get_values ()
	{
		var l = new ArrayList<string> ();
		l.add (_values[0]);
		return l;
	}
}

public class Lscl.tLLN0Enum : GomArrayString
{
	construct {
		_values = {"LLN0"};
	}
	public new Gee.List<string> get_values ()
	{
		var l = new ArrayList<string> ();
		l.add (_values[0]);
		return l;
	}
}

public class Lscl.tDomainLNEnum : GomArrayString
{
	construct { _values = {}; }
	public new Gee.List<string> get_values ()
	{
		var a = new tDomainLNGroupAEnum ();
		var c = new tDomainLNGroupCEnum ();
		var g = new tDomainLNGroupGEnum ();
		var i = new tDomainLNGroupIEnum ();
		var p = new tDomainLNGroupPEnum ();
		var r = new tDomainLNGroupREnum ();
		var s = new tDomainLNGroupSEnum ();
		var t = new tDomainLNGroupTEnum ();
		var x = new tDomainLNGroupXEnum ();
		var y = new tDomainLNGroupYEnum ();
		var z = new tDomainLNGroupZEnum ();
		var l = new ArrayList<string> ();
		l.add_all (a.get_values ());
		l.add_all (c.get_values ());
		l.add_all (g.get_values ());
		l.add_all (i.get_values ());
		l.add_all (p.get_values ());
		l.add_all (r.get_values ());
		l.add_all (s.get_values ());
		l.add_all (t.get_values ());
		l.add_all (x.get_values ());
		l.add_all (y.get_values ());
		l.add_all (z.get_values ());
		return l;
	}
}

public class Lscl.tDomainLNGroupAEnum : GomArrayString
{
	construct {
		_values = {"ANCR","ARCO","ATCC","AVCO"};
	}
	public new Gee.List<string> get_values ()
	{
		var l = new ArrayList<string> ();
		for (int i = 0; i < _values.length; i++) {
		  l.add (_values[i]);
		}
		return l;
	}
}

public class Lscl.tDomainLNGroupCEnum : GomArrayString
{
	construct {
		_values = {"CILO","CSWI","CALH","CCGR",
		"CPOW"};
	}
	public new Gee.List<string> get_values ()
	{
		var l = new ArrayList<string> ();
		for (int i = 0; i < _values.length; i++) {
		  l.add (_values[i]);
		}
		return l;
	}
}


public class Lscl.tDomainLNGroupGEnum : GomArrayString
{
	construct {
		_values = {"GAPC","GGIO","GSAL"};
	}
	public new Gee.List<string> get_values ()
	{
		var l = new ArrayList<string> ();
		for (int i = 0; i < _values.length; i++) {
		  l.add (_values[i]);
		}
		return l;
	}
}

public class Lscl.tDomainLNGroupIEnum : GomArrayString
{
	construct {
		_values = {"IHMI","IARC","ITCI","ITMI"};
	}
	public new Gee.List<string> get_values ()
	{
		var l = new ArrayList<string> ();
		for (int i = 0; i < _values.length; i++) {
		  l.add (_values[i]);
		}
		return l;
	}
}

public class Lscl.tDomainLNGroupMEnum : GomArrayString
{
	construct {
		_values = {"MMXU","MDIF",
		"MHAI","MHAN","MMTR","MMXN","MSQI","MSTA"};
	}
	public new Gee.List<string> get_values ()
	{
		var l = new ArrayList<string> ();
		for (int i = 0; i < _values.length; i++) {
		  l.add (_values[i]);
		}
		return l;
	}
}


public class Lscl.tDomainLNGroupPEnum : GomArrayString
{
	construct {
		_values = {"PDIF","PDIS","PDIR","PDOP",
		"PDUP","PFRC","PHAR","PHIZ","PIOC","PMRI","PMSS","POPF","PPAM","PSCH",
		"PSDE","PTEF","PTOC","PTOF","PTOV","PTRC","PTTR","PTUC","PTUV","PUPF",
		"PTUF","PVOC","PVPH","PZSU"};
	}
	public new Gee.List<string> get_values ()
	{
		var l = new ArrayList<string> ();
		for (int i = 0; i < _values.length; i++) {
		  l.add (_values[i]);
		}
		return l;
	}
}

public class Lscl.tDomainLNGroupREnum : GomArrayString
{
	construct {
		_values = {"RSYN","RDRE","RADR","RBDR","RDRS","RBRF",
		"RDIR","RFLO","RPSB","RREC"};
	}
	public new Gee.List<string> get_values ()
	{
		var l = new ArrayList<string> ();
		for (int i = 0; i < _values.length; i++) {
		  l.add (_values[i]);
		}
		return l;
	}
}


public class Lscl.tDomainLNGroupSEnum : GomArrayString
{
	construct {
		_values = {"SARC","SIMG","SIML","SPDC"};
	}
	public new Gee.List<string> get_values ()
	{
		var l = new ArrayList<string> ();
		for (int i = 0; i < _values.length; i++) {
		  l.add (_values[i]);
		}
		return l;
	}
}

public class Lscl.tDomainLNGroupTEnum : GomArrayString
{
	construct {
		_values = {"TCTR","TVTR"};
	}
	public new Gee.List<string> get_values ()
	{
		var l = new ArrayList<string> ();
		for (int i = 0; i < _values.length; i++) {
		  l.add (_values[i]);
		}
		return l;
	}
}


public class Lscl.tDomainLNGroupXEnum : GomArrayString
{
	construct {
		_values = {"XCBR","XSWI"};
	}
	public new Gee.List<string> get_values ()
	{
		var l = new ArrayList<string> ();
		for (int i = 0; i < _values.length; i++) {
		  l.add (_values[i]);
		}
		return l;
	}
}

public class Lscl.tDomainLNGroupYEnum : GomArrayString
{
	construct {
		_values = {"YPTR","YEFN","YLTC","YPSH"};
	}
	public new Gee.List<string> get_values ()
	{
		var l = new ArrayList<string> ();
		for (int i = 0; i < _values.length; i++) {
		  l.add (_values[i]);
		}
		return l;
	}
}

public class Lscl.tDomainLNGroupZEnum : GomArrayString
{
	construct {
		_values = {"ZAXN","ZBAT","ZBSH","ZCAB",
		"ZCAP","ZCON","ZGEN","ZGIL","ZLIN","ZMOT","ZREA","ZRRC","ZSAR",
		"ZTCF","ZTCR"};
	}
	public new Gee.List<string> get_values ()
	{
		var l = new ArrayList<string> ();
		for (int i = 0; i < _values.length; i++) {
		  l.add (_values[i]);
		}
		return l;
	}
}



