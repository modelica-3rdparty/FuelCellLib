model FC3Layer

  inner parameter SI.Temp_K T=340 "Operation temperature of the FC";
  constant Units.MolarGasConstant R=8.30824 "Molar gas constant";
  constant SI.MolarMass massh2o=18e-3 "Molar mass of water";
  constant SI.FaradayConstant F=96485 "Faraday constant";

  inner SI.Voltage Eoc "Open circuit voltage";
  SI.Current Jecm "Current density (A/cm2)";
  inner parameter SI.Voltage Eref=1.1
    "Theorical thermodynamic open circuit voltage";
  inner parameter SI.Pressure pH2=100000 "Hydrogen pressure in anode";

  Layer1D.mem_layer mem_layer1 annotation (extent=[-60, 6; -40, 26]);
  Layer1D.act_layer act_layer1 annotation (extent=[-22, 8; -2, 28]);
  Layer1D.dif_layer dif_layer1 annotation (extent=[12, 6; 32, 26]);
  Basics.col_cat col_cat1 annotation (extent=[40, 8; 60, 28]);
  Basics.col_mem col_mem1 annotation (extent=[-90, 6; -70, 26]);
  elec.Resistor RL1(R=0.001) annotation (extent=[-30, 40; -10, 60]);
equation

  connect(col_mem1.exa1, mem_layer1.tp_mem1.exa1);
  connect(mem_layer1.tp_mem2.exa2, act_layer1.tp_act1.exa1);
  connect(act_layer1.tp_act2.exa2, dif_layer1.tp_dif1.exa1);
  connect(dif_layer1.tp_dif2.exa2, col_cat1.exa1);

  Jecm = col_cat1.exa1.je/1e4;
  annotation (
    Diagram(
      Line(points=[-74, 18; -58, 18]),
      Line(points=[-42, 18; -20, 18]),
      Line(points=[-2, 18; 14, 18]),
      Line(points=[30, 18; 44, 18])),
    Icon(
      Rectangle(extent=[-54, 38; -16, -14], style(color=0, gradient=1)),
      Rectangle(extent=[-16, 38; 20, -14], style(
          color=0,
          gradient=1,
          fillColor=1)),
      Rectangle(extent=[20, 38; 54, -14], style(
          color=0,
          gradient=1,
          fillColor=6)),
      Rectangle(extent=[-52, 64; -86, -40], style(
          color=0,
          gradient=1,
          fillColor=0)),
      Rectangle(extent=[86, 64; 52, -40], style(
          color=0,
          gradient=1,
          fillColor=0))),
    Documentation(info="<html>

<H2 align=center>FC3Layer-Casestudies</H2>
<IMG SRC=FuelCellLib.casestudies.FC3LayerD.png WIDTH=100>
<br><br><br>
<H4>
This case study is formed by three layers fuel  cell, Membrane layer, active layer and diffusion  layer (\"mem_layer\", \"act_layer\"and \"dif_layer\" in  \"Layers1D\" package), the terminals (\"col_cat\" and \"col_mem\" in  \"Basics\" package) and a constant standard Modelica resistance.<br><br>
The value of the standard Modelica resistance can be defined for  a \"pol_curve_FC3.mos\" to simulate a polarization curve.<br>
Before to simulate the polarization curve is necessary to translate the FuelCellLib.casestudies.FC3Layer.<br>
The  results are on a polarization\" archive in the \"casestudies\" folder. The resistance can be substituted by another electric load as a  standard Modelica class or one of \"Basic\" ---> \"Loads\" classes for  a dynamic study of the FC3Layer.<br><br>
On FC3Layer is necessary to define two main parameters:<br>
\"Eref\": Theorical thermodynamic open circuit voltage and<br>
\"pH2\": Hydrogen pressure in anode, to define the electro-chemical  thermodynamic open circuit (see col_cat class).
<H3>Parameters</H3><P>
<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=2>
<TR><TH>Name</TH><TH>Default</TH><TH>Description</TH></TR>
<TR><TD>T</TD><TD>340</TD><TD>Operation temperature of the FC [K]</TD></TR>
<TR><TD>Eref</TD><TD>1.1</TD><TD>Theorical thermodynamic open circuit voltage [V]</TD></TR>
<TR><TD>pH2</TD><TD>100000</TD><TD>Hydrogen pressure in anode [Pa]</TD></TR>
</TABLE>
</H4>
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
  connect(RL1.p, col_mem1.exa2) annotation (points=[-30, 50; -84, 50; -84, 20]
      , style(color=3));
  connect(RL1.n, col_cat1.exa2) annotation (points=[-10, 50; 54, 50; 54, 20],
      style(color=3));
end FC3Layer;
