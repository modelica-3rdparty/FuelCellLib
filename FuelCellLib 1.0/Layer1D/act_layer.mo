model act_layer

  inner parameter SI.Temp_K T=340 "Operation temperature of active layer";
  inner parameter Units.alfav av=1e-9 "Specific condensation surface";
  inner parameter Units.beta b=0.001 "Material transfer coeficient";
  inner parameter Units.volpore Es=0.7 "Volumetric fraction of solid";
  inner parameter Units.volpore Ee=0.2 "Volumetric fraction of electrolyte";
  inner parameter SI.Capacitance cdl=1 "Electrical capacity of double layer";
  inner parameter SI.Length da=1e-6 "Thickness of transport phenomena";
  inner parameter Units.factor tau=5 "Tortuosity";
  inner parameter SI.DiffusionCoefficient Dwl=3.5e-9
    "Surface diffusion coefficient of H2O, liquid phase";
  inner parameter SI.Conductivity ks=1e6 "Electrical conducivity of the solid";
  inner parameter SI.Conductivity kpo=10
    "Constant protonic conducivity of the electrolyte";
  inner parameter SI.Pressure posat=3169 "Reference Saturation pressure";
  inner parameter SI.Temp_K Tosat=298.16 "Reference Saturation temperature";
  inner parameter SI.Density rom=2000 "Density of the electrolyte";
  inner parameter SI.Density ros=4000 "Density of the solid";
  inner parameter SI.MolarMass Mm=1.1 "Molar mass of the electrolyte";
  inner parameter SI.Density roh2ol=972 "Density of water";
  inner parameter Units.Aio Aioref=1.28
    "Catalyst area and reference exchange current density";
  inner parameter SI.Pressure poa=100000
    "Reference pressure for the current limit";
  inner parameter Units.TafelSlope B=0.150 "Tafel slope";
  inner parameter SI.Current jlim=2.40e3 "Limit current";
  inner parameter SI.DiffusionCoefficient D1co=0.007853e-4
    "Constant Knudsen diffusion coefficient for oxygen";
  //V.Gurau, H.Liu, S.Kakac,AIChE J.2000 46(10)
  inner parameter SI.DiffusionCoefficient D2co=0.01047e-4
    "Constant Knudsen diffusion coefficient for steam water";
  //V.Gurau, H.Liu, S.Kakac,AIChE J.2000 46(10)
  inner parameter SI.Length rp=1e-10 "Pore size of porous media";
  inner parameter SI.DiffusionCoefficient D12o=0.282e-4
    "Constant binary diffusion coefficient";
  //A.A.Kulikovsky, Fuel Cells 2001,1(2)
  inner parameter SI.Pressure pAref=100000
    "Reference pressure to measure the binary diffusion coefficient";
  //A.A.Kulikovsky, Fuel Cells 2001,1(2)
  inner parameter SI.Temp_K Tref=308.1
    "Reference temperature to measure the binary diffusion coefficient";
  //A.A.Kulikovsky, Fuel Cells 2001,1(2)

  //Model Hypothesis**************************
  inner parameter Units.factor ModHyp1=0
    "Psuedocapacitance dependence(0:Off,1:On)";
  inner parameter Units.factor ModHyp2=0
    "Knudsen diffusion pore size dependence(0:Off,1:On)";
  inner parameter Units.factor ModHyp3=0
    "Electro-Osmotic drag effect(0:Off,1:On)";
  inner parameter Units.factor ModHyp4=0
    "Electrolyte conductivity dependence(0:Off,1:On)";
  //******************************************

  parameter Integer n=10 "Number of finite elements for active layer";
  Layer1D.mv_act c[n];

  Basics.tp_act_mid tp_act1 annotation (extent=[-70, 2; -50, 22]);
  Basics.tp_act_mid tp_act2 annotation (extent=[46, 0; 66, 20]);
  Basics.vc_act vc_act1 annotation (extent=[38, 20; 58, 40]);
  Basics.vc_act vc_act2 annotation (extent=[-78, 20; -58, 40]);
