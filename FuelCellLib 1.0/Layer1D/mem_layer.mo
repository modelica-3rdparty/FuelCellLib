model mem_layer

  inner parameter SI.Temp_K T=340 "Operation temperature of membrane layer";
  inner parameter Units.alfav av=1e-9 "Specific condensation surface";
  inner parameter Units.beta b=0.001 "Material transfer coeficient";
  inner parameter Units.volpore Ee=0.72 "Volumetric fraction of electrolyte";
  //Membrane porosity of Nafion-117=0.28%
  //(D.M.Benardi, M.W.Verbrugge, General Motor Report GMR-7360,(1991)
  inner parameter SI.Length da=1e-5 "Thickness of transport phenomena";
  inner parameter Units.factor tau=1 "Tortuosity";
  inner parameter SI.DiffusionCoefficient D2=1e-6
    "Constant Fick diffusion coefficient for steam water";
  inner parameter SI.DiffusionCoefficient Dwl=1e-8
    "Surface diffusion coefficient of H2O, liquid phase";
  inner parameter SI.Conductivity ks=1e6 "Electrical conducivity of the solid";
  inner parameter SI.Conductivity kpo=1
    "Constant protonic conducivity of the electrolyte";
  inner parameter SI.Pressure posat=3169 "Reference Saturation pressure";
  inner parameter SI.Temp_K Tosat=298.16 "Reference Saturation temperature";
  inner parameter SI.Density rom=2000 "Density of the electrolyte";
  inner parameter SI.Density roh2ol=972 "Density of water";
  inner parameter SI.MolarMass Mm=1.1 "Molar mass of the electrolyte";

  //Model Hypothesis**************************
  inner parameter Units.factor ModHyp3=0
    "Electro-Osmotic drag effect(0:Off,1:On)";
  inner parameter Units.factor ModHyp4=0
    "Electrolyte conductivity dependence(0:Off,1:On)";
  //******************************************

  parameter Integer n=10 "Number of finite elements for membrane layer";
  Layer1D.mv_mem c[n];
  annotation (
    Diagram(
      Rectangle(extent=[-56, 24; 22, 4], style(gradient=2)),
      Line(points=[-68, 16; -56, 16]),
      Rectangle(extent=[26, 16; 22, 16]),
      Text(extent=[-42, 32; 12, 24], string="n*finite volumes")),
    Icon(
      Rectangle(extent=[-100, -62; 100, 58], style(fillColor=68)),
      Rectangle(extent=[-98, 48; -66, -54], style(gradient=2)),
      Ellipse(extent=[38, 2; 42, -2], style(gradient=2)),
      Ellipse(extent=[48, 2; 52, -2], style(gradient=2)),
      Ellipse(extent=[58, 2; 62, -2], style(gradient=2)),
      Polygon(points=[-100, 58; -58, 82; 62, 82; 100, 58; -100, 58], style(
            fillColor=76, fillPattern=1)),
      Rectangle(extent=[-48, 48; -16, -54], style(gradient=2)),
      Rectangle(extent=[2, 48; 34, -54], style(gradient=2)),
      Rectangle(extent=[68, 48; 100, -54], style(gradient=2)),
      Line(points=[-66, -2; -48, -2], style(fillPattern=1)),
      Line(points=[-16, -2; 2, -2], style(fillPattern=1))),
    Documentation(info="<html>

<H2 align=center>mem_Layer-Layer1D</H2>
<IMG SRC=FuelCellLib.Layer1D.mem_layerD.png WIDTH=200>
<br><br><br>
<H4>
This class represents the method of finite volumes  to solve the one dimensional problem of the layer.  Also in this class all parameter of transport  phenomena and control volume of membrane are defined.  One of these parameters, \"n\" is the number of finite volumes of the layer. The simulation can become too slowed if the  parameter \"n\" is very high.  The selection of the variable modeling hypothesis is defined  by the parameters:<br>
\"ModHyp3\":Electro-Osmotic drag effect(0:Off,1:On)<br>
\"ModHyp4\":Electrolyte conductivity dependence(0:Off,1:On)

<H3>Parameters</H3><P>
<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=2>
<TR><TH>Name</TH><TH>Default</TH><TH>Description</TH></TR>
<TR><TD>T</TD><TD>340</TD><TD>Operation temperature of membrane layer [K]</TD></TR>
<TR><TD>av</TD><TD>1e-9</TD><TD>Specific condensation surface [m2/m3]</TD></TR>
<TR><TD>b</TD><TD>0.001</TD><TD>Material transfer coeficient [m/s]</TD></TR>
<TR><TD>Ee</TD><TD>0.72</TD><TD>Volumetric fraction of electrolyte</TD></TR>
<TR><TD>da</TD><TD>1e-5</TD><TD>Thickness of transport phenomena [m]</TD></TR>
<TR><TD>tau</TD><TD>1</TD><TD>Tortuosity</TD></TR>
<TR><TD>D2</TD><TD>1e-6</TD><TD>Constant Fick diffusion coefficient for steam water [m2/s]</TD></TR>
<TR><TD>Dwl</TD><TD>1e-8</TD><TD>Surface diffusion coefficient of H2O, liquid phase [m2/s]</TD></TR>
<TR><TD>ks</TD><TD>1e4</TD><TD>Electrical conducivity of the solid [S/m]</TD></TR>
<TR><TD>kpo</TD><TD>1e-2</TD><TD>Constant protonic conducivity of the electrolyte [S/m]</TD></TR>
<TR><TD>posat</TD><TD>3169</TD><TD>Reference Saturation pressure [Pa]</TD></TR>
<TR><TD>Tosat</TD><TD>298.16</TD><TD>Reference Saturation temperature [K]</TD></TR>
<TR><TD>rom</TD><TD>2000</TD><TD>Density of the electrolyte [kg/m3]</TD></TR>
<TR><TD>roh2ol</TD><TD>972</TD><TD>Density of water [kg/m3]</TD></TR>
<TR><TD>Mm</TD><TD>1.1</TD><TD>Molar mass of the electrolyte [kg/mol]</TD></TR>
<TR><TD>n</TD><TD>10</TD><TD>Number of finite elements for membrane layer</TD></TR>
<TR><TD>ModHyp3</TD><TD>0</TD><TD>Electro-Osmotic drag effect(0:Off,1:On)</TD></TR>
<TR><TD>ModHyp4</TD><TD>1</TD><TD>Electrolyte conductivity dependence(0:Off,1:On)</TD></TR>
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

  Basics.tp_mem_mid tp_mem1 annotation (extent=[-80, 4; -60, 24]);
  Basics.tp_mem_mid tp_mem2 annotation (extent=[24, 4; 44, 24]);
  Basics.vc_mem vc_mem1 annotation (extent=[16, 22; 36, 42]);
equation

  for i in 1:n - 1 loop
    connect(c[i].tp_mem1.exa2, c[i + 1].tp_mem1.exa1);
  end for;

  connect(tp_mem1.exa2, c[1].tp_mem1.exa1);
  connect(c[n].tp_mem1.exa2, tp_mem2.exa1);
  connect(vc_mem1.exa1, tp_mem2.exa1) annotation (points=[26, 24; 26, 14]);
end mem_layer;
