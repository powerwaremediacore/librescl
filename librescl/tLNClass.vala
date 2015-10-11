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
public class Lscl.tLNClassEnum : Lscl.BaseValueList
{
	public tLNClassEnum (string name)
	{
	  base (name);
	  var pd = new tPredefinedLNClassEnum ("pd");
	  add_values (pd.get_values ());
	}
}


public class Lscl.tPredefinedLNClassEnum : Lscl.BaseValueList
{
	public tPredefinedLNClassEnum (string name)
	{
		base (name);
		var phd = new tLPHDEnum ("lphd");
		add_values (phd.get_values ());
		var ln0 = new tLPHDEnum ("ln0");
		add_values (ln0.get_values ());
		var domain = new tDomainLNEnum ("domain");
		add_values (domain.get_values ());
	}
}
public class Lscl.tLPHDEnum : Lscl.BaseValueList
{
	public tLPHDEnum (string name)
	{
		base (name);
		add_values ({"LPHD"});
	}
}

public class Lscl.tLLN0Enum : Lscl.BaseValueList
{
	public tLLN0Enum (string name)
	{
		base (name);
		add_values ({"LLN0"});
	}
}

public class Lscl.tDomainLNEnum : Lscl.BaseValueList
{
	public tDomainLNEnum (string name)
	{
		base (name);
		var a = new tDomainLNGroupAEnum ("a");
		add_values (a.get_values ());
		var c = new tDomainLNGroupCEnum ("c");
		add_values (c.get_values ());
		var g = new tDomainLNGroupGEnum ("g");
		add_values (g.get_values ());
		var i = new tDomainLNGroupIEnum ("i");
		add_values (i.get_values ());
		var p = new tDomainLNGroupPEnum ("p");
		add_values (p.get_values ());
		var r = new tDomainLNGroupREnum ("r");
		add_values (r.get_values ());
		var s = new tDomainLNGroupSEnum ("s");
		add_values (s.get_values ());
		var t = new tDomainLNGroupTEnum ("t");
		add_values (t.get_values ());
		var x = new tDomainLNGroupXEnum ("x");
		add_values (x.get_values ());
		var y = new tDomainLNGroupYEnum ("y");
		add_values (y.get_values ());
		var z = new tDomainLNGroupZEnum ("z");
		add_values (z.get_values ());
	}
}

public class Lscl.tDomainLNGroupAEnum : Lscl.BaseValueList
{
	public tDomainLNGroupAEnum (string name)
	{
		base (name);
		add_values ({"ANCR","ARCO","ATCC","AVCO"});
	}
}

public class Lscl.tDomainLNGroupCEnum : Lscl.BaseValueList
{
	public tDomainLNGroupCEnum (string name)
	{
		base (name);
		add_values ({"CILO","CSWI","CALH","CCGR",
		"CPOW"});
	}
}


public class Lscl.tDomainLNGroupGEnum : Lscl.BaseValueList
{
	public tDomainLNGroupGEnum (string name)
	{
		base (name);
		add_values ({"GAPC","GGIO","GSAL"});
	}
}

public class Lscl.tDomainLNGroupIEnum : Lscl.BaseValueList
{
	public tDomainLNGroupIEnum (string name)
	{
		base (name);
		add_values ({"IHMI","IARC","ITCI","ITMI"});
	}
}

public class Lscl.tDomainLNGroupMEnum : Lscl.BaseValueList
{
	public tDomainLNGroupMEnum (string name)
	{
		base (name);
		add_values ({"MMXU","MDIF",
		"MHAI","MHAN","MMTR","MMXN","MSQI","MSTA"});
	}
}


public class Lscl.tDomainLNGroupPEnum : Lscl.BaseValueList
{
	public tDomainLNGroupPEnum (string name)
	{
		base (name);
		add_values ({"PDIF","PDIS","PDIR","PDOP",
		"PDUP","PFRC","PHAR","PHIZ","PIOC","PMRI","PMSS","POPF","PPAM","PSCH",
		"PSDE","PTEF","PTOC","PTOF","PTOV","PTRC","PTTR","PTUC","PTUV","PUPF",
		"PTUF","PVOC","PVPH","PZSU"});
	}
}

public class Lscl.tDomainLNGroupREnum : Lscl.BaseValueList
{
	public tDomainLNGroupREnum (string name)
	{
		base (name);
		add_values ({"RSYN","RDRE","RADR","RBDR","RDRS","RBRF",
		"RDIR","RFLO","RPSB","RREC"});
	}
}


public class Lscl.tDomainLNGroupSEnum : Lscl.BaseValueList
{
	public tDomainLNGroupSEnum (string name)
	{
		base (name);
		add_values ({"SARC","SIMG","SIML","SPDC"});
	}
}

public class Lscl.tDomainLNGroupTEnum : Lscl.BaseValueList
{
	public tDomainLNGroupTEnum (string name)
	{
		base (name);
		add_values ({"TCTR","TVTR"});
	}
}


public class Lscl.tDomainLNGroupXEnum : Lscl.BaseValueList
{
	public tDomainLNGroupXEnum (string name)
	{
		base (name);
		add_values ({"XCBR","XSWI"});
	}
}

public class Lscl.tDomainLNGroupYEnum : Lscl.BaseValueList
{
	public tDomainLNGroupYEnum (string name)
	{
		base (name);
		add_values ({"YPTR","YEFN","YLTC","YPSH"});
	}
}

public class Lscl.tDomainLNGroupZEnum : Lscl.BaseValueList
{
	public tDomainLNGroupZEnum (string name)
	{
		base (name);
		add_values ({"ZAXN","ZBAT","ZBSH","ZCAB",
		"ZCAP","ZCON","ZGEN","ZGIL","ZLIN","ZMOT","ZREA","ZRRC","ZSAR",
		"ZTCF","ZTCR"});
	}
}



