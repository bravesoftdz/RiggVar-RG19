﻿unit RggRota;

interface

{$ifdef fpc}
{$mode delphi}
{$endif}

uses
{$ifdef fpc}
  LCLIntf,
  LCLType,
{$endif}
{$ifdef MSWindows}
  Windows,
{$endif}
  SysUtils,
  Classes,
  Types,
  Graphics,
  Forms,
  Controls,
  StdCtrls,
  ExtCtrls,
  ComCtrls,
  RggVector,
  RiggVar.RG.Graph,
  RggTypes,
  RggMatrix,
  RggCircleGraph,
  RggRaumGraph,
  RggGraph,
  RggHull,
  RggPolarKar,
  RggTransformer;

type

  { TRotaForm }

  TRotaForm = class(TInterfacedObject, IStrokeRigg)
  private
    RPN: TRealRiggPoints;
    RPE: TRealRiggPoints;
    RPR: TRealRiggPoints;
    SkipOnceFlag: Boolean;
    function OnGetFixPunkt: TRealPoint;
    procedure DrawToCanvasEx(g: TCanvas);
    procedure DrawToCanvas(g: TCanvas);
    procedure DrawToImage(g: TCanvas);
  private
    procedure PaintBox3DMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PaintBox3DMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure PaintBox3DMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  protected
    KeepInsideItemChecked: Boolean;
    procedure PositionSaveItemClick(Sender: TObject);
    procedure KeepInsideItemClick(Sender: TObject);
    procedure PositionResetItemClick(Sender: TObject);
    procedure DrawAlwaysItemClick(Sender: TObject);
  public
    LegendItemChecked: Boolean;
    MatrixItemChecked: Boolean;
    PaintItemChecked: Boolean;
    RumpfItemChecked: Boolean;
    procedure LegendBtnClick(Sender: TObject);
    procedure MatrixItemClick(Sender: TObject);
    procedure PaintBtnClick(Sender: TObject);
    procedure RumpfBtnClick(Sender: TObject);
    procedure ZoomInBtnClick(Sender: TObject);
    procedure ZoomOutBtnClick(Sender: TObject);
    procedure UseDisplayListBtnClick(Sender: TObject);
    procedure UseQuickSortBtnClick(Sender: TObject);
    procedure BogenBtnClick(Sender: TObject);
    procedure KoppelBtnClick(Sender: TObject);
  protected
    MinTrackX, MinTrackY: Integer;
    MaxTrackX, MaxTrackY: Integer;
    CreatedScreenWidth: Integer;
    procedure PaintBackGround(g: TCanvas);
    procedure PaintBox3DPaint(Sender: TObject);
  private
    FViewPoint: TViewPoint;
    FZoomBase: double;
    FZoom: double;

    FPhi: double;
    FTheta: double;
    FGamma: double;

    xmin, ymin, xmax, ymax: Integer;

    FXpos: Integer;
    FYpos: Integer;
    FIncrementW: double;
    FIncrementT: Integer;
    FZoomIndex: Integer;

    RotaData: TRotaData;
    RotaData1: TRotaData;
    RotaData2: TRotaData;
    RotaData3: TRotaData;
    RotaData4: TRotaData;

    NullpunktOffset: TPoint;
    FDrawAlways: Boolean;
    FTranslation: Boolean;
    MouseDown: Boolean;
    MouseButton: TMouseButton;
    Painted: Boolean;
    prevx, prevy: Integer;
    MouseDownX, MouseDownY: Integer;
    SavedXPos, SavedYPos: Integer;
    AlwaysShowAngle: Boolean;
    FFixPoint: TRiggPoint;
    procedure UpdateMinMax;
    procedure DoTrans;
  public
    { interface IStrokeRigg }
    procedure SetKoordinaten(const Value: TRealRiggPoints);
    procedure SetKoordinatenE(const Value: TRealRiggPoints);
    procedure SetKoordinatenR(const Value: TRealRiggPoints);
    procedure SetMastKurve(const Value: TMastKurve);
    procedure SetKoppelKurve(const Value: TKoordLine);

    procedure SetHullVisible(const Value: Boolean);

    procedure SetFixPoint(const Value: TRiggPoint);
    procedure SetViewPoint(const Value: TViewPoint);
    procedure SetSalingTyp(const Value: TSalingTyp);
    procedure SetControllerTyp(const Value: TControllerTyp);
    procedure SetWanteGestrichelt(const Value: Boolean);
    procedure SetBogen(const Value: Boolean);
    procedure SetKoppel(const Value: Boolean);
    procedure SetBtnBlauDown(const Value: Boolean);
    procedure SetBtnGrauDown(const Value: Boolean);
    procedure SetGrauZeichnen(const Value: Boolean);
    procedure SetRiggLED(const Value: Boolean);
    procedure SetSofortBerechnen(const Value: Boolean);

    procedure SetMastLineData(const Value: TLineDataR100; L: double; Beta: double);
    function GetMastKurvePoint(const Index: Integer): TRealPoint;
    procedure ToggleRenderOption(const fa: Integer);
    function QueryRenderOption(const fa: Integer): Boolean;
  public
    MatrixTextU: string;
    MatrixTextV: string;
    MatrixTextW: string;
    procedure UpdateMatrixText;
    procedure DrawMatrix(g: TCanvas);
  private
    FScale: single;
    FBitmapWidth: Integer;
    FBitmapHeight: Integer;
    Bitmap: TBitmap;
    EraseBK: Boolean;
    procedure Rotate(Phi, Theta, Gamma, xrot, yrot, zrot: double);
    procedure Translate(x, y: Integer);
    procedure InitRotaData;
  private
    FOnBeforeDraw: TNotifyEvent;
    FOnAfterDraw: TNotifyEvent;
    Rotator: TPolarKar;
    Transformer: TRggTransformer;
    FBtnGrauDown: Boolean;
    FGrauZeichnen: Boolean;
    FBtnBlauDown: Boolean;
    FRiggLED: Boolean;
    FSofortBerechnen: Boolean;
    FWanteGestrichelt: Boolean;
    FBogen: Boolean;
    FKoppel: Boolean;
    procedure InitGraph;
    procedure InitRaumGraph;
    procedure InitHullGraph;
    procedure DrawHullNormal(g: TCanvas);
    procedure UpdateGraphFromTestData;
    procedure UpdateDisplayListForBoth(WithKoord: Boolean);
    procedure SetZoomIndex(const Value: Integer);
    procedure SetOnBeforeDraw(const Value: TNotifyEvent);
    procedure SetOnAfterDraw(const Value: TNotifyEvent);
    function SingleDraw: Boolean;
  public
    IsUp: Boolean;
    Image: TImage; // injected

    CircleGraph: TCircleGraph;
    HullGraph: THullGraph0;
    RaumGraph: TRaumGraph;
    UseDisplayList: Boolean;
    WantOverlayedRiggs: Boolean;
    WantCircles: Boolean;

    constructor Create;
    destructor Destroy; override;
    procedure Init;
    procedure Draw;

    procedure RotateZ(Delta: double);
    procedure Zoom(Delta: double);

    property ZoomIndex: Integer read FZoomIndex write SetZoomIndex;
    property ViewPoint: TViewPoint read FViewPoint write SetViewPoint;
    property FixPoint: TRiggPoint read FFixPoint write SetFixPoint;

    property HullVisible: Boolean write SetHullVisible;
    property SalingTyp: TSalingTyp write SetSalingTyp;
    property ControllerTyp: TControllerTyp write SetControllerTyp;
    property Koordinaten: TRealRiggPoints write SetKoordinaten;
    property KoordinatenE: TRealRiggPoints write SetKoordinatenE;
    property KoordinatenR: TRealRiggPoints write SetKoordinatenR;
    property MastKurve: TMastKurve write SetMastKurve;
    property KoppelKurve: TKoordLine write SetKoppelKurve;
    property WanteGestrichelt: Boolean read FWanteGestrichelt write SetWanteGestrichelt;
    property Bogen: Boolean read FBogen write SetBogen;
    property Koppel: Boolean read FKoppel write SetKoppel;

    property RiggLED: Boolean read FRiggLED write SetRiggLED;
    property SofortBerechnen: Boolean read FSofortBerechnen write SetSofortBerechnen;
    property GrauZeichnen: Boolean read FGrauZeichnen write SetGrauZeichnen;
    property BtnGrauDown: Boolean read FBtnGrauDown write SetBtnGrauDown;
    property BtnBlauDown: Boolean read FBtnBlauDown write SetBtnBlauDown;

    property OnBeforeDraw: TNotifyEvent read FOnBeforeDraw write SetOnBeforeDraw;
    property OnAfterDraw: TNotifyEvent read FOnAfterDraw write SetOnAfterDraw;

    property BitmapWidth: Integer read FBitmapWidth;
    property BitmapHeight: Integer read FBitmapHeight;
  end;

