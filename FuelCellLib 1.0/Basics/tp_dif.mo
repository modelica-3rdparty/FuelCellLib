model tp_dif

  constant Units.MolarGasConstant R=8.30824 "Molar gas constant";
  constant SI.MolarMass massh2o=18e-3 "Molar mass of water";
  constant SI.FaradayConstant F=96485 "Faraday constant";

  outer parameter Units.factor tau "Tortuosity";
  outer parameter Units.volpore Es "Volumetric fraction of solid";
  outer parameter SI.Length da "Thickness of transport phenomena";
  outer parameter SI.Temp_K T "Operation temperature of active layer";
  outer parameter SI.DiffusionCoefficient Dwl
    "Surface diffusion coefficient of H2O, liquid phase";
  outer parameter SI.Conductivity ks "Electrical conducivity of the solid";
  outer parameter SI.Conductivity kp
    "Constant protonic conducivity of the electrolyte";
  outer parameter SI.Density ros "Density of the solid";
  outer parameter SI.Density roh2ol "Density of water";
  outer parameter SI.DiffusionCoefficient D1co
    "Constant Knudsen diffusion coefficient for oxygen";
  outer parameter SI.DiffusionCoefficient D2co
    "Constant Knudsen diffusion coefficient for steam water";
  outer parameter SI.Length rp "Pore size of porous media";
  outer parameter SI.DiffusionCoefficient D12o
    "Constant binary diffusion coefficient";
  outer parameter SI.Pressure pAref
    "Reference pressure to measure the binary diffusion coefficient";
  outer parameter SI.Temp_K Tref
    "Reference temperature to measure the binary diffusion coefficient";

  outer parameter Units.factor ModHyp2
    "Knudsen diffusion pore size dependence(0:Off,1:On)";

  SI.DiffusionCoefficient D1 "Knudsen diffusion coefficient for oxygen";
  SI.DiffusionCoefficient D2 "Knudsen diffusion coefficient for steam water";
  SI.DiffusionCoefficient D12 "Binary diffusion coefficient";
  Units.volpore Xs_ "Transported water load";
  SI.Pressure p_ "Transported oxygen pressure";
  SI.Pressure ph2o_ "Transported steam water pressure";
  SI.Pressure pA "Total pressure";
  Units.Wload Xsmax "Maximum water load";
  Units.volpore Ega "Free diffusion porosity";
  Units.volpore Ego "Free diffusion porosity without water";

  exac exa1 annotation (extent=[-112, 34; -44, -24]);
  exac exa2 annotation (extent=[54, -20; 122, 40]);
  annotation (
    Diagram,
    Icon(
      Rectangle(extent=[-66, 52; 68, -42], style(gradient=2, fillColor=6)),
      Text(
        extent=[-70, 54; 76, -46],
        style(gradient=2, fillColor=6),
        string="TP DIF"),
      Polygon(points=[-98, 26; -80, 38; -66, 38; -66, 26; -98, 26], style(
          color=1,
          gradient=1,
          fillColor=2)),
      Polygon(points=[-66, 52; -52, 66; 52, 66; 68, 52; -66, 52], style(
          color=1,
          gradient=1,
          fillColor=6)),
      Polygon(points=[68, 28; 68, 40; 84, 40; 100, 28; 68, 28], style(
          color=1,
          gradient=1,
          fillColor=2))),
    Documentation(info="<html>

<H2 align=center>tp_dif-Transport Phenomena</H2>
<IMG SRC=FuelCellLib.Basics.tp_difI.png WIDTH=100>
<br>
<H4>
The following eq, shows the flux of gases depending of two phenomena: Stefan-Maxwell diffusion, and  Knudsen diffusion.
<br><br>
<H2 align=center><IMG SRC=tp_act1.png WIDTH=250></H2>
The following eqs., shows  the expression of binary diffusion coeffient and Knudsen diffusion coefficient equations. This is variable modeling hypothesis, and it could be simulated as a constant or  a dependence on pore size equation.
<br><br>
<H2 align=center><IMG SRC=tp_act2.png WIDTH=250></H2>
The maximum water load in diffusion layer is shown next and it depends on the density of water and the solid and the volume of solid.
<br><br>
<H2 align=center><IMG SRC=tp_dif1.png WIDTH=120></H2>
The pore volume is the blank space that doesn't fill of liquid water and solid volume.
<br><br>
<H2 align=center><IMG SRC=tp_dif2.png WIDTH=250></H2>
This equation shown the flux of liquid water as a dependence on the gradient of water load.
<br><br>
<H2 align=center><IMG SRC=tp_dif3.png WIDTH=150></H2>
The electronic current is shown like a ohm´s law. Ks parameter is the electronic conductivity of the solid.
<br><br>
<H2 align=center><IMG SRC=tp_dif4.png WIDTH=80></H2>
<H3>Parameters</H3><P>
<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=2>
<TR><TH>Name</TH><TH>Default</TH><TH>Description</TH></TR>
<TR><TD>tau</TD><TD>&nbsp;</TD><TD>Tortuosity</TD></TR>
<TR><TD>Es</TD><TD>&nbsp;</TD><TD>Volumetric fraction of solid</TD></TR>
<TR><TD>da</TD><TD>&nbsp;</TD><TD>Thickness of transport phenomena [m]</TD></TR>
<TR><TD>T</TD><TD>&nbsp;</TD><TD>Operation temperature of active layer [K]</TD></TR>
<TR><TD>Dwl</TD><TD>&nbsp;</TD><TD>Surface diffusion coefficient of H2O, liquid phase [m2/s]</TD></TR>
<TR><TD>ks</TD><TD>&nbsp;</TD><TD>Electrical conducivity of the solid [S/m]</TD></TR>
<TR><TD>kp</TD><TD>&nbsp;</TD><TD>Constant protonic conducivity of the electrolyte [S/m]</TD></TR>
<TR><TD>ros</TD><TD>&nbsp;</TD><TD>Density of the solid [kg/m3]</TD></TR>
<TR><TD>roh2ol</TD><TD>&nbsp;</TD><TD>Density of water [kg/m3]</TD></TR>
<TR><TD>D1co</TD><TD>&nbsp;</TD><TD>Constant Knudsen diffusion coefficient for oxygen [m2/s]</TD></TR>
<TR><TD>D2co</TD><TD>&nbsp;</TD><TD>Constant Knudsen diffusion coefficient for steam water [m2/s]</TD></TR>
<TR><TD>rp</TD><TD>&nbsp;</TD><TD>Pore size of porous media [m]</TD></TR>
<TR><TD>D12o</TD><TD>&nbsp;</TD><TD>Constant binary diffusion coefficient [m2/s]</TD></TR>
<TR><TD>pAref</TD><TD>&nbsp;</TD><TD>Reference pressure to measure the binary diffusion coefficient [Pa]</TD></TR>
<TR><TD>Tref</TD><TD>&nbsp;</TD><TD>Reference temperature to measure the binary diffusion coefficient [K]</TD></TR>
<TR><TD>ModHyp2</TD><TD>&nbsp;</TD><TD>Knudsen diffusion pore size dependence(0:Off,1:On)</TD></TR>
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
</HTML>"));
equation

  exa1.j = -exa2.j;
  exa1.jwg = -exa2.jwg;
  exa1.jwl = -exa2.jwl;
  exa1.je = -exa2.je;
  exa1.jp = -exa2.jp;

  exa1.jp = -kp*(exa2.ve - exa1.ve)/da;

  Xs_ = if exa1.jwl > 0 then exa1.Xs else exa2.Xs;
  p_ = if exa1.j > 0 then exa1.p else exa2.p;
  ph2o_ = if exa1.jwg > 0 then exa1.pwg else exa2.pwg;
  pA = p_ + ph2o_;

  //__________________________________________________________PORE EQUATIONS
  Ega = Ego*(1 - (Xs_/Xsmax));
  Xsmax = (roh2ol/ros)*(1 - Es)/Es;
  Es = 1 - Ego;
  //________________________________________________________________________
  //
  //
  //
  //___________________________________BINARY DIFFUSION COEFFICIENT EQUATIONS
  D12 = D12o*(pA/pAref)*(T/Tref)^1.5;
  //A.A.Kulikovsky, Fuel Cells 2001,1(2)
  //________________________________________________________________________
  //
  //
  //
  //__________________________________KNUDSEN DIFFUSION COEFFICIENT EQUATIONS
  //*******************************************************************
  //HYP2------>Case 1  No Pore size dependence
  //*******************************************************************
  if not ModHyp2 == 1 then
    D1 = D1co;
    D2 = D2co;
  end if;
  //*******************************************************************

  //*******************************************************************
  //HYP2------>Case 2  Pore size dependence
  //*******************************************************************
  if ModHyp2 == 1 then
    D1 = (4/3)*rp*sqrt(2*R*T/(3.1416*0.016));
    D2 = (4/3)*rp*sqrt(2*R*T/(3.1416*0.018));
  end if;
  //*******************************************************************
  //________________________________________________________________________
  //
  //
  //
  //_________________________________________________STEFAN-MAXWELL EQUATIONS
  ((Ega/(tau)^2)*(exa2.p - exa1.p)/da) = -((R*T)/(D12*pA*Es/tau))*((exa1.j*
    ph2o_) - (exa1.jwg*p_)) - (R*T)*exa1.j/(D1);
  ((Es/(tau)^2)*(exa2.pwg - exa1.pwg)/da) = -((R*T)/(D12*pA*Es/tau))*(-(exa1.j*
    ph2o_) + (exa1.jwg*p_)) - (R*T)*exa1.jwg/(D2);
  //________________________________________________________________________
  //
  //
  //
  //_________________________________________LIQUID WATER TRANSPORT EQUATIONS
  exa1.jwl = -((ros/massh2o)*Dwl*(exa2.Xs - exa1.Xs)/da);
  //________________________________________________________________________
  //
  //
  //
  //___________________________________________ELECTRONIC TRANSPORT EQUATIONS
  exa1.je = ks*(exa2.vs - exa1.vs)/da;
  //________________________________________________________________________
  //
  //
  //
end tp_dif;
