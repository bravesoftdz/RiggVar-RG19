﻿unit Rggmat01;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Math,
  RggTypes,
  Vcl.Graphics,
  Vector3D;

const
  // pi = 3.14159265;
  maxvert = 400; // 30;
  maxcon = 1000; // 30;

type
  TRotationAngle = (raPhi, raTheta, raGamma, raXrot, raYrot, raZrot);

  TvertArrayF = array [0 .. maxvert] of single;
  TvertArrayI = array [0 .. maxvert] of Integer;
  TconArray = array [0 .. maxcon] of Integer;
  TconColors = array [0 .. 15] of TColor;

  Matrix4x4 = array [1 .. 4, 1 .. 4] of double;

  TMatrix4x4 = class(TObject)
  private
    Fmat: Matrix4x4;
  public
    constructor Create;
    procedure GetLocals(var ux, uy, uz: vec3);
    procedure Identity;
    procedure SetIdentity(var m: Matrix4x4);
    procedure Multiply(m: Matrix4x4);
    procedure PreMultiply(m: Matrix4x4);
    procedure transpose;
    procedure translate(tx, ty, tz: double);
    procedure translateDirect(tx, ty, tz: double);
    procedure scaleCenter(sx, sy, sz: double; center: vec3);
    procedure scale(f: double);
    procedure scaleXYZ(xf, yf, zf: double);
    procedure xrot(Theta: double);
    procedure yrot(Theta: double);
    procedure zrot(Theta: double);
    procedure rotate(p1, p2: vec3; angle: double);
    procedure transformPoint(var point: vec3);
    procedure transform(var v: TvertArrayF; var tv: TvertArrayI; nvert: Integer);
    procedure transformF(var v: TvertArrayF; var tv: TvertArrayF; nvert: Integer);
    procedure copyFrom(m: TMatrix4x4);
    property mat: Matrix4x4 read Fmat write Fmat;
  end;

  TRotaData = record
    Xpos: Integer;
    Ypos: Integer;
    IncrementIndex: Integer;
    IncrementT: Integer;
    IncrementW: double;
    ZoomIndex: Integer;
    FixpunktIndex: Integer;
    Matrix: Matrix4x4;
  end;

  TRotaParams = class
  private
    FZoomBase: double;
    FZoomIndex: Integer;
    FIncrementIndex: Integer;
    procedure SetIncrementIndex(Value: Integer);
    procedure SetFixPunktIndex(Value: Integer);
    procedure SetZoomIndex(Value: Integer);
    function GetIncrementT: Integer;
    function GetIncrementW: double;
    function GetFixPunktIndex: Integer;
    function GetZoom: double;
  public
    Xpos: Integer;
    Ypos: Integer;
    FixPunkt: TRiggPoints;
    Phi, Theta, Gamma, Xrot, Yrot, Zrot: Integer;
    constructor Create;
    property IncrementIndex: Integer read FIncrementIndex write SetIncrementIndex;
    property FixPunktIndex: Integer read GetFixPunktIndex write SetFixPunktIndex;
    property ZoomIndex: Integer read FZoomIndex write SetZoomIndex;
    property IncrementT: Integer read GetIncrementT;
    property IncrementW: double read GetIncrementW;
    property Zoom: double read GetZoom;
  end;

const
  NullVec: vec3 = (x: 0; y: 0; z: 0);
  xVec: vec3 = (x: 1; y: 0; z: 0);
  yVec: vec3 = (x: 0; y: 1; z: 0);
  zVec: vec3 = (x: 0; y: 0; z: 1);

implementation

constructor TMatrix4x4.Create;
begin
  Identity;
end;

procedure TMatrix4x4.Identity;
begin
  SetIdentity(Fmat);
end;

procedure TMatrix4x4.SetIdentity(var m: Matrix4x4);
var
  r, c: Integer;
begin
  for r := 1 to 4 do
    for c := 1 to 4 do
      if r = c then
        m[r, c] := 1
      else
        m[r, c] := 0;
end;