implementation

uses
  RiggVar.App.Main,
  RiggVar.FB.ActionConst,
  RiggVar.RG.Def,
  RggDisplay,
  RggZug3D,
  RggTestData;

{ TRotaForm }

constructor TRotaForm.Create;
begin
  FScale := MainVar.Scale;
  KeepInsideItemChecked := True;
  FBogen := True;

  { do almost nothing here,
    - Image reference needs to be injected first,
    later Init must be called, from the outside.
  }

  CircleGraph := TCircleGraph.Create;
end;

destructor TRotaForm.Destroy;
begin
  Image := nil;
  Bitmap.Free;
  RaumGraph.Free;
  HullGraph.Free;
  CircleGraph.Free;
  Rotator.Free;
  Transformer.Free;
  inherited;
end;

procedure TRotaForm.Init;
var
  wx, wy: Integer;
begin
  FDrawAlways := True;
  AlwaysShowAngle := False;

  MinTrackX := 410;
  MinTrackY := 280;
  MaxTrackX := 1024;
  MaxTrackY := 768;

  CreatedScreenWidth := Screen.Width;
  wx := GetSystemMetrics(SM_CXSCREEN);
  wy := GetSystemMetrics(SM_CYSCREEN);
  if wx > MaxTrackX then
    wx := MaxTrackX;
  if wy > MaxTrackY then
    wy := MaxTrackY;

  FBitmapWidth := wx;
  FBitmapHeight := wy;

  Bitmap := TBitmap.Create;
  Bitmap.Width := Round(FBitmapWidth * FScale);
  Bitmap.Height := Round(FBitmapHeight * FScale);
  PaintBackGround(Bitmap.Canvas);

  Image.Picture.Graphic := Bitmap;

  FZoomBase := 0.05;
  FViewPoint := vp3D;
  FFixPoint := ooD0;
  FXPos := Round(-150 * FScale);
  FYPos := -50;

  Image.OnMouseDown := PaintBox3DMouseDown;
  Image.OnMouseMove := PaintBox3DMouseMove;
  Image.OnMouseUp := PaintBox3DMouseUp;

  InitGraph;
  InitRaumGraph;
  InitHullGraph;
  UpdateGraphFromTestData;
  SetViewPoint(FViewPoint);
