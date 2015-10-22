/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*- */
/* SerializableValueList.vala
 *
 * Copyright (C) 2015  Daniel Espinosa <esodan@gmail.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Authors:
 *      Daniel Espinosa <esodan@gmail.com>
*/
using GXml;

public class Lscl.tAttributeName : tPredefinedAttributeName {}
public class Lscl.tPredefinedAttributeName : Lscl.BaseValueList
{
	construct {
		_vals = {"T", "Test", "Check", "SIUnit", "Oper", "SBO", "SBOw", "Cancel", "ctlVal",
 "operTm", "origin", "ctlNum", "stVal", "q", "t", "stSeld", "subEna", "subVal",
 "subQ", "subID", "ctlModel","sboTimeout","sboClass","minVal", "maxVal",
 "stepSize","d","dU","cdcNs","cdcName","dataNs"};
	}
  public void select (Enum v) { set_string (_vals[v]); }
	public enum Enum
	{
		T,
		TEST,
		CHECK,
		SIUNIT,
		OPER,
		SBO,
		SBOW,
		CANCEL,
    CTL_VAL,
    OPER_TM,
    ORIGIN,
    CTL_NUM,
    ST_VAL,Q,TIME,ST_SELD,SUB_ENA,SUB_VAL, SUB_Q,SUB_ID,CTL_MODEL,
    SBO_TIMEOUT, SBO_CLASS, MIN_VAL, MAX_VAL, STEP_SIZE,D,DU,
    CDC_NS,CDC_NAME,DATA_NS
	}
}