procedure TMatrix4x4.copyFrom(m: TMatrix4x4);
begin
  Fmat := m.mat;
end;

{ die Transponierte ist die Inverse der Rotationsmatrix! }
procedure TMatrix4x4.transpose;
var
  tmp: double;
begin
  tmp := Fmat[1, 2];
  Fmat[1, 2] := Fmat[2, 1];
  Fmat[2, 1] := tmp;
  Fmat[1, 4] := 0;
  tmp := Fmat[2, 3];
  Fmat[2, 3] := Fmat[3, 2];
  Fmat[3, 2] := tmp;
  Fmat[2, 4] := 0;
  tmp := Fmat[3, 1];
  Fmat[3, 1] := Fmat[1, 3];
  Fmat[1, 3] := tmp;
  Fmat[3, 4] := 0;
end;

{ Premultiply this matrix by a second: M := L*M }
procedure TMatrix4x4.PreMultiply(m: Matrix4x4);
var
  r, c: Integer;
  tmp: Matrix4x4;
begin
  for r := 1 to 4 do
    for c := 1 to 4 do
      tmp[r, c] := m[r, 1] * Fmat[1, c] + m[r, 2] * Fmat[2, c] + m[r, 3] * Fmat
        [3, c] + m[r, 4] * Fmat[4, c];
  for r := 1 to 4 do
    for c := 1 to 4 do
      Fmat[r, c] := tmp[r, c];
end;

{ Multiply this matrix by a second: M := M*R }
procedure TMatrix4x4.Multiply(m: Matrix4x4);
var
  r, c: Integer;
  tmp: Matrix4x4;
begin
  for r := 1 to 4 do
    for c := 1 to 4 do
      tmp[r, c] := Fmat[r, 1] * m[1, c] + Fmat[r, 2] * m[2, c] + Fmat[r, 3] * m
        [3, c] + Fmat[r, 4] * m[4, c];
  for r := 1 to 4 do
    for c := 1 to 4 do
      Fmat[r, c] := tmp[r, c];
end;

procedure TMatrix4x4.scaleCenter(sx, sy, sz: double; center: vec3);
var
  m: Matrix4x4;
begin
  SetIdentity(m);
  m[1, 1] := sx;
  m[1, 4] := (1 - sx) * center.x;
  m[2, 2] := sy;
  m[2, 4] := (1 - sy) * center.y;
  m[3, 3] := sz;
  m[3, 4] := (1 - sz) * center.z;
  PreMultiply(m);
end;

procedure TMatrix4x4.scale(f: double);
begin
  Fmat[1, 1] := Fmat[1, 1] * f;
  Fmat[1, 2] := Fmat[1, 2] * f;
  Fmat[1, 3] := Fmat[1, 3] * f;
  Fmat[1, 4] := Fmat[1, 4] * f;
  Fmat[2, 1] := Fmat[2, 1] * f;
  Fmat[2, 2] := Fmat[2, 2] * f;
  Fmat[2, 3] := Fmat[2, 3] * f;
  Fmat[2, 4] := Fmat[2, 4] * f;
  Fmat[3, 1] := Fmat[3, 1] * f;
  Fmat[3, 2] := Fmat[3, 2] * f;
  Fmat[3, 3] := Fmat[3, 3] * f;
  Fmat[3, 4] := Fmat[3, 4] * f;
end;

{ Scale along each axis independently }
procedure TMatrix4x4.scaleXYZ(xf, yf, zf: double);
begin
  Fmat[1, 1] := Fmat[1, 1] * xf;
  Fmat[1, 2] := Fmat[1, 2] * xf;
  Fmat[1, 3] := Fmat[1, 3] * xf;
  Fmat[1, 4] := Fmat[1, 4] * xf;
  Fmat[2, 1] := Fmat[2, 1] * yf;
  Fmat[2, 2] := Fmat[2, 2] * yf;
  Fmat[2, 3] := Fmat[2, 3] * yf;
  Fmat[2, 4] := Fmat[2, 4] * yf;
  Fmat[3, 1] := Fmat[3, 1] * zf;
  Fmat[3, 2] := Fmat[3, 2] * zf;
  Fmat[3, 3] := Fmat[3, 3] * zf;
  Fmat[3, 4] := Fmat[3, 4] * zf;