end;

procedure TRotaForm.InitGraph;
begin
  Rotator := TPolarKar.Create;
  Rotator.OnCalcAngle := Rotator.GetAngle2;
  InitRotaData;
  Transformer := TRggTransformer.Create;
  Transformer.Rotator := Rotator;
  Transformer.OnGetFixPunkt := OnGetFixPunkt;
end;

procedure TRotaForm.InitRaumGraph;
begin
  RaumGraph := TRaumGraph.Create(TZug3D.Create);
  RaumGraph.Transformer := Transformer;
  RaumGraph.FixPoint := FixPoint;
  RaumGraph.Zoom := FZoom;
  RaumGraph.ViewPoint := vp3D;
  RaumGraph.Bogen := FBogen;
end;

procedure TRotaForm.InitHullGraph;
begin
  HullGraph := THullGraph0.Create;
  HullGraph.Transformer := Transformer;
end;

procedure TRotaForm.UpdateGraphFromTestData;
begin
  RaumGraph.Salingtyp := stFest;
  RaumGraph.ControllerTyp := ctOhne;
  RaumGraph.Koordinaten := TRggTestData.GetKoordinaten420;
  RaumGraph.SetMastKurve(TRggTestData.GetMastKurve420);
  RaumGraph.WanteGestrichelt := False;
  Draw;
