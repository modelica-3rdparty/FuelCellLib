connector exac
  SI.Pressure p(start=100000) "Oxigen pressure";
  SI.Pressure pwg(start=100000) "H2O steam phase pressure";
  SI.Voltage vs "electric potencial in the solid";
  SI.Voltage ve "electric potencial in the membrane";
  Units.Wload Xs(start=0.00) "liquid water loading";
  flow Units.molarF j "oxigen molar flux";
  flow Units.molarF jp "protonic flux density";
  flow Units.molarF jwg "steam water molar flux";
  flow SI.Current je "electronic current density";
  flow Units.molarF jwl "liquid water flux";
  annotation (
    Diagram,
    Icon(Rectangle(extent=[-60, 60; 36, -76], style(gradient=1, fillColor=58)))
      ,
    Documentation(info=""));
end exac;
