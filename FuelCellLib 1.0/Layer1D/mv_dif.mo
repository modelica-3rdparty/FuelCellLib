model mv_dif

  annotation (
    Diagram,
    Icon(
      Ellipse(extent=[-28, 44; 58, -40], style(
          color=0,
          gradient=1,
          fillColor=6)),
      Line(points=[-16, 30; -30, 34; -40, 32; -42, 28; -40, 20; -36, 10; -30, 4
            ; -22, -4; -2, -18; 20, -30; 44, -38; 56, -38; 62, -34; 62, -32; 62
            , -28; 56, -16; 54, -14], style(
          color=0,
          gradient=1,
          fillColor=6)),
      Ellipse(extent=[-44, 22; -30, 8], style(
          color=0,
          gradient=1,
          fillColor=6)),
      Line(points=[12, 44; 10, 48; 4, 54; -4, 56; -8, 50; -10, 42; -10, 32; -6
            , 8; 2, -8; 18, -32; 32, -42; 38, -44; 42, -38; 42, -30], style(
          color=0,
          gradient=1,
          fillColor=6)),
      Ellipse(extent=[-8, 6; 8, -8], style(
          color=0,
          gradient=1,
          fillColor=6))),
    Documentation(info="<html>
<H4>
<H2 align=center>mv_dif-Layer1D</H2>
<IMG SRC=FuelCellLib.Layer1D.mv_difI.png WIDTH=100>
<br><br><br>

mv_dif class is a minimum (transport-control volume) phenomena unit to form dif_layer
</H4>
<br><br><br>
<H2 align=center><IMG SRC=FuelCellLib.Layer1D.mv_difD.png WIDTH=70></H2>

</html>"));
  Basics.vc_dif vc_dif1 annotation (extent=[-52, 24; -32, 44]);
  Basics.tp_dif tp_dif1 annotation (extent=[-44, 4; -24, 24]);
equation

  connect(vc_dif1.exa1, tp_dif1.exa1) annotation (points=[-42, 30; -42, 14],
      style(gradient=3, fillColor=6));
end mv_dif;