end;

procedure TRotaForm.InitRotaData;

  function GetMatrix(Theta, Xrot: double): Matrix4x4;
  begin
    Rotator.Reset;
    Rotator.DeltaTheta := Theta;
    Rotator.XRot := Xrot;
    result := Rotator.Matrix;
  end;

begin
  with RotaData1 do
  begin
    Xpos := -150;
    Ypos := -40;
    Matrix := GetMatrix(0,0);
    ZoomIndex := 3;
    FixPunktIndex := 7;
    IncrementIndex := 3;
    IncrementT := 10;
    IncrementW := 5;
  end;
  with RotaData2 do
  begin
    Xpos := -150;
    Ypos := -50;
    Matrix := GetMatrix(0,90);
    ZoomIndex := 2;
    FixPunktIndex := 8;
    IncrementIndex := 3;
    IncrementT := 10;
    IncrementW := 5;
  end;
  with RotaData3 do
  begin
    Xpos := -170;
    Ypos := -120;
    Matrix := GetMatrix(-90,90);
    ZoomIndex := 5;
    FixPunktIndex := 8;
    IncrementIndex := 3;
    IncrementT := 10;
    IncrementW := 5;
  end;
  with RotaData4 do
  begin
    Xpos := -130;
    Ypos := -80;
    Matrix := GetMatrix(90,-87);
    ZoomIndex := 8;
    FixPunktIndex := 8;
    IncrementIndex := 3;
    IncrementT := 10;
    IncrementW := 5;
  end;
end;

procedure TRotaForm.UpdateMatrixText;
var
  m4x4: Matrix4x4;
begin
  m4x4 := Rotator.Mat.Mat;
  MatrixTextU := Format('%8.4f %8.4f %8.4f',[m4x4[1,1],m4x4[1,2], m4x4[1,3]]);
  MatrixTextV := Format('%8.4f %8.4f %8.4f',[m4x4[2,1],m4x4[2,2], m4x4[2,3]]);
  MatrixTextW := Format('%8.4f %8.4f %8.4f',[m4x4[3,1],m4x4[3,2], m4x4[3,3]]);
end;

procedure TRotaForm.DrawMatrix(g: TCanvas);
var
  tx: Integer;
  th: Integer;
begin
  tx := Round(20 * FScale);
  th := Round(20 * FScale);
  with g do
  begin
    Font.Name := 'Courier New';
    Font.Size := 10;
    TextOut(tx, 2 * th, MatrixTextU);
    TextOut(tx, 3 * th, MatrixTextV);
    TextOut(tx, 4 * th, MatrixTextW);
  end;
end;

procedure TRotaForm.DrawToImage(g: TCanvas);
begin
  Painted := False;

  if WantOverlayedRiggs then
  begin
    DrawToCanvasEx(g)
  end
  else
  begin
    RaumGraph.Coloriert := True;
    WanteGestrichelt := WanteGestrichelt;
    RaumGraph.Koordinaten := RPN;
    DrawToCanvas(g);
  end;

  { Bitmap auf den Bildschirm kopieren }
  Image.Canvas.CopyMode := cmSrcCopy;
  Image.Canvas.Draw(0, 0, Bitmap);

  if WantCircles then
  begin
    CircleGraph.Action;
    CircleGraph.Draw(Image.Canvas, 0, 0);
  end;

  Painted := True;
end;

