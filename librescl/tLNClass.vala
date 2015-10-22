/**
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <daniel.espinosa@pwmc.mx>
 *
 *
 *  Copyright (c) 2015 Daniel Espinosa
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

public class Lscl.tLNClassEnum : Lscl.BaseValueList
{
	public override Gee.List<string> get_values ()
	{
	  var pd = new tPredefinedLNClassEnum ();
		var l = new ArrayList<string> ();
		l.add_all (pd.get_values ());
		return l;
	}
}


public class Lscl.tPredefinedLNClassEnum : Lscl.BaseValueList
{
	public override Gee.List<string> get_values ()
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
public class Lscl.tLPHDEnum : Lscl.BaseValueList
{
	construct {
		_vals = {"LPHD"};
	}
	public override Gee.List<string> get_values ()
	{
		var l = new ArrayList<string> ();
		l.add (_vals[0]);
		return l;
	}
}

public class Lscl.tLLN0Enum : Lscl.BaseValueList
{
	construct {
		_vals = {"LLN0"};
	}
	public override Gee.List<string> get_values ()
	{
		var l = new ArrayList<string> ();
		l.add (_vals[0]);
		return l;
	}
}

public class Lscl.tDomainLNEnum : Lscl.BaseValueList
{
	construct { _vals = {}; }
	public override Gee.List<string> get_values ()
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
		if (extra != null) l.add_all (extra);
		return l;
	}
}

public class Lscl.tDomainLNGroupAEnum : Lscl.BaseValueList
{
	construct {
		_vals = {"ANCR","ARCO","ATCC","AVCO"};
	}
}

public class Lscl.tDomainLNGroupCEnum : Lscl.BaseValueList
{
	construct {
		_vals = {"CILO","CSWI","CALH","CCGR",
		"CPOW"};
	}
}


public class Lscl.tDomainLNGroupGEnum : Lscl.BaseValueList
{
	construct {
		_vals = {"GAPC","GGIO","GSAL"};
	}
}

public class Lscl.tDomainLNGroupIEnum : Lscl.BaseValueList
{
	construct {
		_vals = {"IHMI","IARC","ITCI","ITMI"};
	}
}

public class Lscl.tDomainLNGroupMEnum : Lscl.BaseValueList
{
	construct {
		_vals = {"MMXU","MDIF",
		"MHAI","MHAN","MMTR","MMXN","MSQI","MSTA"};
	}
}


public class Lscl.tDomainLNGroupPEnum : Lscl.BaseValueList
{
	construct {
		_vals = {"PDIF","PDIS","PDIR","PDOP",
		"PDUP","PFRC","PHAR","PHIZ","PIOC","PMRI","PMSS","POPF","PPAM","PSCH",
		"PSDE","PTEF","PTOC","PTOF","PTOV","PTRC","PTTR","PTUC","PTUV","PUPF",
		"PTUF","PVOC","PVPH","PZSU"};
	}
}

public class Lscl.tDomainLNGroupREnum : Lscl.BaseValueList
{
	construct {
		_vals = {"RSYN","RDRE","RADR","RBDR","RDRS","RBRF",
		"RDIR","RFLO","RPSB","RREC"};
	}
}


public class Lscl.tDomainLNGroupSEnum : Lscl.BaseValueList
{
	construct {
		_vals = {"SARC","SIMG","SIML","SPDC"};
	}
}

public class Lscl.tDomainLNGroupTEnum : Lscl.BaseValueList
{
	construct {
		_vals = {"TCTR","TVTR"};
	}
}


public class Lscl.tDomainLNGroupXEnum : Lscl.BaseValueList
{
	construct {
		_vals = {"XCBR","XSWI"};
	}
}

public class Lscl.tDomainLNGroupYEnum : Lscl.BaseValueList
{
	construct {
		_vals = {"YPTR","YEFN","YLTC","YPSH"};
	}
}

public class Lscl.tDomainLNGroupZEnum : Lscl.BaseValueList
{
	construct {
		_vals = {"ZAXN","ZBAT","ZBSH","ZCAB",
		"ZCAP","ZCON","ZGEN","ZGIL","ZLIN","ZMOT","ZREA","ZRRC","ZSAR",
		"ZTCF","ZTCR"};
	}
}



