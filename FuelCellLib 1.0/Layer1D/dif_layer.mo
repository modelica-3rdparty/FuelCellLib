model dif_layer

  inner parameter SI.Temp_K T=340 "Operation temperature of diffusion layer";
  inner parameter Units.alfav av=1e-9 "Specific condensation surface";
  inner parameter Units.beta b=0.001 "Material transfer coeficient";
  inner parameter Units.volpore Es=0.7 "Volumetric fraction of solid";
  inner parameter SI.Length da=1e-5 "Thickness of transport phenomena";
  inner parameter Units.factor tau=1 "Tortuosity";
  inner parameter SI.DiffusionCoefficient Dwl=3.5e-9
    "Surface diffusion coefficient of H2O, liquid phase";
  inner parameter SI.Conductivity ks=1e4 "Electrical conducivity of the solid";
  inner parameter SI.Conductivity kp=20
    "Constant protonic conducivity of the electrolyte";
  inner parameter SI.Pressure posat=3169 "Reference Saturation pressure";
  inner parameter SI.Temp_K Tosat=298.16 "Reference Saturation temperature";
  inner parameter SI.Density ros=4000 "Density of the solid";
  inner parameter SI.Density roh2ol=972 "Density of water";
  inner parameter SI.Pressure poa=100000
    "Reference pressure for the current limit";
  inner parameter SI.DiffusionCoefficient D1co=0.07853e-4
    "Constant Knudsen diffusion coefficient for oxygen";
  //V.Gurau, H.Liu, S.Kakac,AIChE J.2000 46(10)
  inner parameter SI.DiffusionCoefficient D2co=0.1047e-4
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
  inner parameter Units.factor ModHyp2=0
    "Knudsen diffusion pore size dependence(0:Off,1:On)";
  //******************************************

  parameter Integer n=20 "Number of finite elements for diffusion layer";
  Layer1D.mv_dif c[n];
  Basics.tp_dif_mid tp_dif1 annotation (extent=[-80, 4; -60, 24]);
  Basics.tp_dif_mid tp_dif2 annotation (extent=[28, 4; 48, 24]);
  Basics.vc_dif vc_dif1 annotation (extent=[18, 22; 38, 42]);
  Basics.vc_dif vc_dif2 annotation (extent=[-90, 22; -70, 42]);