end;

procedure TMatrix4x4.translate(tx, ty, tz: double);
var
  m: Matrix4x4;
begin
  SetIdentity(m);
  m[1, 4] := tx;
  m[2, 4] := ty;
  m[3, 4] := tz;
  PreMultiply(m);
end;

{ Translate the origin }
procedure TMatrix4x4.translateDirect(tx, ty, tz: double);
begin
  Fmat[1, 4] := Fmat[1, 4] + tx;
  Fmat[2, 4] := Fmat[2, 4] + ty;
  Fmat[3, 4] := Fmat[3, 4] + tz;
end;

procedure TMatrix4x4.rotate(p1, p2: vec3; angle: double);
var
  m: Matrix4x4;
  vec: vec3;
  s, sinA2, vecLength, a, b, c: double;
begin
  s := cos(angle / 2.0);
  vec.x := p2.x - p1.x;
  vec.y := p2.y - p1.y;
  vec.z := p2.z - p1.z;
  vecLength := sqrt(vec.x * vec.x + vec.y * vec.y + vec.z * vec.z);
  sinA2 := sin(angle / 2.0);
  a := sinA2 * vec.x / vecLength;
  b := sinA2 * vec.y / vecLength;
  c := sinA2 * vec.z / vecLength;
  translate(-p1.x, -p1.y, -p1.z);
  SetIdentity(m);
  m[1, 1] := 1.0 - 2 * b * b - 2 * c * c;
  m[1, 2] := 2 * a * b - 2 * s * c;
  m[1, 3] := 2 * a * c + 2 * s * b;
  m[2, 1] := 2 * a * b + 2 * s * c;
  m[2, 2] := 1.0 - 2 * a * a - 2 * c * c;
  m[2, 3] := 2 * b * c - 2 * s * a;
  m[3, 1] := 2 * a * c - 2 * s * b;
  m[3, 2] := 2 * b * c + 2 * s * a;
  m[3, 3] := 1.0 - 2 * a * a - 2 * b * b;
  PreMultiply(m);
  translate(p1.x, p1.y, p1.z);
end;

{ rotate theta degrees about the y axis }
procedure TMatrix4x4.yrot(Theta: double);
var
  ct, st: double;
  Nxx, Nxy, Nxz, Nxo, Nzx, Nzy, Nzz, Nzo: double;
begin
  Theta := Theta * (pi / 180);
  ct := cos(Theta);
  st := sin(Theta);

  Nxx := Fmat[1, 1] * ct + Fmat[3, 1] * st;
  Nxy := Fmat[1, 2] * ct + Fmat[3, 2] * st;
  Nxz := Fmat[1, 3] * ct + Fmat[3, 3] * st;
  Nxo := Fmat[1, 4] * ct + Fmat[3, 4] * st;

  Nzx := Fmat[3, 1] * ct - Fmat[1, 1] * st;
  Nzy := Fmat[3, 2] * ct - Fmat[1, 2] * st;
  Nzz := Fmat[3, 3] * ct - Fmat[1, 3] * st;
  Nzo := Fmat[3, 4] * ct - Fmat[1, 4] * st;

  Fmat[1, 4] := Nxo;
  Fmat[1, 1] := Nxx;
  Fmat[1, 2] := Nxy;
  Fmat[1, 3] := Nxz;
  Fmat[3, 4] := Nzo;
  Fmat[3, 1] := Nzx;
  Fmat[3, 2] := Nzy;
  Fmat[3, 3] := Nzz;
end;

{ rotate theta degrees about the x axis }
procedure TMatrix4x4.xrot(Theta: double);
var
  ct, st: double;
  Nyx, Nyy, Nyz, Nyo, Nzx, Nzy, Nzz, Nzo: double;
