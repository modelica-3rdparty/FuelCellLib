model tp_mem

  constant Units.MolarGasConstant R=8.30824 "Molar gas constant";
  constant SI.MolarMass massh2o=18e-3 "Molar mass of water";
  constant SI.FaradayConstant F=96485 "Faraday constant";

  outer parameter Units.factor tau "Tortuosity";
  outer parameter Units.volpore Ee "Volumetric fraction of electrolyte";
  outer parameter SI.Length da "Thickness of transport phenomena";
  outer parameter SI.Temp_K T "Operation temperature of active layer";
  outer parameter SI.DiffusionCoefficient D2
    "Constant Fick diffusion coefficient for steam water";
  outer parameter SI.DiffusionCoefficient Dwl
    "Surface diffusion coefficient of H2O, liquid phase";
  outer parameter SI.Conductivity ks "Electrical conducivity of the solid";
  outer parameter SI.Density rom "Density of the electrolyte";
  outer parameter SI.Conductivity kpo
    "Constant protonic conducivity of the electrolyte";
  outer parameter SI.Density roh2ol "Density of water";
  outer parameter SI.Pressure posat "Reference Saturation pressure";
  outer parameter SI.Temp_K Tosat "Reference Saturation temperature";
  outer parameter SI.MolarMass Mm "Molar mass of the electrolyte";

  Units.volpore Xs_ "Transported water load";
  SI.Pressure p_ "Transported oxygen pressure";
  SI.Pressure ph2o_ "Transported steam water pressure";
  Units.Wload Xsmax "Maximum water load";
  Units.volpore Ega "Free diffusion porosity";
  Units.volpore Ego "Free diffusion porosity without water";
  Units.factor ndrag "Electro-osmotic drag coefficient";
  SI.Conductivity kp "Protonic conducivity of the electrolyte";
  Units.factor LSO3 "Water load in electrolyte";

  outer parameter Units.factor ModHyp3
    "Electro-Osmotic drag effect(0:Off,1:On)";
  outer parameter Units.factor ModHyp4
    "Electrolyte conductivity dependence(0:Off,1:On)";

  exac exa1 annotation (extent=[-112, 34; -44, -24]);
  exac exa2 annotation (extent=[54, -20; 122, 40]);
  annotation (
    Diagram,
    Icon(
      Rectangle(extent=[-66, 52; 68, -42], style(gradient=2)),
      Text(
        extent=[-68, 52; 68, -42],
        style(
          color=6,
          fillColor=7,
          fillPattern=1),
        string="TP MEM"),
      Polygon(points=[-98, 28; -80, 40; -66, 40; -66, 28; -98, 28], style(
          color=1,
          gradient=1,
          fillColor=2)),
      Polygon(points=[68, 28; 68, 40; 84, 40; 100, 28; 68, 28], style(
          color=1,
          gradient=1,
          fillColor=2)),
      Polygon(points=[-66, 52; -48, 66; 46, 66; 68, 52; -66, 52], style(
            fillPattern=1))),
    Documentation(info="<html>

<H2 align=center>tp_mem-Transport Phenomena</H2>
<IMG SRC=FuelCellLib.Basics.tp_memI.png WIDTH=100>
<br>
<H4>
This equation shown the flux of liquid water as a dependence on the gradient of water load and electrosmotic drag. In the library , the electrosmotic drag is a opcional modeling hypothesis, selected by the parameter \"ModHyp3\" in membrane layer (MEM_LAYER) located in LAYER1D package.
<br><br>
<H2 align=center><IMG SRC=tp_mem1.png WIDTH=200></H2>
This equation shown the flux of steam water in membrane, this depends on gradient of gas pressure.
<br><br>
<H2 align=center><IMG SRC=tp_mem2.png WIDTH=150></H2>
Protonic  flux depends on the gradient of electrolyte voltage  multiply by the protonic conductivity and the electrolyte volume.
<br><br>
<H2 align=center><IMG SRC=tp_mem3.png WIDTH=110></H2>
The maximum water load in membrane is shown next and it depends on the density of water and the membrane and the volume of electrolyte.
<br><br>
<H2 align=center><IMG SRC=tp_mem4.png WIDTH=140></H2>
Electrosmotic drag coefficient is a empirical equation, this depends on the water load of the membrane and the lectrolyte pore. This  coefficient shows the water flux and protonic flux ratio.
<br><br>
<H2 align=center><IMG SRC=tp_mem5.png WIDTH=300></H2>
The pore volume is the blank space that doesn't fill the electrolyte
<br><br>
<H2 align=center><IMG SRC=tp_mem6.png WIDTH=300></H2>
The proton conductivity is another variable modeling hypothesis in the library, called \"ModHyp4\" located in \"MEM_LAYER\" in the Layers1D package. The user select with \"ModHyp4\" a constant proton conductivity or a water load dependence equation of proton conductivity.
<br><br>
<H2 align=center><IMG SRC=tp_act9.png WIDTH=250></H2>

<H3>Parameters</H3><P>
<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=2>
<TR><TH>Name</TH><TH>Default</TH><TH>Description</TH></TR>
<TR><TD>tau</TD><TD>&nbsp;</TD><TD>Tortuosity</TD></TR>
<TR><TD>Ee</TD><TD>&nbsp;</TD><TD>Volumetric fraction of electrolyte</TD></TR>
<TR><TD>da</TD><TD>&nbsp;</TD><TD>Thickness of transport phenomena [m]</TD></TR>
<TR><TD>T</TD><TD>&nbsp;</TD><TD>Operation temperature of active layer [K]</TD></TR>
<TR><TD>D2</TD><TD>&nbsp;</TD><TD>Constant Fick diffusion coefficient for steam water [m2/s]</TD></TR>
<TR><TD>Dwl</TD><TD>&nbsp;</TD><TD>Surface diffusion coefficient of H2O, liquid phase [m2/s]</TD></TR>
<TR><TD>ks</TD><TD>&nbsp;</TD><TD>Electrical conducivity of the solid [S/m]</TD></TR>
<TR><TD>rom</TD><TD>&nbsp;</TD><TD>Density of the electrolyte [kg/m3]</TD></TR>
<TR><TD>kpo</TD><TD>&nbsp;</TD><TD>Constant protonic conducivity of the electrolyte [S/m]</TD></TR>
<TR><TD>roh2ol</TD><TD>&nbsp;</TD><TD>Density of water [kg/m3]</TD></TR>
<TR><TD>posat</TD><TD>&nbsp;</TD><TD>Reference Saturation pressure [Pa]</TD></TR>
<TR><TD>Tosat</TD><TD>&nbsp;</TD><TD>Reference Saturation temperature [K]</TD></TR>
<TR><TD>Mm</TD><TD>&nbsp;</TD><TD>Molar mass of the electrolyte [kg/mol]</TD></TR>
<TR><TD>ModHyp3</TD><TD>&nbsp;</TD><TD>Electro-Osmotic drag effect(0:Off,1:On)</TD></TR>
<TR><TD>ModHyp4</TD><TD>&nbsp;</TD><TD>Electrolyte conductivity dependence(0:Off,1:On)</TD></TR>
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
equation

  exa1.j = -exa2.j;
  exa1.j = 0;

  exa1.jwg = -exa2.jwg;

  exa1.jwl = -exa2.jwl;

  exa1.je = -exa2.je;
  exa1.je = 0;

  exa1.jp = -exa2.jp;

  Xs_ = if exa1.jwl > 0 then exa1.Xs else exa2.Xs;
  p_ = if exa1.j > 0 then exa1.p else exa2.p;
  ph2o_ = if exa1.jwg > 0 then exa1.pwg else exa2.pwg;

  //__________________________________________________________PORE EQUATIONS
  Ega = Ego*(1 - (Xs_/Xsmax));
  Xsmax = (roh2ol/rom)*(1 - Ee)/Ee;
  Ee = 1 - Ego;
  //________________________________________________________________________
  //
  //
  //
  //____________________________________________PROTONIC TRANSPORT EQUATIONS
  exa1.jp = -kp*(exa2.ve - exa1.ve)/da;
  //________________________________________________________________________
  //
  //
  //
  //_________________________________________STEAM WATER TRANSPORT EQUATIONS
  (Ega/(tau)^2)*(exa2.pwg - exa1.pwg)/da = -((R*T)*exa1.jwg)/D2;
  //________________________________________________________________________
  //
  //
  //
  //________________________________________ELECTROLYTE WATER LOAD EQUATIONS
  //LSO3 = Xs_/((rom/Mm) - (0.0126*Xs_));
  //T.E.Springer, T.A.Zawodzinsky, J.Electrochem.Soc.138(1991)
  LSO3 = 14;
  //Measured value of Lambda=14 with saturated water vapor at 30ºC
  //T.E.Springer, T.A.Zawodzinsky, J.Electrochem.Soc.138(1991)
  //________________________________________________________________________
  //
  //
  //
  //_______________________________ELECTRO-OSMOTIC DRAG COEFFICIENT EQUATIONS
  //**************Springer electro-osmotic drag coefficient
  ndrag = 2.5*LSO3*Ee/22;
  //T.E.Springer, T.A.Zawodzinsky, J.Electrochem.Soc.138(1991)
  //**************Dutta electro-osmotic drag coefficient
  //ndrag=(0.0029*LSO3^2)+(0.05*LSO3)-(3.4e-19);
  //S.Dutta, S.Shimpalee,J.Appl.Electrochem.(2000),
  //________________________________________________________________________
  //
  //
  //
  //________________________________________LIQUID WATER TRANSPORT EQUATIONS
  //*******************************************************************
  //HYP3------>Case 1:  No Electro-Osmotic Drag effect
  //*******************************************************************
  if not ModHyp3 == 1 then
    exa1.jwl = -((rom/massh2o)*Dwl*(exa2.Xs - exa1.Xs)/da);
  end if;
  //*******************************************************************

  //*******************************************************************
  //HYP3------>Case 2:  Electro-Osmotic Drag effect
  //*******************************************************************
  if ModHyp3 == 1 then
    exa1.jwl = -((rom/massh2o)*Dwl*(exa2.Xs - exa1.Xs)/da) + ndrag*(exa1.jp/F);
  end if;
  //*******************************************************************
  //________________________________________________________________________
  //
  //
  //
  //______________________________________ELECTROLYTE CONDUCTIVITY EQUATIONS
  //*******************************************************************
  //HYP4------>Case 1:  Constant electrolyte conductivity
  //*******************************************************************
  if not ModHyp4 == 1 then
    kp = kpo;
  end if;
  //*******************************************************************

  //*******************************************************************
  //HYP4------>Case 2:  No constant electrolyte conductivity
  //*******************************************************************
  if ModHyp4 == 1 then
    kp = exp(1268*((1/303) - (1/(273 + T))))*((0.005139*LSO3) - 0.00326);
    //T.E.Springer, T.A.Zawodzinsky, J.Electrochem.Soc.138(1991)
  end if;
  //*******************************************************************
  //________________________________________________________________________
  //
  //
  //
end tp_mem;
