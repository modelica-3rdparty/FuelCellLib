model vc_dif

  constant Units.MolarGasConstant R=8.30824 "Molar gas constant";
  constant SI.MolarMass massh2o=18e-3 "Molar mass of water";
  constant SI.FaradayConstant F=96485 "Faraday constant";

  outer parameter Units.alfav av "Specific condensation surface";
  outer parameter Units.beta b "Material transfer coeficient";
  outer parameter Units.volpore Es "Volumetric fraction of solid";
  outer parameter SI.Temp_K T "Operation temperature of active layer";
  outer parameter SI.Length da "Thickness of transport phenomena";
  outer parameter SI.Pressure posat "Reference Saturation pressure";
  outer parameter SI.Temp_K Tosat "Reference Saturation temperature";
  outer parameter SI.Density ros "Density of the solid";
  outer parameter SI.Density roh2ol "Density of water";

  Units.volpore Ega "Free diffusion porosity";
  Units.volpore Ego "Free diffusion porosity without water";
  SI.Pressure pwsat "Saturation pressure of water in the reference point";
  Units.EnthalpyxMol Lv "Liquid-gas enthalpy of evaporation";
  Units.Wload Xsmax "Maximum water load";

  annotation (
    Icon(Ellipse(extent=[-68, 100; 70, -30], style(gradient=3, fillColor=6)),
        Text(
        extent=[-64, 118; 66, -54],
        style(pattern=0, fillColor=6),
        string="VC DIF")),
    Diagram,
    Documentation(info="<html>

<H2 align=center>vc_dif-Control Volume</H2>
<IMG SRC=FuelCellLib.Basics.vc_difI.png WIDTH=100>
<br>
<H4>
The balance of oxygen is shown in next eq..
<br><br>
<H2 align=center><IMG SRC=vc_dif1.png WIDTH=200></H2>
The balance of steam water is shown in next eq., the 2nd  term in the right  show the balance ratio of liquid water and steam water.
<br><br>
<H2 align=center><IMG SRC=vc_dif2.png WIDTH=300></H2>
The balance of liquid water is shown in next eq., the 2nd  term in the right  show tthe balance ratio of liquid water and steam water.
<br><br>
<H2 align=center><IMG SRC=vc_dif3.png WIDTH=250></H2>
These equations  show the variables that are part in the liquid and steam water balance.
<br><br>
<H2 align=center><IMG SRC=vc_mem3.png WIDTH=400></H2>
The maximum water load in diffusion layer is shown next and it depends on the density of water and the solid and the volume of solid.
<br><br>
<H2 align=center><IMG SRC=tp_dif1.png WIDTH=120></H2>
The pore volume is the blank space that doesn't fill of liquid water and solid volume.
<br><br>
<H2 align=center><IMG SRC=tp_dif2.png WIDTH=250></H2>

<H3>Parameters</H3><P>
<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=2>
<TR><TH>Name</TH><TH>Default</TH><TH>Description</TH></TR>
<TR><TD>av</TD><TD>&nbsp;</TD><TD>Specific condensation surface [m2/m3]</TD></TR>
<TR><TD>b</TD><TD>&nbsp;</TD><TD>Material transfer coeficient [m/s]</TD></TR>
<TR><TD>Es</TD><TD>&nbsp;</TD><TD>Volumetric fraction of solid</TD></TR>
<TR><TD>T</TD><TD>&nbsp;</TD><TD>Operation temperature of active layer [K]</TD></TR>
<TR><TD>da</TD><TD>&nbsp;</TD><TD>Thickness of transport phenomena [m]</TD></TR>
<TR><TD>posat</TD><TD>&nbsp;</TD><TD>Reference Saturation pressure [Pa]</TD></TR>
<TR><TD>Tosat</TD><TD>&nbsp;</TD><TD>Reference Saturation temperature [K]</TD></TR>
<TR><TD>ros</TD><TD>&nbsp;</TD><TD>Density of the solid [kg/m3]</TD></TR>
<TR><TD>roh2ol</TD><TD>&nbsp;</TD><TD>Density of water [kg/m3]</TD></TR>
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
  exac exa1 annotation (extent=[-34, -98; 50, -8], style(pattern=0, gradient=2)
    );
equation

  //________________________________________________CHARGE BALANCE EQUATIONS
  exa1.je = exa1.jp;
  exa1.je = 0;
  //________________________________________________________________________
  //
  //
  //
  //___________________________________________________GAS BALANCE EQUATIONS
  (exa1.p/(R*T))*Ego*(1 - (der(exa1.Xs))/(Xsmax)) + (Ega/(R*T))*der(exa1.p) = (
    (exa1.j)/da);

  (exa1.pwg/(R*T))*Ego*(1 - (der(exa1.Xs))/(Xsmax)) + (Ega/(R*T))*der(exa1.pwg)
     = ((exa1.jwg)/da) - ((av*b)/R*T)*(exa1.pwg - pwsat);
  //________________________________________________________________________
  //
  //
  //
  //__________________________________________LIQUID WATER BALANCE EQUATIONS
  (ros/massh2o)*der(exa1.Xs) = ((exa1.jwl)/da) + ((av*b)/R*T)*(exa1.pwg - pwsat
    );
  //________________________________________________________________________
  //
  //
  //
  //__________________________________________________________PORE EQUATIONS
  Ega = Ego*(1 - (exa1.Xs/Xsmax));
  Xsmax = (roh2ol/ros)*(1 - Es)/(Es);
  Es + Ego = 1;
  //________________________________________________________________________
  //
  //
  //
  //__________________________________SATURATION PRESSURE OF WATER EQUATIONS
  pwsat = posat*exp(((1/Tosat) - (1/T))*Lv*massh2o/R);
  Lv = (1.73287e6) + (1.03001e-4)*T - (4.47755e1)*T^2 + (7.6629e-2)*T^3 - (
    5.5058e-5)*T^4;
  //________________________________________________________________________
  //
  //
  //
end vc_dif;
