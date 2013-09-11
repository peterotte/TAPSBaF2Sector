<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_7">
            <attr value="TRUE" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
        </signal>
        <signal name="Delay_IN" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_21" />
        <signal name="XLXN_23">
            <attr value="TRUE" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
        </signal>
        <signal name="XLXN_25">
            <attr value="TRUE" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
        </signal>
        <signal name="XLXN_27">
            <attr value="TRUE" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
        </signal>
        <signal name="XLXN_29">
            <attr value="TRUE" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
        </signal>
        <signal name="XLXN_31">
            <attr value="TRUE" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
        </signal>
        <signal name="XLXN_32">
            <attr value="TRUE" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
        </signal>
        <signal name="XLXN_33">
            <attr value="TRUE" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
        </signal>
        <signal name="XLXN_47">
            <attr value="TRUE" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
        </signal>
        <signal name="XLXN_48">
            <attr value="TRUE" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
        </signal>
        <signal name="XLXN_49">
            <attr value="TRUE" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
        </signal>
        <signal name="XLXN_50">
            <attr value="TRUE" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
        </signal>
        <signal name="XLXN_58" />
        <signal name="XLXN_59" />
        <signal name="XLXN_60" />
        <signal name="XLXN_61" />
        <signal name="XLXN_62" />
        <signal name="XLXN_63" />
        <signal name="XLXN_64" />
        <signal name="XLXN_66" />
        <signal name="XLXN_67" />
        <signal name="Delay_Out" />
        <port polarity="Input" name="Delay_IN" />
        <port polarity="Output" name="Delay_Out" />
        <blockdef name="lut1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <rect width="256" x="64" y="-384" height="320" />
        </blockdef>
        <block symbolname="lut1" name="XLXI_8">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X0Y0" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="Delay_IN" name="I0" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
        <block symbolname="lut1" name="XLXI_9">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X0Y254" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_7" name="I0" />
            <blockpin signalname="XLXN_23" name="O" />
        </block>
        <block symbolname="lut1" name="XLXI_10">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X0Y0" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_23" name="I0" />
            <blockpin signalname="XLXN_25" name="O" />
        </block>
        <block symbolname="lut1" name="XLXI_11">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X0Y254" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_25" name="I0" />
            <blockpin signalname="XLXN_27" name="O" />
        </block>
        <block symbolname="lut1" name="XLXI_12">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X0Y1" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_27" name="I0" />
            <blockpin signalname="XLXN_29" name="O" />
        </block>
        <block symbolname="lut1" name="XLXI_13">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X0Y255" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_29" name="I0" />
            <blockpin signalname="XLXN_31" name="O" />
        </block>
        <block symbolname="lut1" name="XLXI_14">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X0Y1" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_31" name="I0" />
            <blockpin signalname="XLXN_32" name="O" />
        </block>
        <block symbolname="lut1" name="XLXI_15">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X0Y255" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_32" name="I0" />
            <blockpin signalname="XLXN_33" name="O" />
        </block>
        <block symbolname="lut1" name="XLXI_16">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X1Y0" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_33" name="I0" />
            <blockpin signalname="XLXN_47" name="O" />
        </block>
        <block symbolname="lut1" name="XLXI_17">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X1Y254" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_47" name="I0" />
            <blockpin signalname="XLXN_48" name="O" />
        </block>
        <block symbolname="lut1" name="XLXI_18">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X1Y0" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_48" name="I0" />
            <blockpin signalname="XLXN_49" name="O" />
        </block>
        <block symbolname="lut1" name="XLXI_19">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X1Y254" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_49" name="I0" />
            <blockpin signalname="XLXN_50" name="O" />
        </block>
        <block symbolname="lut1" name="XLXI_20">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X1Y1" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_50" name="I0" />
            <blockpin signalname="XLXN_58" name="O" />
        </block>
        <block symbolname="lut1" name="XLXI_21">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X1Y255" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_58" name="I0" />
            <blockpin signalname="XLXN_59" name="O" />
        </block>
        <block symbolname="lut1" name="XLXI_22">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X1Y1" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_59" name="I0" />
            <blockpin signalname="XLXN_60" name="O" />
        </block>
        <block symbolname="lut1" name="XLXI_23">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X1Y255" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_60" name="I0" />
            <blockpin signalname="XLXN_61" name="O" />
        </block>
        <block symbolname="lut1" name="XLXI_24">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X2Y0" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_61" name="I0" />
            <blockpin signalname="XLXN_62" name="O" />
        </block>
        <block symbolname="lut1" name="XLXI_25">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X2Y254" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_62" name="I0" />
            <blockpin signalname="XLXN_63" name="O" />
        </block>
        <block symbolname="lut1" name="XLXI_26">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X2Y0" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_63" name="I0" />
            <blockpin signalname="XLXN_64" name="O" />
        </block>
        <block symbolname="lut1" name="XLXI_27">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X2Y254" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_64" name="I0" />
            <blockpin signalname="XLXN_66" name="O" />
        </block>
        <block symbolname="lut1" name="XLXI_28">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X2Y1" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_66" name="I0" />
            <blockpin signalname="XLXN_67" name="O" />
        </block>
        <block symbolname="lut1" name="XLXI_29">
            <attr value="2" name="INIT">
                <trait editname="all:1 sch:0" />
                <trait edittrait="all:1 sch:0" />
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="BitVector 2 h" />
            </attr>
            <attr value="SLICE_X2Y255" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="true" name="KEEP">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
                <trait valuetype="Boolean" />
            </attr>
            <blockpin signalname="XLXN_67" name="I0" />
            <blockpin signalname="Delay_Out" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <branch name="Delay_IN">
            <wire x2="192" y1="1168" y2="1168" x1="176" />
        </branch>
        <iomarker fontsize="28" x="176" y="1168" name="Delay_IN" orien="R180" />
        <instance x="192" y="1296" name="XLXI_8" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <instance x="2672" y="1296" name="XLXI_14" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <branch name="XLXN_31">
            <wire x2="2656" y1="272" y2="272" x1="2624" />
            <wire x2="2656" y1="272" y2="1168" x1="2656" />
            <wire x2="2672" y1="1168" y2="1168" x1="2656" />
        </branch>
        <instance x="2240" y="464" name="XLXI_13" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <branch name="XLXN_29">
            <wire x2="2224" y1="1104" y2="1104" x1="2192" />
            <wire x2="2240" y1="336" y2="336" x1="2224" />
            <wire x2="2224" y1="336" y2="1104" x1="2224" />
        </branch>
        <instance x="1808" y="1296" name="XLXI_12" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <branch name="XLXN_27">
            <wire x2="1792" y1="272" y2="272" x1="1760" />
            <wire x2="1792" y1="272" y2="1168" x1="1792" />
            <wire x2="1808" y1="1168" y2="1168" x1="1792" />
        </branch>
        <instance x="1376" y="464" name="XLXI_11" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <branch name="XLXN_25">
            <wire x2="1360" y1="1104" y2="1104" x1="1312" />
            <wire x2="1376" y1="336" y2="336" x1="1360" />
            <wire x2="1360" y1="336" y2="1104" x1="1360" />
        </branch>
        <instance x="928" y="1296" name="XLXI_10" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <branch name="XLXN_23">
            <wire x2="912" y1="272" y2="272" x1="896" />
            <wire x2="912" y1="272" y2="1168" x1="912" />
            <wire x2="928" y1="1168" y2="1168" x1="912" />
        </branch>
        <instance x="512" y="464" name="XLXI_9" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <branch name="XLXN_7">
            <wire x2="512" y1="336" y2="336" x1="448" />
            <wire x2="448" y1="336" y2="464" x1="448" />
            <wire x2="592" y1="464" y2="464" x1="448" />
            <wire x2="592" y1="464" y2="1104" x1="592" />
            <wire x2="592" y1="1104" y2="1104" x1="576" />
        </branch>
        <instance x="3120" y="448" name="XLXI_15" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <branch name="XLXN_32">
            <wire x2="3072" y1="1104" y2="1104" x1="3056" />
            <wire x2="3120" y1="320" y2="320" x1="3072" />
            <wire x2="3072" y1="320" y2="1104" x1="3072" />
        </branch>
        <instance x="3584" y="1296" name="XLXI_16" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <branch name="XLXN_33">
            <wire x2="3520" y1="256" y2="256" x1="3504" />
            <wire x2="3520" y1="256" y2="1168" x1="3520" />
            <wire x2="3584" y1="1168" y2="1168" x1="3520" />
        </branch>
        <instance x="4000" y="432" name="XLXI_17" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <branch name="XLXN_47">
            <wire x2="3984" y1="1104" y2="1104" x1="3968" />
            <wire x2="4000" y1="304" y2="304" x1="3984" />
            <wire x2="3984" y1="304" y2="1104" x1="3984" />
        </branch>
        <instance x="4368" y="1328" name="XLXI_18" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <branch name="XLXN_48">
            <wire x2="4304" y1="880" y2="1200" x1="4304" />
            <wire x2="4368" y1="1200" y2="1200" x1="4304" />
            <wire x2="4400" y1="880" y2="880" x1="4304" />
            <wire x2="4400" y1="240" y2="240" x1="4384" />
            <wire x2="4400" y1="240" y2="880" x1="4400" />
        </branch>
        <instance x="4816" y="432" name="XLXI_19" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <branch name="XLXN_49">
            <wire x2="4768" y1="1136" y2="1136" x1="4752" />
            <wire x2="4816" y1="304" y2="304" x1="4768" />
            <wire x2="4768" y1="304" y2="1136" x1="4768" />
        </branch>
        <instance x="432" y="2976" name="XLXI_20" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <branch name="XLXN_50">
            <wire x2="432" y1="2848" y2="2848" x1="368" />
            <wire x2="368" y1="2848" y2="2976" x1="368" />
            <wire x2="5216" y1="2976" y2="2976" x1="368" />
            <wire x2="5216" y1="240" y2="240" x1="5200" />
            <wire x2="5216" y1="240" y2="2976" x1="5216" />
        </branch>
        <instance x="976" y="2000" name="XLXI_21" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <instance x="1424" y="2976" name="XLXI_22" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <instance x="1888" y="1984" name="XLXI_23" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <instance x="2400" y="2976" name="XLXI_24" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <instance x="2896" y="2000" name="XLXI_25" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <instance x="3440" y="2960" name="XLXI_26" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <instance x="3888" y="2032" name="XLXI_27" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <branch name="XLXN_58">
            <wire x2="896" y1="2784" y2="2784" x1="816" />
            <wire x2="896" y1="1872" y2="2784" x1="896" />
            <wire x2="976" y1="1872" y2="1872" x1="896" />
        </branch>
        <branch name="XLXN_59">
            <wire x2="1392" y1="1808" y2="1808" x1="1360" />
            <wire x2="1392" y1="1808" y2="2848" x1="1392" />
            <wire x2="1424" y1="2848" y2="2848" x1="1392" />
        </branch>
        <branch name="XLXN_60">
            <wire x2="1840" y1="2784" y2="2784" x1="1808" />
            <wire x2="1840" y1="1856" y2="2784" x1="1840" />
            <wire x2="1888" y1="1856" y2="1856" x1="1840" />
        </branch>
        <branch name="XLXN_61">
            <wire x2="2336" y1="1792" y2="1792" x1="2272" />
            <wire x2="2336" y1="1792" y2="2848" x1="2336" />
            <wire x2="2400" y1="2848" y2="2848" x1="2336" />
        </branch>
        <branch name="XLXN_62">
            <wire x2="2832" y1="2784" y2="2784" x1="2784" />
            <wire x2="2832" y1="1872" y2="2784" x1="2832" />
            <wire x2="2896" y1="1872" y2="1872" x1="2832" />
        </branch>
        <branch name="XLXN_63">
            <wire x2="3360" y1="1808" y2="1808" x1="3280" />
            <wire x2="3360" y1="1808" y2="2832" x1="3360" />
            <wire x2="3440" y1="2832" y2="2832" x1="3360" />
        </branch>
        <branch name="XLXN_64">
            <wire x2="3856" y1="2768" y2="2768" x1="3824" />
            <wire x2="3856" y1="1904" y2="2768" x1="3856" />
            <wire x2="3888" y1="1904" y2="1904" x1="3856" />
        </branch>
        <instance x="4288" y="2912" name="XLXI_28" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <instance x="4736" y="2112" name="XLXI_29" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="INIT" x="0" y="-476" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="LOC" x="48" y="-428" type="instance" />
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="KEEP" x="96" y="-380" type="instance" />
        </instance>
        <branch name="XLXN_66">
            <wire x2="4352" y1="2032" y2="2032" x1="4224" />
            <wire x2="4224" y1="2032" y2="2784" x1="4224" />
            <wire x2="4288" y1="2784" y2="2784" x1="4224" />
            <wire x2="4352" y1="1840" y2="1840" x1="4272" />
            <wire x2="4352" y1="1840" y2="2032" x1="4352" />
        </branch>
        <branch name="XLXN_67">
            <wire x2="4704" y1="2720" y2="2720" x1="4672" />
            <wire x2="4704" y1="1984" y2="2720" x1="4704" />
            <wire x2="4736" y1="1984" y2="1984" x1="4704" />
        </branch>
        <branch name="Delay_Out">
            <wire x2="5152" y1="1920" y2="1920" x1="5120" />
        </branch>
        <iomarker fontsize="28" x="5152" y="1920" name="Delay_Out" orien="R0" />
    </sheet>
</drawing>