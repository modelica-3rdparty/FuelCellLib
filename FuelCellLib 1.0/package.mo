encapsulated package FuelCellLib


import inter = Modelica.Electrical.Analog.Interfaces;


import elec = Modelica.Electrical.Analog.Basic;


import SI = Modelica.SIunits;


import nonSI = Modelica.SIunits.Conversions.NonSIunits;


annotation (
  Window(
    x=0.03,
    y=0.02,
    width=0.24,
    height=0.45,
    library=1,
    autolayout=1),
  Documentation(info="<html>

<H2 align=center><i>FuelCell</i>Lib - Modeling of Fuel cells</H2>
<H4 align=center>Release 1.0 (January, 2005)</H4><BR><BR>

<b>Author</b><br>
<i>Miguel Angel Rubio</i><br>
Instituto de Automatica Industrial,(IAI), CSIC<br>
email: <A HREF=\"mailto:marubio@iai.csic.es\">marubio@iai.csic.es</A>,<BR><BR><BR><BR>

</HTML>
"),
  Icon(
    Rectangle(extent=[-98, 20; 8, -82], style(gradient=2, fillColor=53)),
    Rectangle(extent=[-18, 92; 98, -14], style(gradient=2, fillColor=1)),
    Text(
      extent=[-78, -48; 78, 54],
      string="FuelCellLib",
      style(
        color=7,
        fillColor=1,
        fillPattern=1))));


package Units

  type volpore = Real (final quantity="pore volume");

  type molarF = Real (
      final quantity="molar flux of the component",
      final unit="mol/m-2s-1",
      displayUnit="mol/m-2s-1");

  type Wload = Real (
      final quantity="Water loading",
      final unit="KgH2O/Kgsolid",
      displayUnit="KgH2O/Kgsolid");

  type EnthalpyxMol = Real (
      final quantity="Molar Enthalpy",
      final unit="J/mol",
      displayUnit="J/mol");

  type factor = Real;

  type TafelSlope = SI.Voltage;

  type c_diff = Real (
      final quantity="diffusion coeffient",
      final unit="m2/s",
      displayUnit="m2/s");

  type MolarGasConstant = Real (
      final quantity="molar gas constant",
      final unit="J/mol K",
      displayUnit="J/mol K");

  type beta = Real (
      final quantity="Material Transfer coeffient",
      final unit="m/s",
      displayUnit="m/s");

  type alfav = Real (
      final quantity="Specific condensation surface",
      final unit="m2/m3",
      displayUnit="m2/m3");

  type Aio = Real (
      final quantity=
          "specific active surface*exchange current density at open circuit potencial"
        ,
      final unit="A/m3",
      displayUnit="A/m3");
end Units;

end FuelCellLib;
