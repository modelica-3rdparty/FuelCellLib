model mv_mem
  annotation (
    Diagram,
    Icon(
      Ellipse(extent=[-32, 46; 54, -38], style(color=0, gradient=1)),
      Line(points=[-20, 32; -34, 36; -44, 34; -46, 30; -44, 22; -40, 12; -34, 6
            ; -26, -2; -6, -16; 16, -28; 40, -36; 52, -36; 58, -32; 58, -30; 58
            , -26; 52, -14; 50, -12], style(color=0, gradient=1)),
      Ellipse(extent=[-48, 24; -34, 10], style(color=0, gradient=1)),
      Line(points=[8, 46; 6, 50; 0, 56; -8, 58; -12, 52; -14, 44; -14, 34; -10
            , 10; -2, -6; 14, -30; 28, -40; 34, -42; 38, -36; 38, -28], style(
            color=0, gradient=1)),
      Ellipse(extent=[-12, 8; 4, -6], style(color=0, gradient=1))),
    Documentation(info="<html>
<H4>
<H2 align=center>mv_mem-Layer1D</H2>
<IMG SRC=FuelCellLib.Layer1D.mv_memI.png WIDTH=100>
<br><br><br>

mv_mem class is a minimum (transport-control volume) phenomena unit to form mem_layer
</H4>
<br><br><br>
<H2 align=center><IMG SRC=FuelCellLib.Layer1D.mv_memD.png WIDTH=100></H2>

</html>"));
  Basics.vc_mem vc_mem1 annotation (extent=[-68, 22; -48, 42]);
  Basics.tp_mem tp_mem1 annotation (extent=[-44, 4; -24, 24]);
equation
  connect(vc_mem1.exa1, tp_mem1.exa1) annotation (points=[-58, 24; -58, 16; -42
        , 16], style(gradient=1, fillColor=58));
end mv_mem;
