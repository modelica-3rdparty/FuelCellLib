model col_cat

  constant SI.FaradayConstant F=96485 "Faraday constant";
  constant Units.MolarGasConstant R=8.30824 "Molar gas constant";
  parameter SI.Pressure P=100000
    "Boundary condition of oxygen pressure in the cathode diffusor";
  parameter SI.Pressure PWG=100000
    "Boundary condition of steam water pressure in the cathode diffusor";
  parameter Units.Wload XS=0.00
    "Boundary condition of water load in the cathode diffusor";
  outer parameter SI.Temp_K T "Temperature of fuelcell";
  outer parameter SI.Voltage Eref
    "Theoretical thermodynamic open circuit voltage";
  outer parameter SI.Pressure pH2=100000 "Pressure of hydrogen in anode";

  outer SI.Voltage Eoc;
  //thermodynamic open circuit voltage

  exac exa1 annotation (extent=[-98, 56; 28, -44]);
  annotation (Icon(
      Rectangle(extent=[36, 80; -14, -52], style(gradient=1, fillColor=7)),
      Polygon(points=[-74, 44; -58, 56; -14, 56; -14, 44; -74, 44], style(
          color=1,
          gradient=1,
          fillColor=2)),
      Polygon(points=[-14, 80; 2, 88; 22, 88; 36, 80; -14, 80], style(
          color=1,
          gradient=1,
          fillColor=9)),
      Polygon(points=[36, 44; 36, 52; 46, 52; 62, 44; 36, 44], style(
          color=1,
          gradient=1,
          fillColor=9)),
      Text(
        extent=[-52, -42; 58, -84],
        style(gradient=1, fillColor=7),
        string="Terminal CAT")), Documentation(info="<html>

<b><H2 align=center>col_cat-Terminal</H2></b>
<IMG SRC=FuelCellLib.Basics.col_catI.png WIDTH=100>
<br>
<H4>
The terminals  have two connectors, green connector allows to connect the layers of the cell and define the boundary conditions. The blue connector allows  to connect a standard electrical classes of Modelica.
<br><br>
Terminal_CAT defines the boundary conditions of the cathode terminal. In a electric circuit, the blue connector will be the positive pole. Also in this class is defined the thermodynamic open circuit like as shown in following equation.
<br><br>

<H1 align=center><IMG SRC=col_cat.png WIDTH=250></H1><br>
<H3>Parameters</H3><P>
<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=2>
<TR><TH>Name</TH><TH>Default</TH><TH>Description</TH></TR>
<TR><TD>P</TD><TD>&nbsp;</TD><TD>Boundary condition of oxygen pressure in the cathode diffusor [Pa]</TD></TR>
<TR><TD>PWG</TD><TD>&nbsp;</TD><TD>Boundary condition of steam water pressure in the cathode diffusor [Pa]</TD></TR>
<TR><TD>XS</TD><TD>&nbsp;</TD><TD>Boundary condition of water load in the cathode diffusor [KgH2O/Kgsolid]</TD></TR>
<TR><TD>T</TD><TD>&nbsp;</TD><TD>Temperature of fuelcell [K]</TD></TR>
<TR><TD>Eref</TD><TD>&nbsp;</TD><TD>Theoretical thermodynamic open circuit voltage [V]</TD></TR>
<TR><TD>pH2</TD><TD>100000</TD><TD>Pressure of hydrogen in anode [Pa]</TD></TR>
</TABLE>
</H4>
<br><br>
<H3>References</H3><P><br>

Modelica Association, Modelica-A Unified Object-Oriented Languaje  for Physical System Modeling, Tutorial. http://www.modelica.org/.<br><br>
A.Urquia, S.Dormido, Mathematical and Computer Modelling of Dynamical Systems, vol.9, nº1, pp.65-90, (2002).<br><br>
K.J.Astrom, H.Elmqvist, S.E.Mattsson, Evolution of continous-time modeling and simulation, The 12th ESM´98, (1998).<br><br>
D.M.Bernardi, M.W.Verbrugge, J. electrochem. Soc. 139,9 (1992).<br><br>
T.E.Springer, T.A.Zawodzinsky, J.Electrochem.Soc. 138 (1991).<br><br>
J. Larminie, A.Dicks, Fuel Cell System Explained, Wiley (2000).<br><br>

</HTML>"));
  terminal exa2 annotation (extent=[10, -14; 90, 72]);
equation

  exa1.vs = exa2.v;
  exa1.je = exa2.i;

  exa1.p = P;
  exa1.pwg = PWG;
  exa1.Xs = XS;

  //***********************OPEN CIRCUIT VOLTAGE DEFINITION
  //Eoc = Eref;
  //No temperature dependence and pressure
  //of reactants in open circuit voltage

  Eoc = Eref - (0.9e-3*(T - 298)) + (R*T/(2*F))*ln((pH2/100000)*((exa1.p/100000
    )^(0.5))/(exa1.pwg/100000));
  //Temperature and pressure of reactants
  //effect in  thermodynamic open circuit voltage
  //(D.M.Benardi, M.W.Verbrugge, J.Electrochem.Soc.139(9),1992

  //*******************************************************

  exa1.vs = Eoc + exa1.ve;

end col_cat;
