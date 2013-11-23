
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;																						
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
Library UNISIM;
use UNISIM.vcomponents.all; --  for bufg

entity trigger is
	port (
		clock50 : in STD_LOGIC;
		clock100 : in STD_LOGIC;
		clock200 : in STD_LOGIC;
		clock400 : in STD_LOGIC; 
		clock1 : in STD_LOGIC;
		trig_in : in STD_LOGIC_VECTOR (32*7-1 downto 0);		
		trig_out : out STD_LOGIC_VECTOR (32*1-1 downto 0);
		nim_in   : in  STD_LOGIC;
		nim_out  : out STD_LOGIC;
		led	     : out STD_LOGIC_VECTOR(8 downto 1); -- 8 LEDs onboard
		pgxled   : out STD_LOGIC_VECTOR(8 downto 1); -- 8 LEDs on PIG board
		Global_Reset_After_Power_Up : in std_logic;
		VN2andVN1 : in std_logic_vector(7 downto 0);
--............................. vme interface ....................
		u_ad_reg :in std_logic_vector(11 downto 2);
		u_dat_in :in std_logic_vector(31 downto 0);
		u_data_o :out std_logic_vector(31 downto 0);
		oecsr, ckcsr:in std_logic
	);
end trigger;


architecture RTL of trigger is
	constant FirmwareType: integer := 5;
	constant FirmwareRevision: integer := 10;
	signal TRIG_FIXED : std_logic_vector(31 downto 0); 

	subtype sub_Address is std_logic_vector(11 downto 4);
	constant BASE_TRIG_InputPatternMask_IN1 : sub_Address 			:= x"50" ; -- r/w
	constant BASE_TRIG_InputPatternMask_IN2 : sub_Address 			:= x"51" ; -- r/w
	constant BASE_TRIG_InputPatternMask_IN3 : sub_Address 			:= x"52" ; -- r/w
	constant BASE_TRIG_InputPatternMask_INOUT1 : sub_Address			:= x"53" ; -- r/w
	constant BASE_TRIG_InputPatternMask_INOUT2 : sub_Address			:= x"54" ; -- r/w
	constant BASE_TRIG_InputPatternMask_INOUT3 : sub_Address			:= x"55" ; -- r/w
	
	constant BASE_TRIG_DisableNIMOUT : sub_Address						:= x"b0" ; -- r/w

	--debug
	constant BASE_TRIG_Debug_ActualState : sub_Address							:= x"e0"; --r
	constant BASE_TRIG_SelectedDebugInput_1 : sub_Address						:= x"e1"; --r/w
	constant BASE_TRIG_SelectedDebugInput_2 : sub_Address						:= x"e2"; --r/w
	constant BASE_TRIG_SelectedDebugInput_3 : sub_Address						:= x"e3"; --r/w
	constant BASE_TRIG_SelectedDebugInput_4 : sub_Address						:= x"e4"; --r/w

	constant BASE_TRIG_FIXED : sub_Address 								:= x"f0" ; -- r

	------------------------------------------------------------------------------
	
	signal InputPatternMask : std_logic_vector(6*32-1 downto 0) := x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
	signal Post_trig_in, Post_trig_in_short : std_logic_vector(6*32-1 downto 0);
	
	signal CFD_Signals, LED1_Signals, LED2_Signals : std_logic_vector(63 downto 0);
	signal CFD_SectorOR, LED1_SectorOR, LED2_SectorOR : std_logic;
	
	--Signals for Coplanarity
	signal SB : std_logic_vector(63 downto 0); --Signals Trigger is Based on
	signal LED_Coplanar_Signals_SectorA, LED_Coplanar_Signals_SectorB, LED_Coplanar_Signals_SectorC,
		LED_Coplanar_Signals_SectorD, LED_Coplanar_Signals_SectorE, LED_Coplanar_Signals_SectorF : std_logic_vector(7 downto 0);
	
	
	component GateShortener
		 	generic ( 
				NCh : integer
			);  
			Port ( sig_in : in  STD_LOGIC;
				  sig_out : out  STD_LOGIC;
				  clock : in  STD_LOGIC);
	end component;
	
	COMPONENT Input_Enlarger
	Generic (
		Width : integer := 200
		);
	PORT(
		clock : IN std_logic;
		input_signal : IN std_logic;          
		output_signal : OUT std_logic
		);
	END COMPONENT;

	constant NumberCFDOfSignals: integer := 64;
	constant NumberOfSignalsPerModule: integer := 4;
	signal LongCFDSignals : std_logic_vector(NumberCFDOfSignals-1 downto 0);
	signal NTECModuleDataPresentSignal, NTECModuleDataPresentSignal_Saved : std_logic_vector( (NumberCFDOfSignals/NumberOfSignalsPerModule)-1 downto 0);
	signal ExperimentTriggerSignal : std_logic;
	signal ExperimentTriggerSignal_Gated : std_logic_vector(1 downto 0);
	
	COMPONENT EventIDSender
	PORT(
		UserEventID : IN std_logic_vector(31 downto 0);
		ResetSenderCounter : IN std_logic;
		clock50 : IN std_logic;          
		StatusCounter : OUT std_logic_vector(6 downto 0);
		OutputPin : OUT std_logic
		);
	END COMPONENT;
	
	signal ModuleEventIDInput : std_logic_vector(31 downto 0);
	signal SenderResetID : std_logic := '0';
	signal ModuleDataSignalOut : std_logic;

	------------------------------------------------------------------------------
	-- DebugChSelector

	COMPONENT DebugChSelector
	PORT(
		DebugSignalsIn : IN std_logic_vector(479 downto 0);
		SelectedInput : IN std_logic_vector(8 downto 0);          
		SelectedOutput : OUT std_logic
		);
	END COMPONENT;

	constant NDebugSignalOutputs : integer := 4;
	signal DebugSignals : std_logic_vector(479 downto 0);
	signal SelectedDebugInput : std_logic_vector(9*NDebugSignalOutputs-1 downto 0);
	signal Debug_ActualState : std_logic_vector(NDebugSignalOutputs-1 downto 0);

	------------------------------------------------------------------------------

	signal DisableNIMOUT: std_logic := '0';

