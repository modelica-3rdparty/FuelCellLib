model FC2Layer

  inner parameter SI.Temp_K T=340 "Operation temperature of the FC";
  constant Units.MolarGasConstant R=8.30824 "Molar gas constant";
  constant SI.MolarMass massh2o=18e-3 "Molar mass of water";
  constant SI.FaradayConstant F=96485 "Faraday constant";

  inner SI.Voltage Eoc "Open circuit voltage";
  SI.Current Jecm "Current density (A/cm2)";
  inner parameter SI.Voltage Eref=1.1
    "Theorical thermodynamic open circuit voltage";
  inner parameter SI.Pressure pH2=100000 "Hydrogen pressure in anode";

  Layer1D.act_layer act_layer1 annotation (extent=[2, 40; 22, 60]);
  Layer1D.mem_layer mem_layer1 annotation (extent=[-42, 40; -22, 60]);
  Basics.col_cat col_cat1 annotation (extent=[30, 42; 50, 62], rotation=0);
  Basics.col_mem col_mem1 annotation (extent=[-62, 42; -42, 62]);
  elec.Resistor RL1(R=0.0005) annotation (extent=[-16, 74; 4, 94]);
equation

  connect(mem_layer1.tp_mem2.exa2, act_layer1.tp_act1.exa1);
  connect(mem_layer1.tp_mem1.exa1, col_mem1.exa1);
  connect(act_layer1.tp_act2.exa2, col_cat1.exa1);

  Jecm = col_cat1.exa1.je/1e4;

  annotation (
    Diagram(
      Line(points=[22, 52; 36, 52]),
      Line(points=[-24, 50; 4, 50]),
      Line(points=[-46, 52; -40, 52])),
    Icon(
      Rectangle(extent=[-34, 36; 4, -16], style(color=0, gradient=1)),
      Rectangle(extent=[4, 36; 40, -16], style(
          color=0,
          gradient=1,
          fillColor=1)),
      Rectangle(extent=[-32, 62; -66, -42], style(
          color=0,
          gradient=1,
          fillColor=0)),
      Rectangle(extent=[74, 62; 40, -42], style(
          color=0,
          gradient=1,
          fillColor=0))),
    Documentation(info="<html>

<H2 align=center>FC2Layer-Casestudies</H2>
<IMG SRC=FuelCellLib.casestudies.FC2LayerD.png WIDTH=100>
<br><br><br>
<H4>
This case study is formed by two layers fuel cell,  Membrane layer and active layer, ( \"act_layer\" and \"mem_layer\" in \"Layers1D\" package), the terminals (\"col_cat\" and \"col_mem\" in \"Basics\" package) and a constant standard Modelica resistance.<br><br>
The value of  standard Modelica resistance could be defined for a  \"pol_curve_FC2.mos\" to simulate a polarization curve.<br>
Before to simulate the polarization curve is necessary to translate the FuelCellLib.casestudies.FC2Layer.<br>
The results  are on a \"polarization\" archives in the \"casestudies\" folder. The resistance can be substituted  by another electric load as standard Modelica class or one of  \"Basic\"--->\"Loads\" classes for a dynamic studies of the FC2Layer.<br><br>
On FC2Layer is necessary to define two main parameters:<br>
\"Eref\": Theorical thermodynamic open circuit voltage and<br>
\"pH2\": Hydrogen pressure in anode, to define the electro-chenical  thermodynamic open circuit (see col_cat class).
</H4>
<H3>Parameters</H3><P>
<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=2>
<TR><TH>Name</TH><TH>Default</TH><TH>Description</TH></TR>
<TR><TD>T</TD><TD>340</TD><TD>Operation temperature of the FC [K]</TD></TR>
<TR><TD>Eref</TD><TD>1.1</TD><TD>Theorical thermodynamic open circuit voltage [V]</TD></TR>
<TR><TD>pH2</TD><TD>100000</TD><TD>Hydrogen pressure in anode [Pa]</TD></TR>
</TABLE>

<br><br>
<H3>References</H3><P><br>

Modelica Association, Modelica-A Unified Object-Oriented Languaje  for Physical System Modeling, Tutorial. http://www.modelica.org/.<br><br>
A.Urquia, S.Dormido, Mathematical and Computer Modelling of Dynamical Systems, vol.9, nº1, pp.65-90, (2002).<br><br>
K.J.Astrom, H.Elmqvist, S.E.Mattsson, Evolution of continous-time modeling and simulation, The 12th ESM´98, (1998).<br><br>
M.Ceraolo, C.Miulli, A.Pozio, Modeling static and dynamic behaviour of PEMFC on the basis of electro-chemical description, J. Power Sources 113 (2003).<br><br>
A.Kumar, R.Reddy, Effect of channel dimensions and shapes in the flow-field distributor on performance of PEMFC, J. Power Sources 113 (2003).<br><br>
W.D.Steinmann, P.Treffinger, Simulation of Fuel Cell Powered Drive Trains, Modelica WorkShop 2000 Procedings.<br><br>
D.Bevers, M.Wöhr, K.Yasuda, K.Oguro, Simulation of polymer electrolyte fuel cell electrode.J.Appl.  Electrochem.27 (1997).<br><br>
K.Broka, P.Ekdunge, Modelling the PEM fuel cell cathode,  J.Appl.  Electrochem.27 (1997).<br><br>
J.Larminie, A.Dicks, Fuel Cell Systems Explained, Wiley 2000.<br><br>
A.A.Kulikovsky, Fuel Cells 2001,1(2).<br><br>
V.Gurau, H.Liu, S.Kakac,AIChE J.2000 46(10).<br><br>
D.M.Bernardi, M.W.Verbrugge, J. electrochem. Soc. 139,9 (1992).<br><br>
T.E.Springer, T.A.Zawodzinsky, J.Electrochem.Soc. 138 (1991).<br><br>
S.Dutta, S.Shimpalee, J.Appl.Electrochem. (2000), 30(2).<br><br>
D.B.Genevey, Thesis, F.V.P.I. (2001).<br><br>
J. Larminie, A.Dicks, Fuel Cell System Explained, Wiley (2000).<br><br>

</html>"));

  connect(col_mem1.exa2, RL1.p) annotation (points=[-58, 56; -58, 84; -16, 84])
    ;
  connect(RL1.n, col_cat1.exa2) annotation (points=[4, 84; 44, 84; 44, 54],
      style(color=3));
end FC2Layer;
