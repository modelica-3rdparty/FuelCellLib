model tp_mem_mid

  constant Units.MolarGasConstant R=8.30824;
  constant SI.MolarMass massh2o=18e-3;
  constant SI.FaradayConstant F=96485;

  outer parameter Units.factor tau;
  outer parameter Units.volpore Ee;
  outer parameter SI.Length da=da/2;
  outer parameter SI.Temp_K T;
  outer parameter SI.DiffusionCoefficient D2;
  outer parameter SI.DiffusionCoefficient Dwl;
  outer parameter SI.Conductivity ks;
  outer parameter SI.Density rom;
  outer parameter SI.Conductivity kpo;
  outer parameter SI.Density roh2ol;
  outer parameter SI.Pressure posat;
  outer parameter SI.Temp_K Tosat;
  outer parameter SI.MolarMass Mm;

  Units.volpore Xs_;
  SI.Pressure p_;
  SI.Pressure ph2o_;
  Units.Wload Xsmax;
  Units.volpore Ega;
  Units.volpore Ego;
  Units.factor ndrag;
  Units.factor LSO3;
  SI.Conductivity kp;

  outer parameter Units.factor ModHyp3;
  outer parameter Units.factor ModHyp4;
  exac exa1 annotation (extent=[-114, 30; -46, -28]);
  exac exa2 annotation (extent=[-14, -26; 54, 34]);
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

  Ega = Ego*(1 - (Xs_/Xsmax));
  Xsmax = (roh2ol/rom)*(1 - Ee)/Ee;
  Ee = 1 - Ego;

  exa1.jp = -kp*(exa2.ve - exa1.ve)/da;
  (Ega/(tau)^2)*(exa2.pwg - exa1.pwg)/da = -((R*T)*exa1.jwg)/D2;

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
  //S.Dutta, S.Shimpalee,J.Appl.Electrochem.(2000),

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
      Rectangle(extent=[-68, 46; 0, -46], style(gradient=1, fillColor=77)),
      Text(
        extent=[-70, 46; 2, -12],
        string="TP ACT",
        style(
          color=6,
          gradient=1,
          fillColor=1)),
      Polygon(points=[-68, 46; -54, 60; 0, 60; 0, 46; -68, 46], style(color=1,
            fillColor=77)),
      Polygon(points=[-100, 22; -82, 34; -68, 34; -68, 22; -100, 22], style(
          color=1,
          gradient=1,
          fillColor=2)),
      Polygon(points=[0, 22; 0, 34; 16, 34; 32, 22; 0, 22], style(
          color=1,
          gradient=1,
          fillColor=2)),
      Text(
        extent=[-68, -32; -2, 4],
        string="1/2",
        style(color=6))), Documentation(info="<html>

<H2 align=center>tp_mem_mid-Basics</H2>
<IMG SRC=FuelCellLib.Basics.tp_mem_midI.png WIDTH=100>
<br><br><br>
<H4>
tp_mem_mid is a semi-transport phenomena of membrane layer, these are placed in the ends of the membrane layer.<br>
This class shares the equations with complete transport phenomena, but \"da: length of transport phenomena\" pararameter is the half.
<br>
The complete length of the layer will be:<br><br>
D=(n*da)+(2*(da/2))
</H4>
<br><br><br>
<H2 align=center><IMG SRC=FuelCellLib.Layer1D.mem_layerD.png WIDTH=200></H2>
</html>"));
end tp_mem_mid;
