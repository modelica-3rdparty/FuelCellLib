model tp_dif_mid
  constant Units.MolarGasConstant R=8.30824;
  constant SI.MolarMass massh2o=18e-3;
  constant SI.FaradayConstant F=96485;

  outer parameter Units.factor tau;
  outer parameter Units.volpore Es;
  outer parameter SI.Length da=da/2;
  outer parameter SI.Temp_K T;
  outer parameter SI.DiffusionCoefficient Dwl;
  outer parameter SI.Conductivity ks;
  outer parameter SI.Conductivity kp;
  outer parameter SI.Density ros;
  outer parameter SI.Density roh2ol;
  outer parameter SI.DiffusionCoefficient D1co;
  outer parameter SI.DiffusionCoefficient D2co;
  outer parameter SI.Length rp;
  outer parameter SI.DiffusionCoefficient D12o;
  outer parameter SI.Pressure pAref;
  outer parameter SI.Temp_K Tref;

  outer parameter Units.factor ModHyp2;

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
  exac exa1 annotation (extent=[-114, 28; -46, -30]);
  exac exa2 annotation (extent=[-14, -28; 54, 32]);
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

  Ega = Ego*(1 - (Xs_/Xsmax));
  Xsmax = (roh2ol/ros)*(1 - Es)/Es;
  Es = 1 - Ego;

  D12 = D12o*(pA/pAref)*(T/Tref)^1.5;
  //A.A.Kulikovsky, Fuel Cells 2001,1(2)

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

  ((Ega/(tau)^2)*(exa2.p - exa1.p)/da) = -((R*T)/(D12*pA*Es/tau))*((exa1.j*
    ph2o_) - (exa1.jwg*p_)) - (R*T)*exa1.j/(D1);
  ((Es/(tau)^2)*(exa2.pwg - exa1.pwg)/da) = -((R*T)/(D12*pA*Es/tau))*(-(exa1.j*
    ph2o_) + (exa1.jwg*p_)) - (R*T)*exa1.jwg/(D2);

  exa1.jwl = -((ros/massh2o)*Dwl*(exa2.Xs - exa1.Xs)/da);
  exa1.je = ks*(exa2.vs - exa1.vs)/da;
  annotation (Icon(
      Rectangle(extent=[-68, 44; 0, -48], style(gradient=1, fillColor=6)),
      Text(
        extent=[-70, 44; 2, -14],
        style(gradient=1, fillColor=1),
        string="TP ACT"),
      Polygon(points=[-68, 44; -54, 58; 0, 58; 0, 44; -68, 44], style(color=1,
            fillColor=6)),
      Polygon(points=[-100, 20; -82, 32; -68, 32; -68, 20; -100, 20], style(
          color=1,
          gradient=1,
          fillColor=2)),
      Polygon(points=[0, 20; 0, 32; 16, 32; 32, 20; 0, 20], style(
          color=1,
          gradient=1,
          fillColor=2)),
      Text(extent=[-68, -34; -2, 2], string="1/2")), Documentation(info="<html>

<H2 align=center>tp_dif_mid-Basics</H2>
<IMG SRC=FuelCellLib.Basics.tp_dif_midI.png WIDTH=100>
<br><br><br>
<H4>
tp_dif_mid is a semi-transport phenomena of difusion layer, these are placed in the ends of the diffusion layer.<br>
This class shares the equations with complete transport phenomena, but \"da: length of transport phenomena\" pararameter is the half.
<br>
The complete length of the layer will be:<br><br>
D=(n*da)+(2*(da/2))
</H4>
<br><br><br>
<H2 align=center><IMG SRC=FuelCellLib.Layer1D.dif_layerD.png WIDTH=200></H2>

</html>"));
end tp_dif_mid;
