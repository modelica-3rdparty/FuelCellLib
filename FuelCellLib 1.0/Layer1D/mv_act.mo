model mv_act

  Basics.tp_act tp_act1 annotation (extent=[-8, -4; 12, 16]);
  Basics.vc_act vc_act1 annotation (extent=[-30, 10; -10, 30]);
  annotation (
    Diagram,
    Icon(
      Ellipse(extent=[-28, 44; 58, -40], style(
          color=0,
          gradient=1,
          fillColor=1)),
      Line(points=[-16, 30; -30, 34; -40, 32; -42, 28; -40, 20; -36, 10; -30, 4
            ; -22, -4; -2, -18; 20, -30; 44, -38; 56, -38; 62, -34; 62, -32; 62
            , -28; 56, -16; 54, -14], style(
          color=0,
          gradient=1,
          fillColor=1)),
      Ellipse(extent=[-44, 22; -30, 8], style(
          color=0,
          gradient=1,
          fillColor=1)),
      Line(points=[12, 44; 10, 48; 4, 54; -4, 56; -8, 50; -10, 42; -10, 32; -6
            , 8; 2, -8; 18, -32; 32, -42; 38, -44; 42, -38; 42, -30], style(
          color=0,
          gradient=1,
          fillColor=1)),
      Ellipse(extent=[-8, 6; 8, -8], style(
          color=0,
          gradient=1,
          fillColor=1))),
    Documentation(info="<html>

<H2 align=center>mv_act-Layer1D</H2>
<IMG SRC=FuelCellLib.Layer1D.mv_actI.png WIDTH=100>
<br><br><br>
<H4>
mv_act class is a minimum (transport-control volume) phenomena unit to form act_layer
</H4>
<br><br><br>
<H2 align=center><IMG SRC=FuelCellLib.Layer1D.mv_actD.png WIDTH=100></H2>

</html>"));
equation

  connect(vc_act1.exa1, tp_act1.exa1) annotation (points=[-20, 12; -20, 6; -6,
        6]);
end mv_act;