begin
  Theta := Theta * (pi / 180);
  ct := cos(Theta);
  st := sin(Theta);

  Nyx := Fmat[2, 1] * ct + Fmat[3, 1] * st;
  Nyy := Fmat[2, 2] * ct + Fmat[3, 2] * st;
  Nyz := Fmat[2, 3] * ct + Fmat[3, 3] * st;
  Nyo := Fmat[2, 4] * ct + Fmat[3, 4] * st;

  Nzx := Fmat[3, 1] * ct - Fmat[2, 1] * st;
  Nzy := Fmat[3, 2] * ct - Fmat[2, 2] * st;
  Nzz := Fmat[3, 3] * ct - Fmat[2, 3] * st;
  Nzo := Fmat[3, 4] * ct - Fmat[2, 4] * st;

  Fmat[2, 4] := Nyo;
  Fmat[2, 1] := Nyx;
  Fmat[2, 2] := Nyy;
  Fmat[2, 3] := Nyz;
  Fmat[3, 4] := Nzo;
  Fmat[3, 1] := Nzx;
  Fmat[3, 2] := Nzy;
  Fmat[3, 3] := Nzz;
end;

{ rotate theta degrees about the z axis }
procedure TMatrix4x4.zrot(Theta: double);
var
  ct, st: double;
  Nyx, Nyy, Nyz, Nyo, Nxx, Nxy, Nxz, Nxo: double;
begin
  Theta := Theta * (pi / 180);
  ct := cos(Theta);
  st := sin(Theta);

  Nyx := Fmat[2, 1] * ct + Fmat[1, 1] * st;
  Nyy := Fmat[2, 2] * ct + Fmat[1, 2] * st;
  Nyz := Fmat[2, 3] * ct + Fmat[1, 3] * st;
  Nyo := Fmat[2, 4] * ct + Fmat[1, 4] * st;

  Nxx := Fmat[1, 1] * ct - Fmat[2, 1] * st;
  Nxy := Fmat[1, 2] * ct - Fmat[2, 2] * st;
  Nxz := Fmat[1, 3] * ct - Fmat[2, 3] * st;
  Nxo := Fmat[1, 4] * ct - Fmat[2, 4] * st;

  Fmat[2, 4] := Nyo;
  Fmat[2, 1] := Nyx;
  Fmat[2, 2] := Nyy;
  Fmat[2, 3] := Nyz;
  Fmat[1, 4] := Nxo;
  Fmat[1, 1] := Nxx;
  Fmat[1, 2] := Nxy;
  Fmat[1, 3] := Nxz;
end;

procedure TMatrix4x4.transformPoint(var point: vec3);
var
  tmp: vec3;
begin
  with point do
  begin
    tmp.x := Fmat[1, 1] * x + Fmat[1, 2] * y + Fmat[1, 3] * z + Fmat[1, 4];
    tmp.y := Fmat[2, 1] * x + Fmat[2, 2] * y + Fmat[2, 3] * z + Fmat[2, 4];
    tmp.z := Fmat[3, 1] * x + Fmat[3, 2] * y + Fmat[3, 3] * z + Fmat[3, 4];
  end;
  point := tmp;
end;

{ Transform nvert points from v into tv.  v contains the input
  coordinates in floating point.  Three successive entries in
  the array constitute a point.  tv ends up holding the transformed
  points as integers; three successive entries per point }
procedure TMatrix4x4.transform(var v: TvertArrayF; var tv: TvertArrayI;
  nvert: Integer);
var
  i, j: Integer;
  x, y, z: single;
begin
  for j := nvert downto 0 do
  begin
    i := j * 3;
    x := v[i];
    y := v[i + 1];
    z := v[i + 2];
    tv[i] := Round(Fmat[1, 1] * x + Fmat[1, 2] * y + Fmat[1, 3] * z + Fmat[1, 4]
      );
    tv[i + 1] := Round(Fmat[2, 1] * x + Fmat[2, 2] * y + Fmat[2, 3] * z + Fmat
        [2, 4]);
    tv[i + 2] := Round(Fmat[3, 1] * x + Fmat[3, 2] * y + Fmat[3, 3] * z + Fmat
        [3, 4]);
  end;