equation

  for i in 1:n - 1 loop
    connect(c[i].tp_dif1.exa2, c[i + 1].tp_dif1.exa1);
  end for;

  connect(tp_dif1.exa2, c[1].tp_dif1.exa1);
  connect(c[n].tp_dif1.exa2, tp_dif2.exa1);

  annotation (
    Diagram(
      Rectangle(extent=[-56, 24; 22, 4], style(gradient=2, fillColor=6)),
      Line(points=[-68, 14; -56, 14], style(gradient=3, fillColor=6)),
      Line(points=[30, 14; 22, 14], style(gradient=3, fillColor=6)),
      Text(extent=[-44, 32; 10, 24], string="n*finite volumes")),
    Icon(
      Rectangle(extent=[-100, -66; 100, 54], style(fillColor=68)),
      Rectangle(extent=[-98, 44; -66, -58], style(gradient=2, fillColor=6)),
      Ellipse(extent=[38, -2; 42, -6], style(gradient=2)),
      Ellipse(extent=[48, -2; 52, -6], style(gradient=2)),
      Ellipse(extent=[58, -2; 62, -6], style(gradient=2)),
      Polygon(points=[-100, 54; -58, 78; 62, 78; 100, 54; -100, 54], style(
            fillColor=6)),
      Rectangle(extent=[-48, 44; -16, -58], style(gradient=2, fillColor=6)),
      Rectangle(extent=[2, 44; 34, -58], style(gradient=2, fillColor=6)),
      Rectangle(extent=[68, 44; 100, -58], style(gradient=2, fillColor=6)),
      Line(points=[-66, -6; -48, -6], style(fillPattern=1)),
      Line(points=[-16, -6; 2, -6], style(fillPattern=1))),
    Documentation(info="<html>

<H2 align=center>dif_Layer-Layer1D</H2>
<IMG SRC=FuelCellLib.Layer1D.dif_layerD.png WIDTH=200>
<br><br><br>
<H4>
This class represents the method of finite volumes  to solve the one dimensional problem of the layer.  Also in this class all parameter of transport phenomena  and control volume of diffusion layer are defined.  One of these parameters, \"n\" is the number of finite volumes of the layer. The simulation can become too slowed if the  parameter \"n\" is very high.  The selection of the variable modeling hypothesis is defined  by the parameter:<br>
\"ModHyp2\":Knudsen diffusion pore size dependence(0:Off,1:On)

<H3>Parameters</H3><P>
<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=2>
<TR><TH>Name</TH><TH>Default</TH><TH>Description</TH></TR>
<TR><TD>T</TD><TD>340</TD><TD>Operation temperature of diffusion layer [K]</TD></TR>
<TR><TD>av</TD><TD>1e-9</TD><TD>Specific condensation surface [m2/m3]</TD></TR>
<TR><TD>b</TD><TD>0.001</TD><TD>Material transfer coeficient [m/s]</TD></TR>
<TR><TD>Es</TD><TD>0.7</TD><TD>Volumetric fraction of solid</TD></TR>
<TR><TD>da</TD><TD>1e-5</TD><TD>Thickness of transport phenomena [m]</TD></TR>
<TR><TD>tau</TD><TD>1</TD><TD>Tortuosity</TD></TR>
<TR><TD>Dwl</TD><TD>3.5e-9</TD><TD>Surface diffusion coefficient of H2O, liquid phase [m2/s]</TD></TR>
<TR><TD>ks</TD><TD>1e4</TD><TD>Electrical conducivity of the solid [S/m]</TD></TR>
<TR><TD>kp</TD><TD>20</TD><TD>Constant protonic conducivity of the electrolyte [S/m]</TD></TR>
<TR><TD>posat</TD><TD>3169</TD><TD>Reference Saturation pressure [Pa]</TD></TR>
<TR><TD>Tosat</TD><TD>298.16</TD><TD>Reference Saturation temperature [K]</TD></TR>
<TR><TD>ros</TD><TD>4000</TD><TD>Density of the solid [kg/m3]</TD></TR>
<TR><TD>roh2ol</TD><TD>972</TD><TD>Density of water [kg/m3]</TD></TR>
<TR><TD>poa</TD><TD>100000</TD><TD>Reference pressure for the current limit [Pa]</TD></TR>
<TR><TD>D1co</TD><TD>0.07853e-4</TD><TD>Constant Knudsen diffusion coefficient for oxygen [m2/s]</TD></TR>
<TR><TD>D2co</TD><TD>0.1047e-4</TD><TD>Constant Knudsen diffusion coefficient for steam water [m2/s]</TD></TR>
<TR><TD>rp</TD><TD>1e-10</TD><TD>Pore size of porous media [m]</TD></TR>
<TR><TD>D12o</TD><TD>0.282e-4</TD><TD>Constant binary diffusion coefficient [m2/s]</TD></TR>
<TR><TD>pAref</TD><TD>100000</TD><TD>Reference pressure to measure the binary diffusion coefficient [Pa]</TD></TR>
<TR><TD>Tref</TD><TD>308.1</TD><TD>Reference temperature to measure the binary diffusion coefficient [K]</TD></TR>
<TR><TD>ModHyp2</TD><TD>0</TD><TD>Knudsen diffusion pore size dependence(0:Off,1:On)</TD></TR>
<TR><TD>n</TD><TD>20</TD><TD>Number of finite elements for diffusion layer</TD></TR>
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

  connect(vc_dif1.exa1, tp_dif2.exa1) annotation (points=[28, 24; 30, 16],
      style(gradient=3, fillColor=6));
  connect(vc_dif2.exa1, tp_dif1.exa1) annotation (points=[-80, 24; -78, 14],
      style(gradient=3, fillColor=6));
end dif_layer;
