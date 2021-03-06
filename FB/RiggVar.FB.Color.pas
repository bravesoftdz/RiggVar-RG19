﻿unit RiggVar.FB.Color;

interface

uses
  Graphics;

type
  TRggColor = TColor;

  TRggColors = class
  public
    class var
    Aliceblue: TRggColor;
    Antiquewhite: TRggColor;
    Aqua: TRggColor;
    Aquamarine: TRggColor;
    Azure: TRggColor;
    Beige: TRggColor;
    Bisque: TRggColor;
    Black: TRggColor;
    Blanchedalmond: TRggColor;
    Blue: TRggColor;
    Blueviolet: TRggColor;
    Brown: TRggColor;
    Burlywood: TRggColor;
    Cadetblue: TRggColor;
    Chartreuse: TRggColor;
    Chocolate: TRggColor;
    Coral: TRggColor;
    Cornflowerblue: TRggColor;
    Cornsilk: TRggColor;
    Crimson: TRggColor;
    Cyan: TRggColor;
    Darkblue: TRggColor;
    Darkcyan: TRggColor;
    Darkgoldenrod: TRggColor;
    Darkgray: TRggColor;
    Darkgreen: TRggColor;
    Darkgrey: TRggColor;
    Darkkhaki: TRggColor;
    Darkmagenta: TRggColor;
    Darkolivegreen: TRggColor;
    Darkorange: TRggColor;
    Darkorchid: TRggColor;
    Darkred: TRggColor;
    Darksalmon: TRggColor;
    Darkseagreen: TRggColor;
    Darkslateblue: TRggColor;
    Darkslategray: TRggColor;
    Darkslategrey: TRggColor;
    Darkturquoise: TRggColor;
    Darkviolet: TRggColor;
    Deeppink: TRggColor;
    Deepskyblue: TRggColor;
    Dimgray: TRggColor;
    Dimgrey: TRggColor;
    Dodgerblue: TRggColor;
    Firebrick: TRggColor;
    Floralwhite: TRggColor;
    Forestgreen: TRggColor;
    Fuchsia: TRggColor;
    Gainsboro: TRggColor;
    Ghostwhite: TRggColor;
    Gold: TRggColor;
    Goldenrod: TRggColor;
    Gray: TRggColor;
    Green: TRggColor;
    Greenyellow: TRggColor;
    Grey: TRggColor;
    Honeydew: TRggColor;
    Hotpink: TRggColor;
    Indianred: TRggColor;
    Indigo: TRggColor;
    Ivory: TRggColor;
    Khaki: TRggColor;
    Lavender: TRggColor;
    Lavenderblush: TRggColor;
    Lawngreen: TRggColor;
    Lemonchiffon: TRggColor;
    Lightblue: TRggColor;
    Lightcoral: TRggColor;
    Lightcyan: TRggColor;
    Lightgoldenrodyellow: TRggColor;
    Lightgray: TRggColor;
    Lightgreen: TRggColor;
    Lightgrey: TRggColor;
    Lightpink: TRggColor;
    Lightsalmon: TRggColor;
    Lightseagreen: TRggColor;
    Lightskyblue: TRggColor;
    Lightslategray: TRggColor;
    Lightslategrey: TRggColor;
    Lightsteelblue: TRggColor;
    Lightyellow: TRggColor;
    LtGray: TRggColor;
    MedGray: TRggColor;
    DkGray: TRggColor;
    MoneyGreen: TRggColor;
    LegacySkyBlue: TRggColor;
    Cream: TRggColor;
    Lime: TRggColor;
    Limegreen: TRggColor;
    Linen: TRggColor;
    Magenta: TRggColor;
    Maroon: TRggColor;
    Mediumaquamarine: TRggColor;
    Mediumblue: TRggColor;
    Mediumorchid: TRggColor;
    Mediumpurple: TRggColor;
    Mediumseagreen: TRggColor;
    Mediumslateblue: TRggColor;
    Mediumspringgreen: TRggColor;
    Mediumturquoise: TRggColor;
    Mediumvioletred: TRggColor;
    Midnightblue: TRggColor;
    Mintcream: TRggColor;
    Mistyrose: TRggColor;
    Moccasin: TRggColor;
    Navajowhite: TRggColor;
    Navy: TRggColor;
    Oldlace: TRggColor;
    Olive: TRggColor;
    Olivedrab: TRggColor;
    Orange: TRggColor;
    Orangered: TRggColor;
    Orchid: TRggColor;
    Palegoldenrod: TRggColor;
    Palegreen: TRggColor;
    Paleturquoise: TRggColor;
    Palevioletred: TRggColor;
    Papayawhip: TRggColor;
    Peachpuff: TRggColor;
    Peru: TRggColor;
    Pink: TRggColor;
    Plum: TRggColor;
    Powderblue: TRggColor;
    Purple: TRggColor;
    Red: TRggColor;
    Rosybrown: TRggColor;
    Royalblue: TRggColor;
    Saddlebrown: TRggColor;
    Salmon: TRggColor;
    Sandybrown: TRggColor;
    Seagreen: TRggColor;
    Seashell: TRggColor;
    Sienna: TRggColor;
    Silver: TRggColor;
    Skyblue: TRggColor;
    Slateblue: TRggColor;
    Slategray: TRggColor;
    Slategrey: TRggColor;
    Snow: TRggColor;
    Springgreen: TRggColor;
    Steelblue: TRggColor;
    Tan: TRggColor;
    Teal: TRggColor;
    Thistle: TRggColor;
    Tomato: TRggColor;
    Turquoise: TRggColor;
    Violet: TRggColor;
    Wheat: TRggColor;
    White: TRggColor;
    Whitesmoke: TRggColor;
    Yellow: TRggColor;
    Yellowgreen: TRggColor;

    WindowWhite: TRggColor;
    ColorF9F9F9: TRggColor;
    Color372E69: TRggColor;
    Color333333: TRggColor;

    Null: TRggColor;

  public
    class constructor Create;
    class function ColorFromRGB(R, G, B: Byte): TRggColor;
  end;