end;

procedure TMatrix4x4.transformF(var v: TvertArrayF; var tv: TvertArrayF;
  nvert: Integer);
var
  i, j: Integer;
  x, y, z: single;
begin
  for j := nvert downto 0 do
  begin
    i := j * 3;
    x := v[i];
    y := v[i + 1];
    z := v[i + 2];
    tv[i] := Fmat[1, 1] * x + Fmat[1, 2] * y + Fmat[1, 3] * z + Fmat[1, 4];
    tv[i + 1] := Fmat[2, 1] * x + Fmat[2, 2] * y + Fmat[2, 3] * z + Fmat[2, 4];
    tv[i + 2] := Fmat[3, 1] * x + Fmat[3, 2] * y + Fmat[3, 3] * z + Fmat[3, 4];
  end;
end;

procedure TMatrix4x4.GetLocals(var ux, uy, uz: vec3);
begin
  ux.x := Fmat[1, 1];
  ux.y := Fmat[2, 1];
  ux.z := Fmat[3, 1];
  uy.x := Fmat[1, 2];
  uy.y := Fmat[2, 2];
  uy.z := Fmat[3, 2];
  uz.x := Fmat[1, 3];
  uz.y := Fmat[2, 3];
  uz.z := Fmat[3, 3];
end;

{ TRotaParams }

constructor TRotaParams.Create;
begin
  FIncrementIndex := 3;
  FZoomBase := 0.05;
  FZoomIndex := 7;
  FixPunkt := ooD0;
  Phi := 0;
  Theta := -90;
  Gamma := 0;
  Xrot := -87;
  Yrot := 0;
  Zrot := 0;
end;

procedure TRotaParams.SetIncrementIndex(Value: Integer);
begin
  if Value < 1 then
    Value := 1;
  if Value > 5 then
    Value := 5;
  FIncrementIndex := Value;
end;

procedure TRotaParams.SetZoomIndex(Value: Integer);
begin
  if Value < 1 then
    Value := 1;
  if Value > 11 then
    Value := 11;
  FZoomIndex := Value;
end;

procedure TRotaParams.SetFixPunktIndex(Value: Integer);
begin
  case Value of
    0: FixPunkt := ooA0;
    1: FixPunkt := ooA;
    2: FixPunkt := ooB0;
    3: FixPunkt := ooB;
    4: FixPunkt := ooC0;
    5: FixPunkt := ooC;
    6: FixPunkt := ooD0;
    7: FixPunkt := ooD;
    8: FixPunkt := ooE0;
    9: FixPunkt := ooE;
   10: FixPunkt := ooF0;
   11: FixPunkt := ooF;
   else FixPunkt := ooD0;
  end;
end;

function TRotaParams.GetFixPunktIndex: Integer;
begin
  case FixPunkt of
    ooA0:  result :=  0;
    ooA:   result :=  1;
    ooB0:  result :=  2;
    ooB:   result :=  3;
    ooC0:  result :=  4;
    ooC:   result :=  5;
    ooD0:  result :=  6;
    ooD:   result :=  7;
    ooE0:  result :=  8;
    ooE:   result :=  9;
    ooF0:  result := 10;
    ooF:   result := 11;
    else
      result := 6;
  end;
end;

function TRotaParams.GetIncrementT: Integer;
begin
  case IncrementIndex of
    1: result := 1;
    2: result := 5;
    3: result := 10;
    4: result := 30;
    5: result := 100;
    else
      result := 1;
  end;
end;

function TRotaParams.GetIncrementW: double;
begin
  case IncrementIndex of
    1: result := 0.1;
    2: result := 1;
    3: result := 5;
    4: result := 10;
    5: result := 30;
    else
      result := 1;
  end;
end;

function TRotaParams.GetZoom: double;
begin
  result := FZoomBase * LookUpRa10(FZoomIndex);
end;

end.