equation

  for i in 1:n - 1 loop
    connect(c[i].tp_act1.exa2, c[i + 1].tp_act1.exa1);
  end for;

  connect(tp_act1.exa2, c[1].tp_act1.exa1);
  connect(c[n].tp_act1.exa2, tp_act2.exa1);
  annotation (
    Diagram(
      Rectangle(extent=[-38, 22; 40, 2], style(gradient=2, fillColor=1)),
      Line(points=[40, 12; 48, 12]),
      Text(extent=[-24, 30; 30, 22], string="n*finite volumes"),
      Line(points=[-58, 14; -38, 14], style(fillColor=1, fillPattern=1))),
    Icon(
      Rectangle(extent=[-100, -64; 100, 56], style(fillColor=68)),
      Rectangle(extent=[-98, 46; -66, -56], style(gradient=2, fillColor=1)),
      Ellipse(extent=[38, 0; 42, -4], style(gradient=2, fillColor=1)),
      Ellipse(extent=[48, 0; 52, -4], style(gradient=2, fillColor=1)),
      Ellipse(extent=[58, 0; 62, -4], style(gradient=2, fillColor=1)),
      Polygon(points=[-100, 56; -58, 80; 62, 80; 100, 56; -100, 56], style(
            fillColor=1, fillPattern=1)),
      Rectangle(extent=[-48, 46; -16, -56], style(gradient=2, fillColor=1)),
      Rectangle(extent=[2, 46; 34, -56], style(gradient=2, fillColor=1)),
      Rectangle(extent=[68, 46; 100, -56], style(gradient=2, fillColor=1)),
      Line(points=[-66, -4; -48, -4], style(fillColor=9, fillPattern=1)),
      Line(points=[-16, -4; 2, -4], style(fillColor=9, fillPattern=1))),
    Documentation(info="<html>

<H2 align=center>act_Layer-Layer1D</H2>
<IMG SRC=FuelCellLib.Layer1D.act_layerD.png WIDTH=200>
<br><br><br>
<H4>
This class represents the method of finite volumes   to solve the one dimensional problem of the layer.   Also in this class all parameter of transport phenomena  and control volume of catalyst layer are defined.    One of these parameters, \"n\" is the number of finite volumes  of the layer. The simulation can become too slowed if the  parameter \"n\" is very high.    The selection of the variable modeling hypothesis is defined   by the parameters:<br>
\"ModHyp1\": Psuedocapacitance dependence(0:Off,1:On)<br>
\"ModHyp2\":Knudsen diffusion pore size dependence(0:Off,1:On)<br>
\"ModHyp3\":Electro-Osmotic drag effect(0:Off,1:On)<br>
\"ModHyp4\":Electrolyte conductivity dependence(0:Off,1:On)

<H3>Parameters</H3><P>
<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=2>
<TR><TH>Name</TH><TH>Default</TH><TH>Description</TH></TR>
<TR><TD>T</TD><TD>340</TD><TD>Operation temperature of active layer [K]</TD></TR>
<TR><TD>av</TD><TD>1e-9</TD><TD>Specific condensation surface [m2/m3]</TD></TR>
<TR><TD>b</TD><TD>0.001</TD><TD>Material transfer coeficient [m/s]</TD></TR>
<TR><TD>Es</TD><TD>0.7</TD><TD>Volumetric fraction of solid</TD></TR>
<TR><TD>Ee</TD><TD>0.2</TD><TD>Volumetric fraction of electrolyte</TD></TR>
<TR><TD>cdl</TD><TD>1</TD><TD>Electrical capacity of double layer [F]</TD></TR>
<TR><TD>da</TD><TD>1e-6</TD><TD>Thickness of transport phenomena [m]</TD></TR>
<TR><TD>tau</TD><TD>5</TD><TD>Tortuosity</TD></TR>
<TR><TD>Dwl</TD><TD>3.5e-9</TD><TD>Surface diffusion coefficient of H2O, liquid phase [m2/s]</TD></TR>
<TR><TD>ks</TD><TD>1e4</TD><TD>Electrical conducivity of the solid [S/m]</TD></TR>
<TR><TD>kpo</TD><TD>10e-2</TD><TD>Constant protonic conducivity of the electrolyte [S/m]</TD></TR>
<TR><TD>posat</TD><TD>3169</TD><TD>Reference Saturation pressure [Pa]</TD></TR>
<TR><TD>Tosat</TD><TD>298.16</TD><TD>Reference Saturation temperature [K]</TD></TR>
<TR><TD>rom</TD><TD>2000</TD><TD>Density of the electrolyte [kg/m3]</TD></TR>
<TR><TD>ros</TD><TD>4000</TD><TD>Density of the solid [kg/m3]</TD></TR>
<TR><TD>Mm</TD><TD>1.1</TD><TD>Molar mass of the electrolyte [kg/mol]</TD></TR>
<TR><TD>roh2ol</TD><TD>972</TD><TD>Density of water [kg/m3]</TD></TR>
<TR><TD>Aioref</TD><TD>1.28</TD><TD>Catalyst area and reference exchange current density [A/m3]</TD></TR>
<TR><TD>poa</TD><TD>100000</TD><TD>Reference pressure for the current limit [Pa]</TD></TR>
<TR><TD>B</TD><TD>0.060</TD><TD>Tafel slope [V]</TD></TR>
<TR><TD>jlim</TD><TD>2.40e3</TD><TD>Limit current [A]</TD></TR>
<TR><TD>D1co</TD><TD>0.007853e-4</TD><TD>Constant Knudsen diffusion coefficient for oxygen [m2/s]</TD></TR>
<TR><TD>D2co</TD><TD>0.01047e-4</TD><TD>Constant Knudsen diffusion coefficient for steam water [m2/s]</TD></TR>
<TR><TD>rp</TD><TD>1e-10</TD><TD>Pore size of porous media [m]</TD></TR>
<TR><TD>D12o</TD><TD>0.282e-4</TD><TD>Constant binary diffusion coefficient [m2/s]</TD></TR>
<TR><TD>pAref</TD><TD>100000</TD><TD>Reference pressure to measure the binary diffusion coefficient [Pa]</TD></TR>
<TR><TD>Tref</TD><TD>308.1</TD><TD>Reference temperature to measure the binary diffusion coefficient [K]</TD></TR>
<TR><TD>ModHyp1</TD><TD>0</TD><TD>Psuedocapacitance dependence(0:Off,1:On)</TD></TR>
<TR><TD>ModHyp2</TD><TD>0</TD><TD>Knudsen diffusion pore size dependence(0:Off,1:On)</TD></TR>
<TR><TD>ModHyp3</TD><TD>0</TD><TD>Electro-Osmotic drag effect(0:Off,1:On)</TD></TR>
<TR><TD>ModHyp4</TD><TD>1</TD><TD>Electrolyte conductivity dependence(0:Off,1:On)</TD></TR>
<TR><TD>n</TD><TD>10</TD><TD>Number of finite elements for active layer</TD></TR>
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
  connect(vc_act1.exa1, tp_act2.exa1) annotation (points=[48, 22; 48, 12]);
  connect(vc_act2.exa1, tp_act1.exa1) annotation (points=[-68, 24; -68, 14]);
end act_layer;