implementation

  class constructor TRggColors.Create;
  begin
//    Null := TColor($00000000);
    Null := TColor($FFFFFF);

    WindowWhite := TColor($F0F0F0);

    ColorF9F9F9 := TColor($F9F9F9);
    Color372E69 := TColor($372E69);
    Color333333 := TColor($333333);

    Aliceblue := TColor($FFF8F0);
    Antiquewhite := TColor($D7EBFA);
    Aqua := TColor($FFFF00);
    Aquamarine := TColor($D4FF7F);
    Azure := TColor($FFFFF0);
    Beige := TColor($DCF5F5);
    Bisque := TColor($C4E4FF);
    Black := TColor($000000);
    Blanchedalmond := TColor($CDEBFF);
    Blue := TColor($FF0000);
    Blueviolet := TColor($E22B8A);
    Brown := TColor($2A2AA5);
    Burlywood := TColor($87B8DE);
    Cadetblue := TColor($A09E5F);
    Chartreuse := TColor($00FF7F);
    Chocolate := TColor($1E69D2);
    Coral := TColor($507FFF);
    Cornflowerblue := TColor($ED9564);
    Cornsilk := TColor($DCF8FF);
    Crimson := TColor($3C14DC);
    Cyan := TColor($FFFF00);
    Darkblue := TColor($8B0000);
    Darkcyan := TColor($8B8B00);
    Darkgoldenrod := TColor($0B86B8);
    Darkgray := TColor($A9A9A9);
    Darkgreen := TColor($006400);
    Darkgrey := TColor($A9A9A9);
    Darkkhaki := TColor($6BB7BD);
    Darkmagenta := TColor($8B008B);
    Darkolivegreen := TColor($2F6B55);
    Darkorange := TColor($008CFF);
    Darkorchid := TColor($CC3299);
    Darkred := TColor($00008B);
    Darksalmon := TColor($7A96E9);
    Darkseagreen := TColor($8FBC8F);
    Darkslateblue := TColor($8B3D48);
    Darkslategray := TColor($4F4F2F);
    Darkslategrey := TColor($4F4F2F);
    Darkturquoise := TColor($D1CE00);
    Darkviolet := TColor($D30094);
    Deeppink := TColor($9314FF);
    Deepskyblue := TColor($FFBF00);
    Dimgray := TColor($696969);
    Dimgrey := TColor($696969);
    Dodgerblue := TColor($FF901E);
    Firebrick := TColor($2222B2);
    Floralwhite := TColor($F0FAFF);
    Forestgreen := TColor($228B22);
    Fuchsia := TColor($FF00FF);
    Gainsboro := TColor($DCDCDC);
    Ghostwhite := TColor($FFF8F8);
    Gold := TColor($00D7FF);
    Goldenrod := TColor($20A5DA);
    Gray := TColor($808080);
    Green := TColor($008000);
    Greenyellow := TColor($2FFFAD);
    Grey := TColor($808080);
    Honeydew := TColor($F0FFF0);
    Hotpink := TColor($B469FF);
    Indianred := TColor($5C5CCD);
    Indigo := TColor($82004B);
    Ivory := TColor($F0FFFF);
    Khaki := TColor($8CE6F0);
    Lavender := TColor($FAE6E6);
    Lavenderblush := TColor($F5F0FF);
    Lawngreen := TColor($00FC7C);
    Lemonchiffon := TColor($CDFAFF);
    Lightblue := TColor($E6D8AD);
    Lightcoral := TColor($8080F0);
    Lightcyan := TColor($FFFFE0);
    Lightgoldenrodyellow := TColor($D2FAFA);
    Lightgray := TColor($D3D3D3);
    Lightgreen := TColor($90EE90);
    Lightgrey := TColor($D3D3D3);
    Lightpink := TColor($C1B6FF);
    Lightsalmon := TColor($7AA0FF);
    Lightseagreen := TColor($AAB220);
    Lightskyblue := TColor($FACE87);
    Lightslategray := TColor($998877);
    Lightslategrey := TColor($998877);
    Lightsteelblue := TColor($DEC4B0);
    Lightyellow := TColor($E0FFFF);
    LtGray := TColor($C0C0C0);
    MedGray := TColor($A4A0A0);
    DkGray := TColor($808080);
    MoneyGreen := TColor($C0DCC0);
    LegacySkyBlue := TColor($F0CAA6);
    Cream := TColor($F0FBFF);
    Lime := TColor($00FF00);
    Limegreen := TColor($32CD32);
    Linen := TColor($E6F0FA);
    Magenta := TColor($FF00FF);
    Maroon := TColor($000080);
    Mediumaquamarine := TColor($AACD66);
    Mediumblue := TColor($CD0000);
    Mediumorchid := TColor($D355BA);
    Mediumpurple := TColor($DB7093);
    Mediumseagreen := TColor($71B33C);
    Mediumslateblue := TColor($EE687B);
    Mediumspringgreen := TColor($9AFA00);
    Mediumturquoise := TColor($CCD148);
    Mediumvioletred := TColor($8515C7);
    Midnightblue := TColor($701919);
    Mintcream := TColor($FAFFF5);
    Mistyrose := TColor($E1E4FF);
    Moccasin := TColor($B5E4FF);
    Navajowhite := TColor($ADDEFF);
    Navy := TColor($800000);
    Oldlace := TColor($E6F5FD);
    Olive := TColor($008080);
    Olivedrab := TColor($238E6B);
    Orange := TColor($00A5FF);
    Orangered := TColor($0045FF);
    Orchid := TColor($D670DA);
    Palegoldenrod := TColor($AAE8EE);
    Palegreen := TColor($98FB98);
    Paleturquoise := TColor($EEEEAF);
    Palevioletred := TColor($9370DB);
    Papayawhip := TColor($D5EFFF);
    Peachpuff := TColor($B9DAFF);
    Peru := TColor($3F85CD);
    Pink := TColor($CBC0FF);
    Plum := TColor($DDA0DD);
    Powderblue := TColor($E6E0B0);
    Purple := TColor($800080);
    Red := TColor($0000FF);
    Rosybrown := TColor($8F8FBC);
    Royalblue := TColor($E16941);
    Saddlebrown := TColor($13458B);
    Salmon := TColor($7280FA);
    Sandybrown := TColor($60A4F4);
    Seagreen := TColor($578B2E);
    Seashell := TColor($EEF5FF);
    Sienna := TColor($2D52A0);
    Silver := TColor($C0C0C0);
    Skyblue := TColor($EBCE87);
    Slateblue := TColor($CD5A6A);
    Slategray := TColor($908070);
    Slategrey := TColor($908070);
    Snow := TColor($FAFAFF);
    Springgreen := TColor($7FFF00);
    Steelblue := TColor($B48246);
    Tan := TColor($8CB4D2);
    Teal := TColor($808000);
    Thistle := TColor($D8BFD8);
    Tomato := TColor($4763FF);
    Turquoise := TColor($D0E040);
    Violet := TColor($EE82EE);
    Wheat := TColor($B3DEF5);
    White := TColor($FFFFFF);
    Whitesmoke := TColor($F5F5F5);
    Yellow := TColor($00FFFF);
    Yellowgreen := TColor($32CD9A);
  end;

  class function TRggColors.ColorFromRGB(R, G, B: Byte): TRggColor;
  var
    c: Cardinal;
  begin
    c := R;
    c := c and (G shl 8);
    c := c and (B shl 16);
    result := TColor(c);

//    TColorRec(result).R := R;
//    TColorRec(result).G := G;
//    TColorRec(result).B := B;
  end;

end.