begin
	TRIG_FIXED(31 downto 24) <= CONV_STD_LOGIC_VECTOR(FirmwareType, 8);
	TRIG_FIXED(23 downto 16) <= CONV_STD_LOGIC_VECTOR(0, 8);
	TRIG_FIXED(15 downto 0)  <= CONV_STD_LOGIC_VECTOR(FirmwareRevision, 16);

	LengthenCFDSignals: for i in 0 to NumberCFDOfSignals-1 generate
		CFDEnlarger: Input_Enlarger 
			GENERIC MAP(Width => 270) --2.7 mu s
			PORT MAP(
				clock => clock100,
				input_signal => trig_in(i),
				output_signal => LongCFDSignals(i)
			);
	end generate;

	ModuleDataSignals: for i in 0 to (NumberCFDOfSignals/NumberOfSignalsPerModule)-1 generate
		NTECModuleDataPresentSignal(i) <= '1' when LongCFDSignals((NumberOfSignalsPerModule-1)+i*NumberOfSignalsPerModule downto 0+i*NumberOfSignalsPerModule) /= "0" else '0';
	end generate;

--	ExperimentTriggerSignal <= nim_in; -- Experiment Trigger triggers the sending of Pattern Mask (data tells which NTEC card has data)
	ExperimentTriggerSignal <= trig_in(6*32+3); --From-Veto: ExpTrigger Signal, INOUT4, ch3
	process(clock50)
	begin
		if rising_edge(clock50) then
			ExperimentTriggerSignal_Gated(0) <= ExperimentTriggerSignal;
			ExperimentTriggerSignal_Gated(1) <= ExperimentTriggerSignal_Gated(0);
		end if;
	end process;
	
	process(clock50)
	begin
		if rising_edge(clock50) then
			SenderResetID <= '0';
			if ExperimentTriggerSignal_Gated = "01" then
				SenderResetID <= '1';
				NTECModuleDataPresentSignal_Saved <= NTECModuleDataPresentSignal;
			end if;	
		end if;
	end process;
	
	ModuleEventIDInput <= (31 downto 16 => '0') & NTECModuleDataPresentSignal_Saved;
	Inst_ModuleHitPatternSender: EventIDSender PORT MAP(
		StatusCounter => DebugSignals(323+6 downto 323+0),
		UserEventID => ModuleEventIDInput,
		ResetSenderCounter => SenderResetID,
		OutputPin => ModuleDataSignalOut,
		clock50 => clock50
	);
	nim_out <= ModuleDataSignalOut when DisableNIMOUT = '0' else '0';

	
	
	------------------------------------------------------------------------------------------------
	-- Enable/Disable individual channels
	Post_trig_in <= trig_in(6*32-1 downto 0) and InputPatternMask;


	DebugSignals(7*32-1 downto 0) <= trig_in;
	DebugSignals(7*32) <= NIM_IN;
	DebugSignals(7*32+1) <= SenderResetID;
	DebugSignals(7*32+2) <= ModuleDataSignalOut;
	DebugSignals(7*32+3+15 downto 7*32+3) <= NTECModuleDataPresentSignal;
	DebugSignals(243+63 downto 243) <= LongCFDSignals;
	DebugSignals(243+63+16 downto 243+64) <= NTECModuleDataPresentSignal_Saved;
	DebugSignals(479) <= clock1;
	

	-------------------------------------------------------------------------------------------------
	-- Debug Selector
	DebugChSelectors: for i in 0 to NDebugSignalOutputs-1 generate
   begin
		Inst_DebugChSelector: DebugChSelector PORT MAP(
			DebugSignalsIn => DebugSignals,
			SelectedInput => SelectedDebugInput((i+1)*9-1 downto i*9),  ---needs VME write
			SelectedOutput => Debug_ActualState(i)
		);
	end generate;
	trig_out(15 downto 12) <= Debug_ActualState;
	-------------------------------------------------------------------------------------------------



	------------------------------------------------------------------------------------------------
	-- Switch on corresponding LED if cable is connected
	led(1) <= '0' when (trig_in(31+0*32 downto 0*32) = x"00000000") else '1';
	led(2) <= '0';
	led(3) <= '0' when (trig_in(31+1*32 downto 1*32) = x"00000000") else '1';
	led(4) <= '0';
	led(5) <= '0' when (trig_in(31+2*32 downto 2*32) = x"00000000") else '1';
	led(6) <= '0';
	pgxled(1) <= '0' when (trig_in(31+3*32 downto 3*32) = x"00000000") else '1';
	pgxled(2) <= '0';
	pgxled(3) <= '0' when (trig_in(31+4*32 downto 4*32) = x"00000000") else '1';
	pgxled(4) <= '0';
	pgxled(5) <= '0' when (trig_in(31+5*32 downto 5*32) = x"00000000") else '1';
	pgxled(6) <= '0';
	pgxled(7) <= '0' when (trig_in(31+6*32 downto 6*32) = x"00000000") else '1';
	pgxled(8) <= '0';

	led(8 downto 7) <= "00";

	------------------------------------------------------------------------------------------------
	
	ShortenGates: for i in 0 to 6*32-1 generate
		GateShortener_1: GateShortener 
			GENERIC MAP(NCh=>10) 
			PORT MAP(
				sig_in=>Post_trig_in(i),
				sig_out=>Post_trig_in_short(i),
				clock=>clock100);
	end generate;

	------------------------------------------------------------------------------------------------

	CFD_Signals  <= Post_trig_in_short(2*32-1 downto 0*32);
	LED1_Signals <= Post_trig_in_short(4*32-1 downto 2*32);
	LED2_Signals <= Post_trig_in_short(6*32-1 downto 4*32);
	
	CFD_SectorOR <= '1' when CFD_Signals /= "0" else '0';
	LED1_SectorOR <= '1' when LED1_Signals /= "0" else '0';
	LED2_SectorOR <= '1' when LED2_Signals /= "0" else '0';

	trig_out(0) <= CFD_SectorOR;
	trig_out(1) <= LED1_SectorOR;
	trig_out(2) <= LED2_SectorOR;
	trig_out(3) <= trig_in(6*32); --Veto-OR: INOUT4, ch0
	trig_out(4) <= trig_in(6*32+1); --PWO-OR: INOUT4, ch1
	trig_out(5) <= trig_in(6*32+2); --PWO-Veto-OR: INOUT4, ch2
	trig_out(6) <= ExperimentTriggerSignal;
	trig_out(7) <= SenderResetID;
	trig_out(8) <= ModuleDataSignalOut;
	trig_out(9) <= NTECModuleDataPresentSignal(1);
	trig_out(10) <= NTECModuleDataPresentSignal_Saved(1);
	trig_out(11) <= NIM_IN; -- Sector B, NIM_IN: TAPS_L1_Interrupt_Delayed, Sector F, NIM_IN: PulserOutput_PreScaled_ExtDelayed

	
	----------------------------------------------------------------------------------------------------------------------------------------------------------------
	--Coplanarity Trigger start
	SB <= LED1_Signals;
	--Sector A
	LED_Coplanar_Signals_SectorA(0) <= SB(03) or SB(06) or SB(10) or SB(15) or SB(21) or SB(28) or SB(29) or SB(36) or SB(37) or SB(45) or SB(46) or SB(55); --bin 20
	LED_Coplanar_Signals_SectorA(1) <= SB(07) or SB(11) or SB(16) or SB(22) or SB(30) or SB(38) or SB(47) or SB(56); --bin 21
	LED_Coplanar_Signals_SectorA(2) <= SB(04) or SB(17) or SB(23) or SB(31) or SB(39) or SB(48) or SB(57) or SB(58); --bin 22
	LED_Coplanar_Signals_SectorA(3) <= SB(12) or SB(24) or SB(40) or SB(49) or SB(59); --bin 23
	LED_Coplanar_Signals_SectorA(4) <= SB(08) or SB(13) or SB(18) or SB(25) or SB(32) or SB(41) or SB(50) or SB(51) or SB(60); --bin 24
	LED_Coplanar_Signals_SectorA(5) <= SB(05) or SB(19) or SB(26) or SB(33) or SB(42) or SB(52) or SB(61) or SB(62); --bin 25
	LED_Coplanar_Signals_SectorA(6) <= SB(09) or SB(14) or SB(20) or SB(27) or SB(34) or SB(43) or SB(53) or SB(63); --bin 26
	LED_Coplanar_Signals_SectorA(7) <= SB(35) or SB(44) or SB(54); --bin 27
	
	
	--Sector B
	LED_Coplanar_Signals_SectorB(0) <= SB(3) or SB(6) or SB(10) or SB(15) or SB(21) or SB(28) or SB(29) or SB(36) or SB(37) or SB(45) or SB(46) or SB(55); --bin 28
	LED_Coplanar_Signals_SectorB(1) <= SB(7) or SB(11) or SB(16) or SB(22) or SB(30) or SB(38) or SB(47) or SB(56); --bin 29
	LED_Coplanar_Signals_SectorB(2) <= SB(4) or SB(17) or SB(23) or SB(31) or SB(39) or SB(48) or SB(57) or SB(58); --bin 30
	LED_Coplanar_Signals_SectorB(3) <= SB(12) or SB(24) or SB(40) or SB(49) or SB(59); --bin 31
	LED_Coplanar_Signals_SectorB(4) <= SB(8) or SB(13) or SB(18) or SB(25) or SB(32) or SB(41) or SB(50) or SB(51) or SB(60); --bin 32
	LED_Coplanar_Signals_SectorB(5) <= SB(5) or SB(19) or SB(26) or SB(33) or SB(42) or SB(52) or SB(61) or SB(62); --bin 33
	LED_Coplanar_Signals_SectorB(6) <= SB(9) or SB(14) or SB(20) or SB(27) or SB(34) or SB(43) or SB(53) or SB(63); --bin 34
	LED_Coplanar_Signals_SectorB(7) <= SB(35) or SB(44) or SB(54); --bin 35

	--Sector C
	LED_Coplanar_Signals_SectorC(0) <= SB(3) or SB(6) or SB(10) or SB(15) or SB(21) or SB(28) or SB(29) or SB(36) or SB(37) or SB(45) or SB(46); --bin 36
	LED_Coplanar_Signals_SectorC(1) <= SB(7) or SB(11) or SB(16) or SB(22) or SB(30) or SB(38) or SB(47) or SB(55); --bin 37
	LED_Coplanar_Signals_SectorC(2) <= SB(4) or SB(17) or SB(23) or SB(31) or SB(39) or SB(48) or SB(56) or SB(57); --bin 38
	LED_Coplanar_Signals_SectorC(3) <= SB(8) or SB(12) or SB(18) or SB(24) or SB(32) or SB(40) or SB(49) or SB(50) or SB(58); --bin 39
	LED_Coplanar_Signals_SectorC(4) <= SB(13) or SB(25) or SB(41) or SB(51) or SB(59); --bin 40
	LED_Coplanar_Signals_SectorC(5) <= SB(5) or SB(19) or SB(26) or SB(33) or SB(42) or SB(52) or SB(60) or SB(61); --bin 41
	LED_Coplanar_Signals_SectorC(6) <= SB(9) or SB(14) or SB(20) or SB(27) or SB(34) or SB(43) or SB(53) or SB(62); --bin 42
	LED_Coplanar_Signals_SectorC(7) <= SB(35) or SB(44) or SB(54) or SB(63); --bin 43

	--Sector D
	LED_Coplanar_Signals_SectorD(0) <= SB(3) or SB(6) or SB(10) or SB(15) or SB(21) or SB(28) or SB(29) or SB(36) or SB(37) or SB(45) or SB(46) or SB(55); --bin 44
	LED_Coplanar_Signals_SectorD(1) <= SB(7) or SB(11) or SB(16) or SB(22) or SB(30) or SB(38) or SB(47) or SB(56); --bin 45
	LED_Coplanar_Signals_SectorD(2) <= SB(4) or SB(17) or SB(23) or SB(31) or SB(39) or SB(48) or SB(57) or SB(58); --bin 46
	LED_Coplanar_Signals_SectorD(3) <= SB(12) or SB(24) or SB(40) or SB(49) or SB(59); --bin 47
	LED_Coplanar_Signals_SectorD(4) <= SB(8) or SB(13) or SB(18) or SB(25) or SB(32) or SB(41) or SB(50) or SB(51) or SB(60); --bin 0
	LED_Coplanar_Signals_SectorD(5) <= SB(5) or SB(19) or SB(26) or SB(33) or SB(42) or SB(52) or SB(61) or SB(62); --bin 1
	LED_Coplanar_Signals_SectorD(6) <= SB(9) or SB(14) or SB(20) or SB(27) or SB(34) or SB(43) or SB(53) or SB(63); --bin 2
	LED_Coplanar_Signals_SectorD(7) <= SB(35) or SB(44) or SB(54); --bin 3

	--Sector E
	LED_Coplanar_Signals_SectorE(0) <= SB(3) or SB(6) or SB(10) or SB(15) or SB(21) or SB(28) or SB(29) or SB(36) or SB(37) or SB(45) or SB(46) or SB(55); --bin 4
	LED_Coplanar_Signals_SectorE(1) <= SB(7) or SB(11) or SB(16) or SB(22) or SB(30) or SB(38) or SB(47) or SB(56); --bin 5
	LED_Coplanar_Signals_SectorE(2) <= SB(4) or SB(17) or SB(23) or SB(31) or SB(39) or SB(48) or SB(57) or SB(58); --bin 6
	LED_Coplanar_Signals_SectorE(3) <= SB(12) or SB(24) or SB(40) or SB(49) or SB(59); --bin 7
	LED_Coplanar_Signals_SectorE(4) <= SB(8) or SB(13) or SB(18) or SB(25) or SB(32) or SB(41) or SB(50) or SB(51) or SB(60); --bin 8
	LED_Coplanar_Signals_SectorE(5) <= SB(5) or SB(19) or SB(26) or SB(33) or SB(42) or SB(52) or SB(61) or SB(62); --bin 9
	LED_Coplanar_Signals_SectorE(6) <= SB(9) or SB(14) or SB(20) or SB(27) or SB(34) or SB(43) or SB(53) or SB(63); --bin 10
	LED_Coplanar_Signals_SectorE(7) <= SB(35) or SB(44) or SB(54); --bin 11

	--Sector F
	LED_Coplanar_Signals_SectorF(0) <= SB(3) or SB(6) or SB(10) or SB(15) or SB(21) or SB(28) or SB(29) or SB(36) or SB(37) or SB(45) or SB(46); --bin 12
	LED_Coplanar_Signals_SectorF(1) <= SB(7) or SB(11) or SB(16) or SB(22) or SB(30) or SB(38) or SB(47) or SB(55); --bin 13
	LED_Coplanar_Signals_SectorF(2) <= SB(4) or SB(17) or SB(23) or SB(31) or SB(39) or SB(48) or SB(56) or SB(57); --bin 14
	LED_Coplanar_Signals_SectorF(3) <= SB(8) or SB(12) or SB(18) or SB(24) or SB(32) or SB(40) or SB(49) or SB(50) or SB(58); --bin 15
	LED_Coplanar_Signals_SectorF(4) <= SB(13) or SB(25) or SB(41) or SB(51) or SB(59); --bin 16
	LED_Coplanar_Signals_SectorF(5) <= SB(5) or SB(19) or SB(26) or SB(33) or SB(42) or SB(52) or SB(60) or SB(61); --bin 17
	LED_Coplanar_Signals_SectorF(6) <= SB(9) or SB(14) or SB(20) or SB(27) or SB(34) or SB(43) or SB(53) or SB(62); --bin 18
	LED_Coplanar_Signals_SectorF(7) <= SB(35) or SB(44) or SB(54) or SB(63); --bin 19
	
	--select which sector should be given out
	trig_out(23 downto 16) <= 
		LED_Coplanar_Signals_SectorA when (VN2andVN1 = x"01") else
		LED_Coplanar_Signals_SectorB when (VN2andVN1 = x"02") else
		LED_Coplanar_Signals_SectorC when (VN2andVN1 = x"03") else
		LED_Coplanar_Signals_SectorD when (VN2andVN1 = x"04") else
		LED_Coplanar_Signals_SectorE when (VN2andVN1 = x"05") else
		LED_Coplanar_Signals_SectorF when (VN2andVN1 = x"06") else
		(others => '0');
	
	trig_out(31 downto 24) <= trig_in(31+32*6 downto 24+32*6); --Route through signals from VETO Sector module
	----------------------------------------------------------------------------------------------------------------------------------------------------------------

	

	---------------------------------------------------------------------------------------------------------	
	-- Code for VME handling / access
	-- handle read commands from vmebus
	---------------------------------------------------------------------------------------------------------	
	process(clock50, oecsr, u_ad_reg)
	begin
		if (clock50'event and clock50 = '1' and oecsr = '1') then
			u_data_o <= (others => '0');		
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_FIXED) then 						u_data_o(31 downto 0) <= TRIG_FIXED; end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_InputPatternMask_IN1) then 	u_data_o(31 downto 0) <= InputPatternMask(32*0+31 downto 32*0+0); end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_InputPatternMask_IN2) then 	u_data_o(31 downto 0) <= InputPatternMask(32*1+31 downto 32*1+0); end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_InputPatternMask_IN3) then 	u_data_o(31 downto 0) <= InputPatternMask(32*2+31 downto 32*2+0); end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_InputPatternMask_INOUT1) then u_data_o(31 downto 0) <= InputPatternMask(32*3+31 downto 32*3+0); end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_InputPatternMask_INOUT2) then u_data_o(31 downto 0) <= InputPatternMask(32*4+31 downto 32*4+0); end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_InputPatternMask_INOUT3) then u_data_o(31 downto 0) <= InputPatternMask(32*5+31 downto 32*5+0); end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_DisableNIMOUT) then 					u_data_o(0) <= DisableNIMOUT; end if;
			--debug
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_SelectedDebugInput_1) then 			u_data_o(8 downto 0) <= SelectedDebugInput(9*1-1 downto 9*0); end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_SelectedDebugInput_2) then 			u_data_o(8 downto 0) <= SelectedDebugInput(9*2-1 downto 9*1); end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_SelectedDebugInput_3) then 			u_data_o(8 downto 0) <= SelectedDebugInput(9*3-1 downto 9*2); end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_SelectedDebugInput_4) then 			u_data_o(8 downto 0) <= SelectedDebugInput(9*4-1 downto 9*3); end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_Debug_ActualState) then 				u_data_o(NDebugSignalOutputs-1 downto 0) <= Debug_ActualState; end if;

		end if;
	end process;

	---------------------------------------------------------------------------------------------------------	
	-- Code for VME handling / access
	-- decoder for data registers
	-- handle write commands from vmebus
	---------------------------------------------------------------------------------------------------------	
	process(clock50, ckcsr, u_ad_reg)
	begin
		if (clock50'event and clock50 ='1') then
			if (ckcsr='1' and u_ad_reg(11 downto 4)= BASE_TRIG_InputPatternMask_IN1 ) then InputPatternMask(32*0+31 downto 32*0+0) <= u_dat_in; end if;
			if (ckcsr='1' and u_ad_reg(11 downto 4)= BASE_TRIG_InputPatternMask_IN2 ) then InputPatternMask(32*1+31 downto 32*1+0) <= u_dat_in; end if;
			if (ckcsr='1' and u_ad_reg(11 downto 4)= BASE_TRIG_InputPatternMask_IN3 ) then InputPatternMask(32*2+31 downto 32*2+0) <= u_dat_in; end if;
			if (ckcsr='1' and u_ad_reg(11 downto 4)= BASE_TRIG_InputPatternMask_INOUT1 ) then InputPatternMask(32*3+31 downto 32*3+0) <= u_dat_in; end if;
			if (ckcsr='1' and u_ad_reg(11 downto 4)= BASE_TRIG_InputPatternMask_INOUT2 ) then InputPatternMask(32*4+31 downto 32*4+0) <= u_dat_in; end if;
			if (ckcsr='1' and u_ad_reg(11 downto 4)= BASE_TRIG_InputPatternMask_INOUT3 ) then InputPatternMask(32*5+31 downto 32*5+0) <= u_dat_in; end if;			
			if (ckcsr='1' and u_ad_reg(11 downto 4)= BASE_TRIG_DisableNIMOUT ) then	DisableNIMOUT <= u_dat_in(0); end if;
			--debug
			if ( (ckcsr = '1') and (u_ad_reg(11 downto 4) =  BASE_TRIG_SelectedDebugInput_1) ) then 			SelectedDebugInput(9*1-1 downto 9*0) <= u_dat_in(8 downto 0); end if;
			if ( (ckcsr = '1') and (u_ad_reg(11 downto 4) =  BASE_TRIG_SelectedDebugInput_2) ) then 			SelectedDebugInput(9*2-1 downto 9*1) <= u_dat_in(8 downto 0); end if;
			if ( (ckcsr = '1') and (u_ad_reg(11 downto 4) =  BASE_TRIG_SelectedDebugInput_3) ) then 			SelectedDebugInput(9*3-1 downto 9*2) <= u_dat_in(8 downto 0); end if;
			if ( (ckcsr = '1') and (u_ad_reg(11 downto 4) =  BASE_TRIG_SelectedDebugInput_4) ) then 			SelectedDebugInput(9*4-1 downto 9*3) <= u_dat_in(8 downto 0); end if;

		end if;
	end process;
	


end RTL;