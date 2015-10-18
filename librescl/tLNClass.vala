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
	public tLNClassEnum (string name)
	{
	  base (name);
	}
	public override Gee.List<string> get_values ()
	{
	  var pd = new tPredefinedLNClassEnum ("pd");
		var l = new ArrayList<string> ();
		l.add_all (pd.get_values ());
		return l;
	}
}


public class Lscl.tPredefinedLNClassEnum : Lscl.BaseValueList
{
	public tPredefinedLNClassEnum (string name)
	{
		base (name);
	}
	public override Gee.List<string> get_values ()
	{
		var phd = new tLPHDEnum ("lphd");
		var ln0 = new tLPHDEnum ("ln0");
		var domain = new tDomainLNEnum ("domain");
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
	public tLPHDEnum (string name)
	{
		base (name);
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
	public tLLN0Enum (string name)
	{
		base (name);
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
	public tDomainLNEnum (string name)
	{
		base (name);
	}
	public override Gee.List<string> get_values ()
	{
		var a = new tDomainLNGroupAEnum ("a");
		var c = new tDomainLNGroupCEnum ("c");
		var g = new tDomainLNGroupGEnum ("g");
		var i = new tDomainLNGroupIEnum ("i");
		var p = new tDomainLNGroupPEnum ("p");
		var r = new tDomainLNGroupREnum ("r");
		var s = new tDomainLNGroupSEnum ("s");
		var t = new tDomainLNGroupTEnum ("t");
		var x = new tDomainLNGroupXEnum ("x");
		var y = new tDomainLNGroupYEnum ("y");
		var z = new tDomainLNGroupZEnum ("z");
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
	public tDomainLNGroupAEnum (string name)
	{
		base (name);
	}
}

public class Lscl.tDomainLNGroupCEnum : Lscl.BaseValueList
{
	construct {
		_vals = {"CILO","CSWI","CALH","CCGR",
		"CPOW"};
	}
	public tDomainLNGroupCEnum (string name)
	{
		base (name);
	}
}


public class Lscl.tDomainLNGroupGEnum : Lscl.BaseValueList
{
	construct {
		_vals = {"GAPC","GGIO","GSAL"};
	}
	public tDomainLNGroupGEnum (string name)
	{
		base (name);
	}
}

public class Lscl.tDomainLNGroupIEnum : Lscl.BaseValueList
{
	construct {
		_vals = {"IHMI","IARC","ITCI","ITMI"};
	}
	public tDomainLNGroupIEnum (string name)
	{
		base (name);
	}
}

public class Lscl.tDomainLNGroupMEnum : Lscl.BaseValueList
{
	construct {
		_vals = {"MMXU","MDIF",
		"MHAI","MHAN","MMTR","MMXN","MSQI","MSTA"};
	}
	public tDomainLNGroupMEnum (string name)
	{
		base (name);
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
	public tDomainLNGroupPEnum (string name)
	{
		base (name);
	}
}

public class Lscl.tDomainLNGroupREnum : Lscl.BaseValueList
{
	construct {
		_vals = {"RSYN","RDRE","RADR","RBDR","RDRS","RBRF",
		"RDIR","RFLO","RPSB","RREC"};
	}
	public tDomainLNGroupREnum (string name)
	{
		base (name);
	}
}


public class Lscl.tDomainLNGroupSEnum : Lscl.BaseValueList
{
	construct {
		_vals = {"SARC","SIMG","SIML","SPDC"};
	}
	public tDomainLNGroupSEnum (string name)
	{
		base (name);
	}
}

public class Lscl.tDomainLNGroupTEnum : Lscl.BaseValueList
{
	construct {
		_vals = {"TCTR","TVTR"};
	}
	public tDomainLNGroupTEnum (string name)
	{
		base (name);
	}
}


public class Lscl.tDomainLNGroupXEnum : Lscl.BaseValueList
{
	construct {
		_vals = {"XCBR","XSWI"};
	}
	public tDomainLNGroupXEnum (string name)
	{
		base (name);
	}
}

public class Lscl.tDomainLNGroupYEnum : Lscl.BaseValueList
{
	construct {
		_vals = {"YPTR","YEFN","YLTC","YPSH"};
	}
	public tDomainLNGroupYEnum (string name)
	{
		base (name);
	}
}

public class Lscl.tDomainLNGroupZEnum : Lscl.BaseValueList
{
	construct {
		_vals = {"ZAXN","ZBAT","ZBSH","ZCAB",
		"ZCAP","ZCON","ZGEN","ZGIL","ZLIN","ZMOT","ZREA","ZRRC","ZSAR",
		"ZTCF","ZTCR"};
	}
	public tDomainLNGroupZEnum (string name)
	{
		base (name);
	}
}



