<?xml version="1.0" encoding="UTF-8"?>
<!-- Coment -->
<!-- Coment 2 -->
<SCL xmlns:scl="http://www.iec.ch/61850/2003/SCL" xmlns:lscl="http://www.librescl.org/SCL" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header id="TEMPLATE" nameStructure="IEDName" revision="0" toolID="YYYYY" version="3">
		<Text>Capabilities of a #IRVA3S205K from ZIV</Text>
		<History>
			<Hitem version="3" revision="0" when="20120411" what="START" who="SOMEONE" why="TEMPLATE"/>
		</History>
	</Header>
	<Communication>
		<SubNetwork name="SubRedIRV" type="8-MMS/TCP">
			<BitRate unit="b/s" multiplier="M">100</BitRate>
			<ConnectedAP iedName="ORC12D1" apName="S1">
				<Address>
					<P type="IP">192.168.8.41</P>
					<P type="IP-SUBNET">255.255.255.0</P>
					<P type="IP-GATEWAY">192.168.8.200</P>
					<P xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="tP_OSI-PSEL" type="OSI-PSEL">00000001</P>
					<P xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="tP_OSI-SSEL" type="OSI-SSEL">0001</P>
					<P xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="tP_OSI-TSEL" type="OSI-TSEL">0001</P>
					<P xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="tP_OSI-AE-Qualifier" type="OSI-AE-Qualifier">12</P>
					<P type="OSI-AP-Title">41,1,999,1</P>
				</Address>
				<GSE ldInst="LD1" cbName="gcb01">
					<Address>
						<P xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="tP_VLAN-ID" type="VLAN-ID">000</P>
						<P xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="tP_VLAN-PRIORITY" type="VLAN-PRIORITY">1</P>
						<P xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="tP_MAC-Address" type="MAC-Address">01-0C-CD-01-00-29</P>
						<P xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="tP_APPID" type="APPID">0004</P>
					</Address>
					<MinTime unit="s" multiplier="m">10</MinTime>
					<MaxTime unit="s" multiplier="m">2000</MaxTime>
				</GSE>
				<GSE ldInst="LD1" cbName="gcb02">
					<Address>
						<P xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="tP_VLAN-ID" type="VLAN-ID">000</P>
						<P xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="tP_VLAN-PRIORITY" type="VLAN-PRIORITY">0</P>
						<P xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="tP_MAC-Address" type="MAC-Address">01-0C-CD-01-00-C2</P>
						<P xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="tP_APPID" type="APPID">0000</P>
					</Address>
					<MinTime unit="s" multiplier="m">10</MinTime>
					<MaxTime unit="s" multiplier="m">2000</MaxTime>
				</GSE>
				<GSE ldInst="LD1" cbName="gcb03">
					<Address>
						<P xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="tP_VLAN-ID" type="VLAN-ID">000</P>
						<P xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="tP_VLAN-PRIORITY" type="VLAN-PRIORITY">0</P>
						<P xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="tP_MAC-Address" type="MAC-Address">01-0C-CD-01-00-C3</P>
						<P xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="tP_APPID" type="APPID">0000</P>
					</Address>
					<MinTime unit="s" multiplier="m">10</MinTime>
					<MaxTime unit="s" multiplier="m">2000</MaxTime>
				</GSE>
			</ConnectedAP>
		</SubNetwork>
	</Communication>
	<IED name="TEMPLATE" desc="TEMPLATE DEVICE" type="LIBRESCL" manufacturer="LibreSCL" configVersion="0.2">
		<Services>
			<FileHandling/>
			<DynAssociation/>
			<GetDirectory/>
			<GetDataObjectDefinition/>
			<DataObjectDirectory/>
			<GetDataSetValue/>
			<DataSetDirectory/>
			<ReadWrite/>
			<GetCBValues/>
			<LogSettings cbName="Fix" datSet="Conf" intgPd="Dyn" logEna="Dyn" trgOps="Dyn"/>
			<ConfLNs fixLnInst="true" fixPrefix="true"/>
			<ConfReportControl max="14"/>
			<ConfLogControl max="1"/>
			<ConfDataSet max="8" maxAttributes="750" modify="true"/>
			<ReportSettings cbName="Fix" datSet="Fix" rptID="Dyn" optFields="Dyn" bufTime="Dyn" trgOps="Dyn" intgPd="Dyn"/>
			<GOOSE max="3"/>
		</Services>
		<AccessPoint name="S1">
			<Private xmlns="http://www.iec.ch/61850/2003/SCL" lscl:Test="true">LibreSCL</Private>
			<Server>
				<Authentication none="true"/>
				<LDevice desc="Only One LD" inst="LD">
					<LN0 desc="Logical Node Zero" inst="" lnClass="LLN0" lnType="TEMPLATE_LLN0">
						<DataSet name="PROTECTIONS" desc="Protection signals">
							<FCDA daName="phsA" doName="Str" fc="ST" ldInst="LD1" lnClass="PIOC" lnInst="1" prefix="PHS"/>
							<FCDA daName="phsB" doName="Str" fc="ST" ldInst="LD1" lnClass="PIOC" lnInst="1" prefix="PHS"/>
							<FCDA daName="phsC" doName="Str" fc="ST" ldInst="LD1" lnClass="PIOC" lnInst="1" prefix="PHS"/>
							<FCDA daName="phsA" doName="Str" fc="ST" ldInst="LD1" lnClass="PIOC" lnInst="2" prefix="PHS"/>
							<FCDA daName="phsB" doName="Str" fc="ST" ldInst="LD1" lnClass="PIOC" lnInst="2" prefix="PHS"/>
							<FCDA daName="phsC" doName="Str" fc="ST" ldInst="LD1" lnClass="PIOC" lnInst="2" prefix="PHS"/>
							<FCDA daName="neut" doName="Str" fc="ST" ldInst="LD1" lnClass="PIOC" lnInst="1" prefix="GND"/>
							<FCDA daName="neut" doName="Str" fc="ST" ldInst="LD1" lnClass="PIOC" lnInst="2" prefix="GND"/>
							<FCDA daName="neut" doName="Str" fc="ST" ldInst="LD1" lnClass="PIOC" lnInst="3" prefix="GND"/>
							<FCDA daName="phsA" doName="Str" fc="ST" ldInst="LD1" lnClass="PTOC" lnInst="1" prefix="PHS"/>
							<FCDA daName="phsB" doName="Str" fc="ST" ldInst="LD1" lnClass="PTOC" lnInst="1" prefix="PHS"/>
							<FCDA daName="phsC" doName="Str" fc="ST" ldInst="LD1" lnClass="PTOC" lnInst="1" prefix="PHS"/>
							<FCDA daName="phsA" doName="Str" fc="ST" ldInst="LD1" lnClass="PTOC" lnInst="2" prefix="PHS"/>
							<FCDA daName="phsB" doName="Str" fc="ST" ldInst="LD1" lnClass="PTOC" lnInst="2" prefix="PHS"/>
							<FCDA daName="phsC" doName="Str" fc="ST" ldInst="LD1" lnClass="PTOC" lnInst="2" prefix="PHS"/>
							<FCDA daName="phsA" doName="Str" fc="ST" ldInst="LD1" lnClass="PTOC" lnInst="3" prefix="PHS"/>
							<FCDA daName="phsB" doName="Str" fc="ST" ldInst="LD1" lnClass="PTOC" lnInst="3" prefix="PHS"/>
							<FCDA daName="phsC" doName="Str" fc="ST" ldInst="LD1" lnClass="PTOC" lnInst="3" prefix="PHS"/>
							<FCDA daName="neut" doName="Str" fc="ST" ldInst="LD1" lnClass="PTOC" lnInst="1" prefix="GND"/>
							<FCDA daName="neut" doName="Str" fc="ST" ldInst="LD1" lnClass="PTOC" lnInst="2" prefix="GND"/>
							<FCDA daName="neut" doName="Str" fc="ST" ldInst="LD1" lnClass="PTOC" lnInst="3" prefix="GND"/>
							<FCDA daName="neut" doName="Str" fc="ST" ldInst="LD1" lnClass="PTOC" lnInst="4" prefix="GND"/>
							<FCDA daName="general" doName="Str" fc="ST" ldInst="LD1" lnClass="PTUF" lnInst="1" prefix=""/>
							<FCDA daName="general" doName="Str" fc="ST" ldInst="LD1" lnClass="PTUF" lnInst="2" prefix=""/>
							<FCDA daName="general" doName="Str" fc="ST" ldInst="LD1" lnClass="PTUF" lnInst="3" prefix=""/>
							<FCDA daName="general" doName="Str" fc="ST" ldInst="LD1" lnClass="PTUF" lnInst="4" prefix=""/>
							<FCDA daName="general" doName="Str" fc="ST" ldInst="LD1" lnClass="PFRC" lnInst="1" prefix=""/>
							<FCDA daName="general" doName="Str" fc="ST" ldInst="LD1" lnClass="PFRC" lnInst="2" prefix=""/>
							<FCDA daName="general" doName="Str" fc="ST" ldInst="LD1" lnClass="PFRC" lnInst="3" prefix=""/>
							<FCDA daName="general" doName="Str" fc="ST" ldInst="LD1" lnClass="PFRC" lnInst="4" prefix=""/>
						</DataSet>
						<DataSet name="GOOSE" desc="GOOSE">
							<FCDA daName="stVal" doName="Ind01" fc="ST" ldInst="LD1" lnClass="GGIO" lnInst="2" prefix="GEN"/>
							<FCDA daName="q" doName="Ind01" fc="ST" ldInst="LD1" lnClass="GGIO" lnInst="2" prefix="GEN"/>
							<FCDA daName="stVal" doName="Ind02" fc="ST" ldInst="LD1" lnClass="GGIO" lnInst="2" prefix="GEN"/>
							<FCDA daName="stVal" doName="Ind03" fc="ST" ldInst="LD1" lnClass="GGIO" lnInst="2" prefix="GEN"/>
							<FCDA daName="q" doName="Ind03" fc="ST" ldInst="LD1" lnClass="GGIO" lnInst="2" prefix="GEN"/>
							<FCDA daName="stVal" doName="Ind04" fc="ST" ldInst="LD1" lnClass="GGIO" lnInst="2" prefix="GEN"/>
							<FCDA daName="q" doName="Ind04" fc="ST" ldInst="LD1" lnClass="GGIO" lnInst="2" prefix="GEN"/>
							<FCDA daName="stVal" doName="Ind05" fc="ST" ldInst="LD1" lnClass="GGIO" lnInst="2" prefix="GEN"/>
							<FCDA daName="q" doName="Ind05" fc="ST" ldInst="LD1" lnClass="GGIO" lnInst="2" prefix="GEN"/>
						</DataSet>
						<ReportControl bufTime="100" name="brcb" desc="Buffered Report" rptID="brcb01" intgPd="0" confRev="0.2" buffered="true" datSet="Estados">
							<TrgOps period="false" dchg="true" qchg="true" dupd="false"/>
							<OptFields seqNum="false" timeStamp="false" reasonCode="false" dataSet="true" dataRef="false" entryID="true" configRef="false"/>
						</ReportControl>
						<LogControl name="GeneralLog" desc="Test Logs" logName="LD" logEna="true" intgPd="5000" reasonCode="true"/>
						<DOI desc="Logical Node Zero" name="NamPlt">
							<DAI name="vendor" valKind="RO">
								<Val>LibreSCL</Val>
							</DAI>
							<DAI name="Test01" valKind="RO">
								<Val>Store01</Val>
							</DAI>
							<DAI name="Test02" valKind="Set">
								<Val>Store02</Val>
							</DAI>
							<DAI name="configRev" valKind="RO">
								<Val>0.2</Val>
							</DAI>
						</DOI>
						<GSEControl name="gcb01" desc="Salida de GOOSE 1" confRev="10001" type="GOOSE" appID="TRIP" datSet="GOOSE"/>
						<SettingControl desc="Setting Groups" actSG="1" numOfSGs="4"/>
					</LN0>
					<LN desc="GOOSE inputs" lnType="TEMPLATE_GGIO" lnClass="GGIO" inst="1" prefix="GI">
						<DOI name="NamPlt">
							<DAI name="d" valKind="Set">
								<Val>GOOSE inputs</Val>
							</DAI>
							<DAI name="configRev" valKind="RO">
								<Val/>
							</DAI>
							<DAI name="paramRev" valKind="RO">
								<Val>0.2</Val>
							</DAI>
						</DOI>
						<DOI name="SPCSO">
							<SDI name="pulseConfig">
								<DAI name="cmdQual" valKind="RO">
									<Val>0</Val>
								</DAI>
								<DAI name="onDur" valKind="RO">
									<Val>0</Val>
								</DAI>
								<DAI name="offDur" valKind="RO">
									<Val>0</Val>
								</DAI>
								<DAI name="numPls" valKind="RO">
									<Val>0</Val>
								</DAI>
							</SDI>
							<DAI name="ctlModel" valKind="RO">
								<Val>0</Val>
							</DAI>
						</DOI>
						<DOI name="Ind01">
							<DAI name="d" valKind="Set">
								<Val>interlock</Val>
							</DAI>
						</DOI>
						<DOI name="InRef1">
							<DAI name="setRef" valKind="Set">
								<Val>MAC:01-0C-CD-01-00-23;APPID:4;GCBREF:ORC02A1LD1/LLN0$GO$gcb01;GOID:ORC02A1;POS:1</Val>
							</DAI>
							<DAI name="intAddr" valKind="Set">
								<Val>GIGGIO1.Ind01.stVal[ST]</Val>
							</DAI>
							<DAI name="d" valKind="Set">
								<Val>GOOSE suscription input</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
			</Server>
		</AccessPoint>
	</IED>
	<DataTypeTemplates>
		<LNodeType id="TEMPLATE_GGIO" lnClass="GGIO">
			<DO name="Mod" type="TEMPLATE_INC_mod_nc"/>
			<DO name="Beh" type="TEMPLATE_INS_Beh"/>
			<DO name="Health" type="TEMPLATE_INS_Health"/>
			<DO name="NamPlt" type="TEMPLATE_EXT_LPLg"/>
			<DO name="SPCSO01" type="TEMPLATE_SPC"/>
			<DO name="Ind01" type="TEMPLATE_SPSq"/>
			<DO name="InRef1" type="TEMPLATE_EXT_ORG"/>
		</LNodeType>
		<LNodeType id="TEMPLATE_GLOG" lnClass="GLOG">
			<DO name="Mod" type="TEMPLATE_INC_mod_nc"/>
			<DO name="Beh" type="TEMPLATE_INS_Beh"/>
			<DO name="Health" type="TEMPLATE_INS_Health"/>
			<DO name="NamPlt" type="TEMPLATE_LPL"/>
			<DO name="OpCntRs" type="TEMPLATE_INC"/>
			<DO name="LogRef" type="TEMPLATE_ORG"/>
			<DO name="TrgRef1" type="TEMPLATE_ORG"/>
			<DO name="InRef1" type="TEMPLATE_ORG"/>
		</LNodeType>
		<LNodeType id="TEMPLATE_LLN0" lnClass="LLN0">
			<DO name="Mod" type="TEMPLATE_INC_mod_nc"/>
			<DO name="Beh" type="TEMPLATE_INS_Beh"/>
			<DO name="Health" type="TEMPLATE_INS_Health"/>
			<DO name="NamPlt" type="TEMPLATE_EXT_LPL"/>
			<DO name="LocKey" type="TEMPLATE_EXT_SPS"/>
			<DO name="RemCtlBlk" type="TEMPLATE_EXT_SPC"/>
			<DO name="LEDRs" type="TEMPLATE_SPCnctr" transient="true"/>
		</LNodeType>
		<DOType id="TEMPLATE_INC_mod_n" desc="" cdc="INC">
			<DA name="stVal" fc="ST" bType="Enum" type="Mod" dchg="true" valKind="RO"/>
			<DA name="q" fc="ST" bType="Quality" valKind="RO"/>
			<DA name="t" fc="ST" bType="Timestamp" valKind="RO"/>
			<DA name="ctlModel" fc="CF" bType="Enum" type="ctlModel" valKind="RO"/>
			<DA name="d" fc="DC" bType="VisString255" valKind="Set"/>
		</DOType>
		<DOType id="TEMPLATE_INS_Beh" desc="" cdc="INS">
			<DA name="stVal" fc="ST" bType="Enum" type="Beh" dchg="true" valKind="RO"/>
			<DA name="q" fc="ST" bType="Quality" qchg="true" valKind="RO"/>
			<DA name="t" fc="ST" bType="Timestamp" valKind="RO"/>
			<DA name="d" fc="DC" bType="VisString255" valKind="Set"/>
		</DOType>
		<DOType id="TEMPLATE_INS_Health" desc="" cdc="INS">
			<DA name="stVal" fc="ST" bType="Enum" type="Health" dchg="true" valKind="RO"/>
			<DA name="q" fc="ST" bType="Quality" qchg="true" valKind="RO"/>
			<DA name="t" fc="ST" bType="Timestamp" valKind="RO"/>
			<DA name="d" fc="DC" bType="VisString255" valKind="Set"/>
		</DOType>
		<DOType id="TEMPLATE_INS_PhyHealth" desc="" cdc="INS">
			<DA name="stVal" fc="ST" bType="Enum" type="PhyHealth_ziv_0" dchg="true" valKind="RO"/>
			<DA name="q" fc="ST" bType="Quality" qchg="true" valKind="RO"/>
			<DA name="t" fc="ST" bType="Timestamp" valKind="RO"/>
			<DA name="d" fc="DC" bType="VisString255" valKind="Set"/>
		</DOType>
		<DOType id="INS_ziv" desc="INS" cdc="INS">
			<DA name="stVal" fc="ST" bType="INT32" dchg="true" valKind="RO"/>
			<DA name="q" fc="ST" bType="Quality" qchg="true" valKind="RO"/>
			<DA name="t" fc="ST" bType="Timestamp" valKind="RO"/>
			<DA name="d" fc="DC" bType="VisString255" valKind="Set"/>
		</DOType>
		<DOType id="TEMPLATE_LPL" desc="" cdc="LPL">
			<DA name="vendor" fc="DC" bType="VisString255" valKind="RO"/>
			<DA name="swRev" fc="DC" bType="VisString255" valKind="RO"/>
			<DA name="d" fc="DC" bType="VisString255" valKind="Set"/>
			<DA name="configRev" fc="DC" bType="VisString255" valKind="RO"/>
			<DA name="paramRev" fc="DC" bType="VisString255" valKind="RO"/>
			<DA name="lnNs" fc="EX" bType="VisString255" valKind="RO"/>
		</DOType>
		<DOType id="TEMPLATE_EXT_LPLg" desc="" cdc="LPL">
			<DA name="vendor" fc="DC" bType="VisString255" valKind="RO"/>
			<DA name="swRev" fc="DC" bType="VisString255" valKind="RO"/>
			<DA name="d" fc="DC" bType="VisString255" valKind="Set"/>
			<DA name="configRev" fc="DC" bType="VisString255" valKind="RO"/>
			<DA name="paramRev" fc="DC" bType="VisString255" valKind="RO"/>
			<DA name="cdcNs" fc="EX" bType="VisString255" valKind="RO"/>
			<DA name="cdcName" fc="EX" bType="VisString255" valKind="RO"/>
		</DOType>
		<DOType id="TEMPLATE_EXT_LPL" desc="" cdc="LPL">
			<DA name="vendor" fc="DC" bType="VisString255" valKind="RO"/>
			<DA name="swRev" fc="DC" bType="VisString255" valKind="RO"/>
			<DA name="d" fc="DC" bType="VisString255"/>
			<DA name="configRev" fc="DC" bType="VisString255" valKind="RO"/>
			<DA name="paramRev" fc="DC" bType="VisString255" valKind="RO"/>
			<DA name="ldNs" fc="EX" bType="VisString255" valKind="RO"/>
			<DA name="cdcNs" fc="EX" bType="VisString255" valKind="RO"/>
			<DA name="cdcName" fc="EX" bType="VisString255" valKind="RO"/>
		</DOType>
		<DOType id="TEMPLATE_ORG" desc="" cdc="ORG">
			<DA name="setRef" fc="SP" bType="VisString255" dchg="true" valKind="Set"/>
			<DA name="intAddr" fc="SP" bType="VisString255" dchg="true" valKind="Set"/>
			<DA name="d" fc="DC" bType="VisString255" valKind="Set"/>
		</DOType>
		<DOType id="TEMPLATE_EXT_ORG" desc="" cdc="ORG">
			<DA name="setRef" fc="SP" bType="VisString255" dchg="true" valKind="Set"/>
			<DA name="intAddr" fc="SP" bType="VisString255" dchg="true" valKind="Set"/>
			<DA name="d" fc="DC" bType="VisString255"/>
			<DA name="dataNs" fc="EX" bType="VisString255" valKind="RO"/>
		</DOType>
		<DOType id="TEMPLATE_SPS" desc="SPS" cdc="SPS">
			<DA name="stVal" fc="ST" bType="BOOLEAN" dchg="true" valKind="RO"/>
			<DA name="q" fc="ST" bType="Quality" qchg="true" valKind="RO"/>
			<DA name="t" fc="ST" bType="Timestamp" valKind="RO"/>
			<DA name="d" fc="DC" bType="VisString255"/>
		</DOType>
		<EnumType id="Beh">
			<EnumVal ord="1">on</EnumVal>
			<EnumVal ord="2">blocked</EnumVal>
			<EnumVal ord="3">test</EnumVal>
			<EnumVal ord="4">test/blocked</EnumVal>
			<EnumVal ord="5">off</EnumVal>
		</EnumType>
		<EnumType id="ctlModel">
			<EnumVal ord="0">status-only</EnumVal>
			<EnumVal ord="1">direct-with-normal-security</EnumVal>
			<EnumVal ord="2">sbo-with-normal-security</EnumVal>
			<EnumVal ord="3">direct-with-enhanced-security</EnumVal>
			<EnumVal ord="4">sbo-with-enhanced-security</EnumVal>
		</EnumType>
		<EnumType id="multiplier">
			<EnumVal ord="-24">y</EnumVal>
			<EnumVal ord="-21">z</EnumVal>
			<EnumVal ord="-18">a</EnumVal>
			<EnumVal ord="-15">f</EnumVal>
			<EnumVal ord="-12">p</EnumVal>
			<EnumVal ord="-9">n</EnumVal>
			<EnumVal ord="-6">µ</EnumVal>
			<EnumVal ord="-3">m</EnumVal>
			<EnumVal ord="-2">c</EnumVal>
			<EnumVal ord="-1">d</EnumVal>
			<EnumVal ord="0"/>
			<EnumVal ord="1">da</EnumVal>
			<EnumVal ord="2">h</EnumVal>
			<EnumVal ord="3">k</EnumVal>
			<EnumVal ord="6">M</EnumVal>
			<EnumVal ord="9">G</EnumVal>
			<EnumVal ord="12">T</EnumVal>
			<EnumVal ord="15">P</EnumVal>
			<EnumVal ord="18">E</EnumVal>
			<EnumVal ord="21">Z</EnumVal>
			<EnumVal ord="24">Y</EnumVal>
		</EnumType>
		<EnumType id="orCategory">
			<EnumVal ord="0">not-supported</EnumVal>
			<EnumVal ord="1">bay-control</EnumVal>
			<EnumVal ord="2">station-control</EnumVal>
			<EnumVal ord="3">remote-control</EnumVal>
			<EnumVal ord="4">automatic-bay</EnumVal>
			<EnumVal ord="5">automatic-station</EnumVal>
			<EnumVal ord="6">automatic-remote</EnumVal>
			<EnumVal ord="7">maintenance</EnumVal>
			<EnumVal ord="8">process</EnumVal>
		</EnumType>
		<EnumType id="SIUnit">
			<EnumVal ord="1"/>
			<EnumVal ord="2">m</EnumVal>
			<EnumVal ord="3">kg</EnumVal>
			<EnumVal ord="4">s</EnumVal>
			<EnumVal ord="5">A</EnumVal>
			<EnumVal ord="6">K</EnumVal>
			<EnumVal ord="7">mol</EnumVal>
			<EnumVal ord="8">cd</EnumVal>
			<EnumVal ord="9">deg</EnumVal>
			<EnumVal ord="10">rad</EnumVal>
			<EnumVal ord="11">sr</EnumVal>
			<EnumVal ord="21">Gy</EnumVal>
			<EnumVal ord="22">q</EnumVal>
			<EnumVal ord="23">°C</EnumVal>
			<EnumVal ord="24">Sv</EnumVal>
			<EnumVal ord="25">F</EnumVal>
			<EnumVal ord="26">C</EnumVal>
			<EnumVal ord="27">S</EnumVal>
			<EnumVal ord="28">H</EnumVal>
			<EnumVal ord="29">V</EnumVal>
			<EnumVal ord="30">ohm</EnumVal>
			<EnumVal ord="31">J</EnumVal>
			<EnumVal ord="32">N</EnumVal>
			<EnumVal ord="33">Hz</EnumVal>
			<EnumVal ord="34">lx</EnumVal>
			<EnumVal ord="35">Lm</EnumVal>
			<EnumVal ord="36">Wb</EnumVal>
			<EnumVal ord="37">T</EnumVal>
			<EnumVal ord="38">W</EnumVal>
			<EnumVal ord="39">Pa</EnumVal>
			<EnumVal ord="41">m²</EnumVal>
			<EnumVal ord="42">m³</EnumVal>
			<EnumVal ord="43">m/s</EnumVal>
			<EnumVal ord="44">m/s²</EnumVal>
			<EnumVal ord="45">m³/s</EnumVal>
			<EnumVal ord="46">m/m³</EnumVal>
			<EnumVal ord="47">M</EnumVal>
			<EnumVal ord="48">kg/m³</EnumVal>
			<EnumVal ord="49">m²/s</EnumVal>
			<EnumVal ord="50">W/m K</EnumVal>
			<EnumVal ord="51">J/K</EnumVal>
			<EnumVal ord="52">ppm</EnumVal>
			<EnumVal ord="53">1/s</EnumVal>
			<EnumVal ord="54">rad/s</EnumVal>
			<EnumVal ord="61">VA</EnumVal>
			<EnumVal ord="62">Watts</EnumVal>
			<EnumVal ord="63">VAr</EnumVal>
			<EnumVal ord="64">phi</EnumVal>
			<EnumVal ord="65">cos(phi)</EnumVal>
			<EnumVal ord="66">Vs</EnumVal>
			<EnumVal ord="67">V²</EnumVal>
			<EnumVal ord="68">As</EnumVal>
			<EnumVal ord="69">A²</EnumVal>
			<EnumVal ord="70">A²t</EnumVal>
			<EnumVal ord="71">VAh</EnumVal>
			<EnumVal ord="72">Wh</EnumVal>
			<EnumVal ord="73">VArh</EnumVal>
			<EnumVal ord="74">V/Hz</EnumVal>
			<EnumVal ord="75">Hz/s</EnumVal>
		</EnumType>
	</DataTypeTemplates>
</SCL>