procedure TRotaForm.DrawToCanvasEx(g: TCanvas);
begin
  if SingleDraw then
  begin
    RaumGraph.Coloriert := True;
    WanteGestrichelt := WanteGestrichelt;
    RaumGraph.Koordinaten := RPN;
    DrawToCanvas(g);
  end
  else
  begin
    { entspanntes Rigg grau zeichnen }
    if Grauzeichnen and BtnGrauDown then
    begin
      RaumGraph.Color := clEntspannt;
      RaumGraph.Coloriert := False;
      WanteGestrichelt := False; //WanteGestrichelt;
      RaumGraph.Koordinaten := RPE;
      DrawToCanvas(g);
      SkipOnceFlag := True;
    end;

    { Nullstellung hellblau zeichnen }
    if BtnBlauDown then
    begin
      RaumGraph.Color := clNullStellung;
      RaumGraph.Coloriert := False;
      RaumGraph.WanteGestrichelt := False;
      RaumGraph.Koordinaten := RPR;
      DrawToCanvas(g);
      SkipOnceFlag := True;
    end;

    { gespanntes Rigg farbig zeichnen}
    RaumGraph.Coloriert := True;
    WanteGestrichelt := WanteGestrichelt;
    RaumGraph.Koordinaten := RPN;
    DrawToCanvas(g);
  end;
end;

procedure TRotaForm.DrawToCanvas(g: TCanvas);
begin
  if SkipOnceFlag then
  begin
    { do not clear background }
  end
  else if not PaintItemChecked or EraseBK then
  begin
    PaintBackGround(Bitmap.Canvas);
    EraseBK := False;
  end;

  SkipOnceFlag := False;

  NullpunktOffset.x := Bitmap.Width div 2 + FXpos;
  NullpunktOffset.y := Bitmap.Height div 2 + FYpos;

  if MatrixItemChecked then
  begin
    UpdateMatrixText;
    DrawMatrix(g);
  end;

  SetViewPortOrgEx(g.Handle, NullpunktOffset.x, NullpunktOffset.y, nil);

  if UseDisplayList then
  begin
    UpdateDisplayListForBoth(False);
    TDisplayItem.NullpunktOffset := NullpunktOffset;;
    RaumGraph.DL.WantLegend := LegendItemChecked; // not RumpfItemChecked;
    RaumGraph.DL.Draw(g);
  end
  else
  begin
    RaumGraph.DrawToCanvas(g);
  end;

  { This method will first check whether this should be done at all. }
  DrawHullNormal(g);

  SetViewPortOrgEx(g.Handle, 0, 0, nil);
end;

procedure TRotaForm.DoTrans;
begin
  UpdateMinMax;

  if FXpos < xmin then
    FXpos := xmin;
  if FXpos > xmax then
    FXpos := xmax;
  if FYpos < ymin then
    FYpos := ymin;
  if FYpos > ymax then
    FYpos := ymax;

  if not PaintItemChecked then
    EraseBK := True;
end;

procedure TRotaForm.UpdateMinMax;
begin
  if KeepInsideItemChecked then
  begin
    xmin := -Bitmap.Width div 2;
    ymin := -Bitmap.Height div 2;
    xmax := Abs(xmin);
    ymax := Abs(ymin);
    if xmax > xmin + Image.Width then
      xmax := xmin + Image.Width;
    if ymax > ymin + Image.Height then
      ymax := ymin + Image.Height;
  end
  else
  begin
    xmin := -3000;
    ymin := -3000;
    xmax := 3000;
    ymax := 3000;
  end;
end;

procedure TRotaForm.ZoomInBtnClick(Sender: TObject);
begin
  ZoomIndex := FZoomIndex + 1;
end;

procedure TRotaForm.ZoomOutBtnClick(Sender: TObject);
begin
  ZoomIndex := FZoomIndex - 1;
end;

procedure TRotaForm.SetBtnBlauDown(const Value: Boolean);
begin
  FBtnBlauDown := Value;
end;

procedure TRotaForm.SetBtnGrauDown(const Value: Boolean);
begin
  FBtnGrauDown := Value;
end;

procedure TRotaForm.SetFixPoint(const Value: TRiggPoint);
begin
  FFixPoint := Value;
  RaumGraph.FixPoint := FixPoint;
  Draw;
end;

procedure TRotaForm.SetGrauZeichnen(const Value: Boolean);
begin
  FGrauZeichnen := Value;
end;

procedure TRotaForm.SetHullVisible(const Value: Boolean);
begin
  RumpfItemChecked := Value;
  Draw;
end;

procedure TRotaForm.SetRiggLED(const Value: Boolean);
begin
  FRiggLED := Value;
  RaumGraph.RiggLED := Value;
