/**
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <esodan@gmail.com>
 *       PowerMedia Consulting <pwmediaconsulting@gmail.com>
 *
 *
 *  Copyright (c) 2013, 2014 Daniel Espinosa
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
  public enum tStatusEnum
  {
		Valid,
		Invalid,
		Unknown
	}

  public enum tFCEnum
	{
		ST,
		MX,
		CO,
		SP,
		SG,
		SE,
		SV,
		CF,
		DC,
		EX
	}

	public enum tAssociationKindEnum 
	{
		preestablished,
		predefined,
	}

  public enum tSIUnitEnum
	{
		none = 1,
		m = 2,
		kg = 3,
		s = 4,
		A = 5,
		K = 6,
		mol = 7,
		cd = 8,
		deg = 9,
		rad = 10,
		sr = 11,
		Gy = 21,
		q = 22,
		C = 23,
		Sv = 24,
		F = 25,
		C1 = 26,
		S = 27,
		H = 28,
		V = 29,
		ohm = 30,
		J = 31,
		N = 32,
		Hz = 33,
		lx = 34,
		Lm = 35,
		Wb = 36,
		T = 37,
		W = 38,
		Pa = 39,
		m2 = 41,
		m3 = 42,
		ms = 43,
		ms2 = 44,
		m3s = 45,
		mm3 = 46,
		M = 47,
		kgm3 = 48,
		m2s = 49,
		WmK = 50,
		JK = 51,
		ppm = 52,
		s1 = 53,
		rads = 54,
		VA = 61,
		Watts = 62,
		VAr = 63,
		phi = 64,
		cos_phi = 65,
		Vs = 66,
		V2 = 67,
		As = 68,
		A2 = 69,
		A2s = 70,
		VAh = 71,
		Wh = 72,
		VArh = 73,
		VHz = 74,
		bs = 75
	}

	public enum tUnitMultiplierEnum
	{
		Item = 0,
		m = -3,
		k = 3,
		M = 6,
		mu = -6,
		y = -24,
		z = -21,
		a = -18,
		f = -15,
		p = -12,
		n = -9,
		c = -2,
		d = -1,
		da = 1,
		h = 2,
		G = 9,
		T = 12,
		P = 15,
		E = 18,
		Z = 21,
		Y = 24
	}

  public enum tGSEControlTypeEnum 
	{		
		GSSE,
		GOOSE,
	}

	public enum tLPHDEnum
	{
		LPHD
	}

	public enum tLLN0Enum
	{
		LLN0
	}

	public enum tDomainLNGroupAEnum
	{
		ANCR,
		ARCO,
		ATCC,
		AVCO
	}

	public enum tDomainLNGroupCEnum 
	{
		CILO,
		CSWI,
		CALH,
		CCGR,
		CPOW
	}

	public enum tDomainLNGroupGEnum 
	{
		GAPC,
		GGIO,
		GSAL
	}

	public enum tDomainLNGroupIEnum
	{
		IHMI,
		IARC,
		ITCI,
		ITMI
	}

	public enum tDomainLNGroupMEnum 
	{
		MMXU,
		MDIF,
		MHAI,
		MHAN,
		MMTR,
		MMXN,
		MSQI,
		MSTA
	}
	
	public enum tDomainLNGroupPEnum 
	{
		PDIF,
		PDIS,
		PDIR,
		PDOP,
		PDUP,
		PFRC,
		PHAR,
		PHIZ,
		PIOC,
		PMRI,
		PMSS,
		POPF,
		PPAM,
		PSCH,
		PSDE,
		PTEF,
		PTOC,
		PTOF,
		PTOV,
		PTRC,
		PTTR,
		PTUC,
		PTUV,
		PUPF,
		PTUF,
		PVOC,
		PVPH,
		PZSU
	}

	public enum tDomainLNGroupREnum 
	{
		RSYN,
		RDRE,
		RADR,
		RBDR,
		RDRS,
		RBRF,
		RDIR,
		RFLO,
		RPSB,
		RREC
	}

	public enum tDomainLNGroupSEnum
	{
		SARC,
		SIMG,
		SIML,
		SPDC
	}

	public enum tDomainLNGroupTEnum 
	{
		TCTR,
		TVTR
	}

	public enum tDomainLNGroupXEnum
	{
		XCBR,
		XSWI
	}
	

	public enum tDomainLNGroupYEnum
	{
		YPTR,
		YEFN,
		YLTC,
		YPSH	
	}

	public enum tDomainLNGroupZEnum 
	{
		ZAXN,
		ZBAT,
		ZBSH,
		ZCAB,
		ZCAP,
		ZCON,
		ZGEN,
		ZGIL,
		ZLIN,
		ZMOT,
		ZREA,
		ZRRC,
		ZSAR,
		ZTCF,
		ZTCR
	}

	public enum tDomainLNEnum
	{
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
		ZAXN,ZBAT,ZBSH,ZCAB,ZCAP,ZCON,ZGEN,ZGIL,ZLIN,ZMOT,ZREA,ZRRC,ZSAR,ZTCF,ZTCR
	}

	public enum tPredefinedLNClassEnum 
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
		ZAXN,ZBAT,ZBSH,ZCAB,ZCAP,ZCON,ZGEN,ZGIL,ZLIN,ZMOT,ZREA,ZRRC,ZSAR,ZTCF,ZTCR
	}


	public enum tPredefinedAttributeNameEnum
	{
		T,		
		Test,		
		Check,
		SIUnit,
		Oper,
		SBO,
		SBOw,
		Cancel
	}

	public enum tAttributeNameEnum
	{
		T,		
		Test,		
		Check,
		SIUnit,
		Oper,
		SBO,
		SBOw,
		Cancel,
		ctlVal,
		operTm,
		origin,
		ctlNum,
		stVal,
		q,
		t,
		stSeld,
		subEna,
		subVal,
		subQ,
		subID,
		ctlModel,
		sboTimeout,
		sboClass,
		minVal,
		maxVal,
		stepSize,
		d,
		dU,
		cdcNs,
		cdcName,
		dataNs
	}

	public enum tPredefinedGeneralEquipmentEnum
	{
		AXN,		
		BAT,		
		MOT	
	}

	public enum tGeneralEquipmentEnum
	{
		AXN,
		BAT,
		MOT
	}

	public enum tPredefinedCommonConductingEquipmentEnum
	{
		CBR,
		DIS,
		VTR,
		CTR,
		GEN,
		CAP,
		REA,
		CON,
		MOT,
		EFN,
		PSH,
		BAT,
		BSH,
		CAB,
		GIL,
		LIN,
		RRC,
		SAR,
		TCF,
		TCR,
		IFL
	}

	public enum tCommonConductingEquipmentEnum
	{
		CBR,
		DIS,
		VTR,
		CTR,
		GEN,
		CAP,
		REA,
		CON,
		MOT,
		EFN,
		PSH,
		BAT,
		BSH,
		CAB,
		GIL,
		LIN,
		RRC,
		SAR,
		TCF,
		TCR,
		IFL
	}

	public enum tPredefinedCDCEnum
	{
		SPS,
		DPS,
		INS,
		ACT,
		ACD,
		SEC,
		BCR,
		MV,
		CMV,
		SAV,
		WYE,
		DEL,
		SEQ,
		HMV,
		HWYE,
		HDEL,
		SPC,
		DPC,
		INC,
		BSC,
		ISC,
		APC,
		SPG,
		ING,
		ASG,
		CURVE,
		DPL,
		LPL,
		CSD			
	}

	public enum tCDCEnum
	{
		SPS,
		DPS,
		INS,
		ACT,
		ACD,
		SEC,
		BCR,
		MV,
		CMV,
		SAV,
		WYE,
		DEL,
		SEQ,
		HMV,
		HWYE,
		HDEL,
		SPC,
		DPC,
		INC,
		BSC,
		ISC,
		APC,
		SPG,
		ING,
		ASG,
		CURVE,
		DPL,
		LPL,
		CSD,
		EXT // For Extensions
	}

	public enum  tPredefinedBasicTypeEnum 
	{
		BOOLEAN,
		INT8,
		INT16,
		INT24,
		INT32,
		INT128,
		INT8U,
		INT16U,
		INT24U,
		INT32U,
		FLOAT32,
		FLOAT64,
		Enum,
		Dbpos,
		Tcmd,
		Quality,
		Timestamp,
		VisString32,
		VisString64,
		VisString129,
		VisString255,
		Octet64,
		Struct,
		EntryTime,
		Unicode255,
		Check
	}

	public enum tTransformerWindingEnum 
	{
		PTW
	}

	public enum tPhaseEnum 
	{
		A,
		B,
		C,
		N,
		all,
		none
	}

	public enum tPowerTransformerEnum 
	{
		PTR
	}
}

