model tp_act_mid

  constant Units.MolarGasConstant R=8.30824;
  constant SI.MolarMass massh2o=18e-3;
  constant SI.FaradayConstant F=96485;

  outer parameter Units.factor tau;
  outer parameter Units.volpore Es;
  outer parameter Units.volpore Ee;
  outer parameter SI.Length da=da/2;
  outer parameter SI.Temp_K T;
  outer parameter SI.DiffusionCoefficient Dwl;
  outer parameter SI.Conductivity ks;
  outer parameter SI.Density rom;
  outer parameter SI.Density ros;
  outer parameter SI.Conductivity kpo;
  outer parameter SI.Density roh2ol;
  outer parameter SI.Pressure posat;
  outer parameter SI.Temp_K Tosat;
  outer parameter SI.DiffusionCoefficient D1co;
  outer parameter SI.DiffusionCoefficient D2co;
  outer parameter SI.Length rp;
  outer parameter SI.DiffusionCoefficient D12o;
  outer parameter SI.Pressure pAref;
  outer parameter SI.Temp_K Tref;
  outer parameter SI.MolarMass Mm;

  outer parameter Units.factor ModHyp2;
  outer parameter Units.factor ModHyp3;
  outer parameter Units.factor ModHyp4;

  Units.factor LSO3;
  SI.DiffusionCoefficient D1;
  SI.DiffusionCoefficient D2;
  SI.DiffusionCoefficient D12;
  Units.volpore Xs_;
  SI.Pressure p_;
  SI.Pressure ph2o_;
  SI.Pressure pA;
  Units.Wload Xsmax;
  Units.volpore Ega;
  Units.volpore Ego;
  Units.factor ndrag;
  SI.Conductivity kp;

  exac exa1 annotation (extent=[-114, 26; -46, -32]);
  exac exa2 annotation (extent=[-14, -30; 54, 30]);
equation
  exa1.j = -exa2.j;

  exa1.jwg = -exa2.jwg;

  exa1.jwl = -exa2.jwl;

  exa1.je = -exa2.je;

  exa1.jp = -exa2.jp;

  Xs_ = if exa1.jwl > 0 then exa1.Xs else exa2.Xs;
  p_ = if exa1.j > 0 then exa1.p else exa2.p;
  ph2o_ = if exa1.jwg > 0 then exa1.pwg else exa2.pwg;
  pA = p_ + ph2o_;

  Ega = Ego*(1 - (Xs_/Xsmax));
  Xsmax = (roh2ol/((ros*Es) + (rom*Ee)))*(1 - Es - Ee)/Es;
  Es = 1 - Ego - Ee;

  exa1.jp = -kp*Ee*(exa2.ve - exa1.ve)/da;

  D12 = D12o*(pA/pAref)*(T/Tref)^1.5;
  //A.A.Kulikovsky, Fuel Cells 2001,1(2)

  //*******************************************************************
  //HYP2------>Case 1:  No Pore size dependence
  //*******************************************************************
  if not ModHyp2 == 1 then
    D1 = D1co;
    D2 = D2co;
  end if;
  //*******************************************************************

  //*******************************************************************
  //HYP2------>Case 2:  Pore size dependence
  //*******************************************************************
  if ModHyp2 == 1 then
    D1 = (4/3)*rp*sqrt(2*R*T/(3.1416*0.016));
    D2 = (4/3)*rp*sqrt(2*R*T/(3.1416*0.018));
  end if;
  //*******************************************************************

  ((Ega/(tau)^2)*(exa2.p - exa1.p)/da) = -((R*T)/(D12*pA*Es/tau))*((exa1.j*
    ph2o_) - (exa1.jwg*p_)) - (R*T)*exa1.j/(D1);
  ((Es/(tau)^2)*(exa2.pwg - exa1.pwg)/da) = -((R*T)/(D12*pA*Es/tau))*(-(exa1.j*
    ph2o_) + (exa1.jwg*p_)) - (R*T)*exa1.jwg/(D2);

  exa1.je = ks*(exa2.vs - exa1.vs)/da;

  //LSO3 = Xs_/((rom/Mm) - (0.0126*Xs_));
  //T.E.Springer, T.A.Zawodzinsky, J.Electrochem.Soc.138(1991)
  LSO3 = 14;
  //Measured value of Lambda=14 with saturated water vapor at 30ºC
  //T.E.Springer, T.A.Zawodzinsky, J.Electrochem.Soc.138(1991)

  //**************Springer electro-osmotic drag coefficient
  ndrag = 2.5*LSO3*Ee/22;
  //T.E.Springer, T.A.Zawodzinsky, J.Electrochem.Soc.138(1991)
  //**************Dutta electro-osmotic drag coefficient
  //ndrag=(0.0029*LSO3^2)+(0.05*LSO3)-(3.4e-19);
  //S.Dutta, S.Shimpalee,J.Appl.Electrochem.(2000), 30(2)

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
    kp = exp(1268*((1/303) - (1/(273 - T))))*((0.005139*LSO3) - 0.00326);
    //T.E.Springer, T.A.Zawodzinsky, J.Electrochem.Soc.138(1991)
  end if;
  //*******************************************************************

  annotation (Icon(
      Rectangle(extent=[-68, 42; 0, -50], style(gradient=1, fillColor=1)),
      Text(
        extent=[-70, 42; 2, -16],
        style(gradient=1, fillColor=1),
        string="TP ACT"),
      Polygon(points=[-68, 42; -54, 56; 0, 56; 0, 42; -68, 42], style(
          color=1,
          gradient=1,
          fillColor=1)),
      Polygon(points=[-100, 18; -82, 30; -68, 30; -68, 18; -100, 18], style(
          color=1,
          gradient=1,
          fillColor=2)),
      Polygon(points=[0, 18; 0, 30; 16, 30; 32, 18; 0, 18], style(
          color=1,
          gradient=1,
          fillColor=2)),
      Text(extent=[-68, -36; -2, 0], string="1/2")), Documentation(info="<html>

<H2 align=center>tp_act_mid-Basics</H2>
<IMG SRC=FuelCellLib.Basics.tp_act_midI.png WIDTH=100>
<br><br><br>

<H4>
tp_act_mid is a semi-transport phenomena of active layer, these are placed in the ends of the active layer.<br>
This class shares the equations with complete transport phenomena, but \"da: length of transport phenomena\" pararameter is the half.<br>
The complete length of the layer will be:<br><br>
D=(n*da)+(2*(da/2))
</H4>
<br><br><br>
<H2 align=center><IMG SRC=FuelCellLib.Layer1D.act_layerD.png WIDTH=200></H2>

</html>"));
end tp_act_mid;