end;

procedure TRotaForm.SetSofortBerechnen(const Value: Boolean);
begin
  FSofortBerechnen := Value;
end;

procedure TRotaForm.SetOnAfterDraw(const Value: TNotifyEvent);
begin
  FOnAfterDraw := Value;
end;

procedure TRotaForm.SetOnBeforeDraw(const Value: TNotifyEvent);
begin
  FOnBeforeDraw := Value;
end;

procedure TRotaForm.RumpfBtnClick(Sender: TObject);
begin
  RumpfItemChecked := not RumpfItemChecked;
  Draw;
end;

procedure TRotaForm.PaintBtnClick(Sender: TObject);
begin
  PaintItemChecked := not PaintItemChecked;
  if not PaintItemChecked then
    EraseBK := True;
  Draw;
end;

procedure TRotaForm.UseDisplayListBtnClick(Sender: TObject);
begin
  UseDisplayList := not UseDisplayList;
  Draw;
end;

procedure TRotaForm.UseQuickSortBtnClick(Sender: TObject);
begin
  RaumGraph.DL.UseQuickSort := not RaumGraph.DL.UseQuickSort;
  RaumGraph.Update;
  Draw;
end;

procedure TRotaForm.BogenBtnClick(Sender: TObject);
begin
  Bogen := not Bogen;
  Draw;
end;

procedure TRotaForm.SetViewPoint(const Value: TViewPoint);
begin
  if not IsUp then
    Exit;

  FViewPoint := Value;
  case FViewPoint of
    vpSeite: RotaData := RotaData1;
    vpAchtern: RotaData := RotaData2;
    vpTop: RotaData := RotaData3;
    vp3D: RotaData := RotaData4;
  end;
  RaumGraph.Viewpoint := Value; // for GetriebeGraph

  FIncrementT := RotaData.IncrementT;
  FIncrementW := RotaData.IncrementW;

  { Rotationmatrix }
  Rotator.Matrix := RotaData.Matrix;
  Rotator.GetAngle(FPhi, FTheta, FGamma);

  { Zoom }
  FZoomIndex := RotaData.ZoomIndex;
  FZoom := FZoomBase * LookUpRa10(FZoomIndex);
  Transformer.Zoom := FZoom;

  { FixPoint }
  RaumGraph.FixPoint := FixPoint; // --> Transformer.FixPoint

  RaumGraph.Update;
  HullGraph.Update;

  { Neuzeichnen }
  EraseBK := True;
  Draw;
end;

procedure TRotaForm.PositionSaveItemClick(Sender: TObject);
begin
  case FViewPoint of
    vpSeite: RotaData := RotaData1;
    vpAchtern: RotaData := RotaData2;
    vpTop: RotaData := RotaData3;
    vp3D: RotaData := RotaData4;
  end;
  with RotaData do
  begin
    Xpos := FXpos;
    Ypos := FYpos;
    Matrix := Rotator.Matrix;
    ZoomIndex := FZoomIndex;
    IncrementT := FIncrementT;
    IncrementW := FIncrementW;
  end;
  case FViewPoint of
    vpSeite: RotaData1 := RotaData;
    vpAchtern: RotaData2 := RotaData;
    vpTop: RotaData3 := RotaData;
    vp3D: RotaData4 := RotaData;
  end;
end;

procedure TRotaForm.PositionResetItemClick(Sender: TObject);
begin
  InitRotaData;
  SetViewPoint(FViewPoint);
end;

procedure TRotaForm.KeepInsideItemClick(Sender: TObject);
begin
  KeepInsideItemChecked := not KeepInsideItemChecked;
  if KeepInsideItemChecked then
    Draw;
end;

procedure TRotaForm.KoppelBtnClick(Sender: TObject);
begin
  RaumGraph.Koppel := not RaumGraph.Koppel;
  Draw;
end;

procedure TRotaForm.PaintBox3DMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MouseDown := True;
  MouseButton := Button;
  prevx := x;
  MouseDownX := x;
  SavedXPos := FXPos;
  prevy := y;
  MouseDownY := y;
  SavedYPos := FYPos;

  FTranslation :=
    (Abs(NullPunktOffset.x - X) < TKR) and
    (Abs(NullPunktOffset.y - Y) < TKR);
