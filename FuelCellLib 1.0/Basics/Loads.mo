package Loads

  model PRB_Load

    extends inter.OnePort;
    SI.Resistance R(start=1);
    parameter SI.Resistance HighVal=1 "High Value Resistance";
    parameter SI.Resistance LowVal=0.01 "Low Value Resistance";
    parameter SI.Time Period=10 "Maximum period of oscillation";

    Real sig;
    Real tevent;

    annotation (
      Documentation(info="
<HTML>
<H2 align=center>PRB_Load-Load</H2>
<IMG SRC=FuelCellLib.Basics.Loads.PRB_LoadI.png WIDTH=100>
<br>
<H4>
LOADS is a package of fuel cell´s loads related to the  fuel cell structure.  These are designed to allow a dynamic  simulation of Fuel Cell.
<br>
<br>
PRB_Load is  psuedo-ramdom-binary signal of electric load class. This is a variable load  which will oscillate between two values of load, \"HighVal\" and \"LowVal\". The period of the jumps  is ramdom along the time. The maximum period  of oscillation, \"Period\" is defined by the user.<br><br>
<H3>Parameters</H3><P>
<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=2>
<TR><TH>Name</TH><TH>Default</TH><TH>Description</TH></TR>
<TR><TD>HighVal</TD><TD>1</TD><TD>High Value Resistance [Ohm]</TD></TR>
<TR><TD>LowVal</TD><TD>0.01</TD><TD>Low Value Resistance [Ohm]</TD></TR>
<TR><TD>Period</TD><TD>10</TD><TD>Maximum period of oscillation [s]</TD></TR>
</TABLE>
</H4>

<br><br>
<H3>References</H3><P><br>

Modelica Association, Modelica-A Unified Object-Oriented Languaje  for Physical System Modeling, Tutorial. http://www.modelica.org/.<br><br>
A.Urquia, S.Dormido, Mathematical and Computer Modelling of Dynamical Systems, vol.9, nº1, pp.65-90, (2002).<br><br>
K.J.Astrom, H.Elmqvist, S.E.Mattsson, Evolution of continous-time modeling and simulation, The 12th ESM´98, (1998).<br><br>


</HTML>
"),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Icon(
        Rectangle(extent=[-70, 30; 70, -30], style(
            color=3,
            fillColor=7,
            fillPattern=1)),
        Line(points=[-90, 0; -70, 0]),
        Line(points=[70, 0; 90, 0]),
        Text(extent=[-100, 40; 100, 100], string="%name"),
        Line(points=[-62, -50; -44, -50], style(color=0)),
        Line(points=[-44, -50; -44, 46; -18, 46; -18, -50; -10, -50; -10, 46; 0
              , 46; 0, -50; 42, -50; 42, 46; 64, 46; 64, -50; 72, -50], style(
              color=0))),
      Diagram(
        Rectangle(extent=[-70, 30; 70, -30]),
        Line(points=[-90, 0; -70, 0]),
        Line(points=[70, 0; 90, 0])),
      Window(
        x=0.2,
        y=0.06,
        width=0.62,
        height=0.69));
  equation

    //The value of resistance will oscillate aleatorily between
    //"HighVal" and "LowVal" with a maximum period of "Period"

    when time > pre(tevent) then
      sig = 1 - pre(sig);
      tevent = time + (RandomUniform(time))/Period;
      R = ((HighVal - LowVal)*sig) + LowVal;
    end when;

    R*i = v;

  end PRB_Load;

  model Step_Load

    extends inter.OnePort;
    SI.Resistance R(start=LowVal);
    parameter SI.Resistance HighVal=1 "High Value Resistance";
    parameter SI.Resistance LowVal=0.01 "Low Value Resistance";
    parameter SI.Time StepT=0.1 "Step time";

    annotation (
      Documentation(info="
<HTML>
<H2 align=center>Step_Load-Load</H2>
<IMG SRC=FuelCellLib.Basics.Loads.Step_LoadI.png WIDTH=100>
<br>
<H4>
LOADS is a package of fuel cell´s loads related to the  fuel cell structure.  These are designed to allow a dynamic  simulation of Fuel Cell.
<br>
<br>
Step_Load is  a step signal of electric load class. In this class are defined three parameters:  start of the value of load,  last value of load ,\"LowVal\" and \"HighVal\" and time to step, \"StepT\".
<br><br>
<H3>Parameters</H3><P>
<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=2>
<TR><TH>Name</TH><TH>Default</TH><TH>Description</TH></TR>
<TR><TD>HighVal</TD><TD>1</TD><TD>High Value Resistance [Ohm]</TD></TR>
<TR><TD>LowVal</TD><TD>0.01</TD><TD>Low Value Resistance [Ohm]</TD></TR>
<TR><TD>StepT</TD><TD>0.1</TD><TD>Step time [s]</TD></TR>
</TABLE>
</H4>
<br><br>
<H3>References</H3><P><br>

Modelica Association, Modelica-A Unified Object-Oriented Languaje  for Physical System Modeling, Tutorial. http://www.modelica.org/.<br><br>
A.Urquia, S.Dormido, Mathematical and Computer Modelling of Dynamical Systems, vol.9, nº1, pp.65-90, (2002).<br><br>
K.J.Astrom, H.Elmqvist, S.E.Mattsson, Evolution of continous-time modeling and simulation, The 12th ESM´98, (1998).<br><br>

</HTML>
"),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Icon(
        Rectangle(extent=[-70, 30; 70, -30], style(
            color=3,
            fillColor=7,
            fillPattern=1)),
        Line(points=[-90, 0; -70, 0]),
        Line(points=[70, 0; 90, 0]),
        Text(extent=[-100, 40; 100, 100], string="%name"),
        Line(points=[-50, -44; -6, -44; -6, 42; 54, 42], style(color=0,
              thickness=2))),
      Diagram(
        Rectangle(extent=[-70, 30; 70, -30]),
        Line(points=[-90, 0; -70, 0]),
        Line(points=[70, 0; 90, 0])),
      Window(
        x=0.2,
        y=0.06,
        width=0.62,
        height=0.69));
  equation

    //The value of resistance will step from "LowVal" to "HighVal"

    when time > StepT then
      R = HighVal;
    end when;

    R*i = v;

  end Step_Load;
end Loads;
