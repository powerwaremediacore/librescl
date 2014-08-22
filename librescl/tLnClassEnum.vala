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

namespace Lscl
{
  public enum tLNClassEnum
  {
    LPHD,
    LLN0,
    ANCR,ARCO,ATCC,AVCO,
    CILO, CSWI,CALH,CCGR,CPOW,
    GAPC,GGIO,GSAL,
    IHMI,IARC,ITCI,ITMI,
    MMXU,MDIF,MHAI,MHAN,MMTR,MMXN,MSQI,MSTA,
    PDIF,PDIS,PDIR,PDOP,PDUP,PFRC,PHAR,PHIZ,PIOC,PMRI,PMSS,POPF,PPAM,PSCH,PSDE,PTEF,PTOC,PTOF,PTOV,PTRC,PTTR,PTUC,PTUV,PUPF,PTUF,PVOC,PVPH,PZSU,
    RSYN,RDRE,RADR,RBDR,RDRS,RBRF,RDIR,RFLO,RPSB,RREC,
    SARC,SIMG,SIML,SPDC,
    TCTR,TVTR,
    XCBR,XSWI,
    YPTR,YEFN,YLTC,YPSH,
    ZAXN,ZBAT,ZBSH,ZCAB,ZCAP,ZCON,ZGEN,ZGIL,ZLIN,ZMOT,ZREA,ZRRC,ZSAR,ZTCF,ZTCR,
    CUSTOM;

    public string to_string ()
    {
      string ret = "CUSTOM";
      EnumClass enumc = (EnumClass) typeof (tLNClassEnum).class_ref ();
      for (int i = 0; i < enumc.values.length; i++)
      {
        if (((int)this) == enumc.values[i].value)
          ret = enumc.values[i].value_name;
      }
      return ret;
    }

    public static tLNClassEnum new_from_string (string t)
    {
      tLNClassEnum ret = tLNClassEnum.CUSTOM;
      EnumClass enumc = (EnumClass) typeof (tLNClassEnum).class_ref ();
      for (int i = 0; i < enumc.values.length; i++)
      {
        if (t == enumc.values[i].value_name)
          ret = (tLNClassEnum) enumc.values[i].value;
      }
      return ret;
    }
  }
}