end;

procedure TRotaForm.PaintBox3DMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  wx, wy, wz: single;
begin
  if not MouseDown then
    Exit;
  if MouseButton = mbLeft then
  begin
    wx := (x - prevx) * 0.15;
    wy := (y - prevy) * 0.15;
    wz := 0;
  end
  else
  begin
    wx := 0;
    wy := 0;
    wz := (x - prevx) * 0.3;
  end;

  if Painted then
  begin
    Painted := False;
    if FTranslation or (Shift = [ssLeft, ssRight]) then
      Translate(x,y)
    else
      Rotate(0, 0, 0, wx, wy, wz);
    Draw;
    prevx := x;
    prevy := y;
  end;
end;

procedure TRotaForm.PaintBox3DMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MouseDown := False;
  if (prevx = MouseDownX) and (prevy = MouseDownY) then
    EraseBK := True;
  Draw;
end;

procedure TRotaForm.Rotate(Phi, Theta, Gamma, xrot, yrot, zrot: double);
begin
  Rotator.DeltaPhi := Phi;
  Rotator.DeltaTheta := Theta;
  Rotator.DeltaGamma := Gamma;
  Rotator.XRot := Xrot;
  Rotator.YRot := Yrot;
  Rotator.ZRot := Zrot;
end;

procedure TRotaForm.Translate(x, y: Integer);
begin
  FXpos := SavedXpos - (MouseDownX - x);
  FYpos := SavedYpos - (MouseDownY - y);
  DoTrans;
end;

procedure TRotaForm.Draw;
begin
  if IsUp then
  begin
    if UseDisplayList then
      UpdateDisplayListForBoth(True);
    DrawToImage(Bitmap.Canvas);
    if Assigned(OnAfterDraw) then
      OnAfterDraw(Self);
  end;
end;

procedure TRotaForm.DrawAlwaysItemClick(Sender: TObject);
begin
  FDrawAlways := not FDrawAlways;
end;

procedure TRotaForm.LegendBtnClick(Sender: TObject);
begin
  LegendItemChecked := not LegendItemChecked;
  Draw;
end;

procedure TRotaForm.MatrixItemClick(Sender: TObject);
begin
  MatrixItemChecked := not MatrixItemChecked;
  Draw;
end;

function TRotaForm.OnGetFixPunkt: TRealPoint;
begin
  result := RPN[FFixPoint];
end;

procedure TRotaForm.PaintBackGround(g: TCanvas);
var
  R: TRect;
begin
  R := Rect(0, 0, Image.Width, Image.Height);
  g.Brush.Color := clGray; // TRggColors.WindowWhite;
  g.FillRect(R);
end;

procedure TRotaForm.PaintBox3DPaint(Sender: TObject);
begin
  Draw;
end;

procedure TRotaForm.ToggleRenderOption(const fa: Integer);
begin
  case fa of
    faWantRenderE: RaumGraph.WantRenderE := not RaumGraph.WantRenderP;
    faWantRenderF: RaumGraph.WantRenderF := not RaumGraph.WantRenderF;
    faWantRenderH: RaumGraph.WantRenderH := not RaumGraph.WantRenderH;
    faWantRenderP: RaumGraph.WantRenderP := not RaumGraph.WantRenderP;
    faWantRenderS: RaumGraph.WantRenderS := not RaumGraph.WantRenderS;
  end;
end;

function TRotaForm.QueryRenderOption(const fa: Integer): Boolean;
begin
  case fa of
    faWantRenderE: result := RaumGraph.WantRenderE;
    faWantRenderF: result := RaumGraph.WantRenderF;
    faWantRenderH: result := RaumGraph.WantRenderH;
    faWantRenderP: result := RaumGraph.WantRenderP;
    faWantRenderS: result := RaumGraph.WantRenderS;

    faRggBogen: result := RaumGraph.Bogen;
    faRggKoppel: result := RaumGraph.Koppel;
    faRggHull: result := RumpfItemChecked;
    else
      result := False;
  end;
