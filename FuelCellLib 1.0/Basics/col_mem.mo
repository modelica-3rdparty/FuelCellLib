model col_mem
  parameter SI.Pressure P=0
    "Boundary condition of oxygen pressure in the anode side of membrane";
  parameter SI.Pressure PWG=100000
    "Boundary condition of steam water pressure in the anode side of membrane";
  parameter Units.Wload XS=0.0
    "Boundary condition of water load in the anode side of membrane";

  exac exa1 annotation (extent=[-10, 54; 116, -46]);
  annotation (Icon(
      Rectangle(extent=[16, 76; -34, -56], style(gradient=1, fillColor=7)),
      Polygon(points=[16, 42; 16, 54; 50, 54; 74, 42; 16, 42], style(
          color=1,
          gradient=1,
          fillColor=2)),
      Polygon(points=[-34, 76; -18, 84; 2, 84; 16, 76; -34, 76], style(
          color=1,
          gradient=1,
          fillColor=9)),
      Polygon(points=[-62, 42; -48, 50; -34, 50; -34, 42; -62, 42], style(
          color=1,
          gradient=1,
          fillColor=9)),
      Text(
        extent=[-58, -48; 52, -90],
        style(gradient=1, fillColor=7),
        string="Terminal MEM")), Documentation(info="<html>
<H2 align=center>col_mem-Terminal</H2>
<IMG SRC=FuelCellLib.Basics.col_memI.png WIDTH=100>
<br>
<H4>
The terminals  have two connectors, green connector allows to connect the layers of the cell and define the boundary conditions. The blue connector allows  to connect a standard electrical classes of Modelica.
<br><br>
Terminal_MEM defines the boundary conditions of the  membrane layer. In a electric circuit, the blue connector will be the negative pole.
<br><br>
<H3>Parameters</H3><P>
<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=2>
<TR><TH>Name</TH><TH>Default</TH><TH>Description</TH></TR>
<TR><TD>P</TD><TD>&nbsp;</TD><TD>Boundary condition of oxygen pressure in the anode side of membrane [Pa]</TD></TR>
<TR><TD>PWG</TD><TD>&nbsp;</TD><TD>Boundary condition of steam water pressure in the anode side of membrane [Pa]</TD></TR>
<TR><TD>XS</TD><TD>&nbsp;</TD><TD>Boundary condition of water load in the anode side of membrane [KgH2O/Kgsolid]</TD></TR>
</TABLE>
</H4>
<br><br>
<H3>References</H3><P><br>

Modelica Association, Modelica-A Unified Object-Oriented Languaje  for Physical System Modeling, Tutorial. http://www.modelica.org/.<br><br>
A.Urquia, S.Dormido, Mathematical and Computer Modelling of Dynamical Systems, vol.9, nº1, pp.65-90, (2002).<br><br>
K.J.Astrom, H.Elmqvist, S.E.Mattsson, Evolution of continous-time modeling and simulation, The 12th ESM´98, (1998).<br><br>
V.Gurau, H.Liu, S.Kakac,AIChE J.2000 46(10).<br><br>
D.M.Bernardi, M.W.Verbrugge, J. electrochem. Soc. 139,9 (1992).<br><br>
T.E.Springer, T.A.Zawodzinsky, J.Electrochem.Soc. 138 (1991).<br><br>
J. Larminie, A.Dicks, Fuel Cell System Explained, Wiley (2000).<br><br>
</HTML>"));
  terminal exa2 annotation (extent=[-88, -6; -6, 66]);
equation

  exa1.vs = exa2.v;

  exa1.p = P;
  exa1.pwg = PWG;
  exa1.vs = 0;
  //BOUNDARY CONDITION OF SOLID VOLTAGE
  exa1.Xs = XS;
  exa1.ve = 0;
  //BOUNDARY CONDITION OF ELECTROLYTE VOLTAGE

end col_mem;