end;

function TRotaForm.GetMastKurvePoint(const Index: Integer): TRealPoint;
begin
  result := RaumGraph.GetMastKurvePoint(Index);
end;

procedure TRotaForm.SetMastLineData(const Value: TLineDataR100; L,
  Beta: double);
begin
  RaumGraph.SetMastLineData(Value, L, Beta);
end;

procedure TRotaForm.SetSalingTyp(const Value: TSalingTyp);
begin
  RaumGraph.SalingTyp := Value;
end;

procedure TRotaForm.SetBogen(const Value: Boolean);
begin
  FBogen := Value;
  RaumGraph.Bogen := Value;
end;

procedure TRotaForm.SetControllerTyp(const Value: TControllerTyp);
begin
  RaumGraph.ControllerTyp := Value;
end;

procedure TRotaForm.SetKoordinaten(const Value: TRealRiggPoints);
begin
  RPN := Value;
end;

procedure TRotaForm.SetKoordinatenE(const Value: TRealRiggPoints);
begin
  RPE := Value;
end;

procedure TRotaForm.SetKoordinatenR(const Value: TRealRiggPoints);
begin
  RPR := Value;
end;

procedure TRotaForm.SetKoppel(const Value: Boolean);
begin
  FKoppel := Value;
  RaumGraph.Koppel := Value;
end;

procedure TRotaForm.SetKoppelKurve(const Value: TKoordLine);
begin
  RaumGraph.SetKoppelKurve(Value);
end;

procedure TRotaForm.SetMastKurve(const Value: TMastKurve);
begin
  RaumGraph.SetMastKurve(Value);
end;

procedure TRotaForm.SetWanteGestrichelt(const Value: Boolean);
begin
  FWanteGestrichelt := Value;
  RaumGraph.WanteGestrichelt := Value;
end;

procedure TRotaForm.SetZoomIndex(const Value: Integer);
begin
  if (Value < 1) then
    FZoomIndex := 1
  else if Value > 11 then
    FZoomIndex := 11
  else
    FZoomIndex := Value;

  FZoom := FZoomBase * LookUpRa10(FZoomIndex);
  RaumGraph.Zoom := FZoom;
  Draw;
end;

procedure TRotaForm.Zoom(Delta: double);
begin
  FZoom := FZoom + FZoom * FZoomBase * Delta * 0.3;
  RaumGraph.Zoom := FZoom;
  Draw;
end;

procedure TRotaForm.RotateZ(Delta: double);
begin
  Rotate(0, 0, 0, 0, 0, Delta);
  Draw;
end;

procedure TRotaForm.UpdateDisplayListForBoth(WithKoord: Boolean);
begin
  if not UseDisplayList then
    Exit;

  if WithKoord then
  begin
    { Koordinaten may be assigned by DawToCanvasEx }
    RaumGraph.Koordinaten := RPN;
  end;

  RaumGraph.Update;
  RaumGraph.UpdateDisplayList;

  if RumpfItemChecked then
  begin
    HullGraph.Coloriert := True;
    HullGraph.Update;
    HullGraph.AddToDisplayList(RaumGraph.DL);
  end;

  if Assigned(OnBeforeDraw) then
    OnBeforeDraw(Self);
end;

procedure TRotaForm.DrawHullNormal(g: TCanvas);
begin
  if RumpfItemChecked
    and not UseDisplayList
    and (not MouseDown or (MouseDown and FDrawAlways)) then
  begin
    HullGraph.Coloriert := True;
    HullGraph.Update;
    HullGraph.DrawToCanvas(g);
  end;
end;

function TRotaForm.SingleDraw: Boolean;
begin
  result := True;

  if UseDisplayList then
  begin
    { DisplayList cannot draw multiple situations }
    Exit;
  end;

  if not WantOverlayedRiggs then
  begin
    { not wanted }
    Exit;
  end;

  if BtnBlauDown then
  begin
    { ok, draw refernce position in blue }
    result := False;
  end;

  if BtnGrauDown and SofortBerechnen then
  begin
    { ok, MultiDraw, draw relaxed position in gray }
    result := False;
  end;
end;

end.
