﻿unit Rggunit0;

interface

uses
  System.SysUtils,
  System.Classes,
  System.UITypes,
  System.IniFiles,
  System.Math,
  RiggVar.RG.Def,
  RggTypes,
  Vcalc116,
  SchnttKK,
  TrimmTab;

type
  TGetriebe = class(TComponent)
  private
    FSalingTyp: TSalingTyp;
    FManipulatorMode: Boolean;
    procedure SetGlieder(Values: TTrimmControls);
    function GetGlieder: TTrimmControls;
    function GetSalingDaten: TSalingDaten;
    procedure GetLogoData;
    procedure GetDefaultData;
  protected
    FTrimm: TTrimm;
    FGetriebeOK: Boolean;
    FMastOK: Boolean;
    FGetriebeStatus: set of TGetriebeStatus;
    FrWanteZulang: double;

    FrPuettingA: double;
    FrBasis: double;
    FrController: double;
    FrWinkel: double;
    FrVorstag: double;
    FrWunten2d: double;
    FrWunten3d: double;
    FrWoben2d: double;
    FrWoben3d: double;
    FrSalingL: double;
    FrSalingH: double;
    FrSalingA: double;
    FrMastunten: double;
    FrMastoben: double;
    FrMastEnde: double;
    FrPsi: double;
    FrPhi: double;
    FrAlpha: double;
    FrEpsilon: double;

    FiZaehler: Integer;
    FiControllerAnschlag: Integer;

    FiController: Integer;
    FiWinkel: Integer;
    FiVorstag: Integer;
    FiWunten3d: Integer;
    FiWoben3d: Integer;
    FiSalingL: Integer;
    FiSalingH: Integer;
    FiSalingA: Integer;
    FiWPowerOS: Integer;

    FiMastL: Integer;
    FiMastUnten: Integer;
    FiMastOben: Integer;
    FiMastfallVorlauf: Integer;

    procedure IntGliederToReal;
    procedure RealGliederToInt;
    procedure Wanten2dTo3d;
    procedure Wanten3dTo2d;
    procedure SetMastL(Value: Integer);
    procedure SetMastunten(Value: Integer);
    procedure SetMastoben(Value: Integer);
    function GetRealGlied(Index: TsbName): double;
    procedure SetRealGlied(Index: TsbName; Value: double);
    procedure SetSalingTyp(Value: TSalingTyp); virtual;

    procedure LoadFromIniFile(ini: TIniFile); virtual;
    procedure WriteToIniFile(ini: TIniFile); virtual;
    procedure LoadFromStream(S: TStream); virtual;
    procedure SaveToStream(S: TStream); virtual;
  public
    LogList: TStringList;
    SchnittKK: TSchnittKK;
    TrimmTab: TTrimmTab;
    GSB: TsbArray;
    iP: TIntRiggPoints;
    rP: TRealRiggPoints;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure GetBuiltinData; { Integerwerte initialisieren }
    procedure Reset; { Gleitkommawerte initialisieren }
    procedure UpdateGSB;
    procedure UpdateGlieder;

    function GetriebeStatusText: string;

    property SalingTyp: TSalingTyp read FSalingTyp write SetSalingTyp;
    property ManipulatorMode: Boolean read FManipulatorMode write FManipulatorMode;
    property GetriebeOK: Boolean read FGetriebeOK;

    property MastLaenge: Integer read FiMastL write SetMastL;
    property MastUnten: Integer read FiMastunten write SetMastunten;
    property MastOben: Integer read FiMastoben write SetMastoben;
    property MastfallVorlauf: Integer read FiMastfallVorlauf write FiMastfallVorlauf;

    property phi: double read FrPhi write FrPhi;
    property psi: double read FrPsi write FrPsi;
    property alpha: double read FrAlpha;
    property epsilon: double read FrEpsilon write FrEpsilon;
    property WantenSpannung: Integer read FiWPowerOS write FiWPowerOS;
    property ControllerAnschlag: Integer read FiControllerAnschlag write FiControllerAnschlag;

    property SalingDaten: TSalingDaten read GetSalingDaten;
    property Glieder: TTrimmControls read GetGlieder write SetGlieder;
    property RealGlied[Index: TsbName]: double read GetRealGlied write SetRealGlied;
  end;

implementation

uses
  RiggVar.App.Main;

constructor TGetriebe.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  WantLogoData := false;
  LogList := TStringList.Create;
  SchnittKK := TSchnittKK.Create;
  TrimmTab := TTrimmTab.Create;
  FSalingTyp := stFest;
  FManipulatorMode := false;
  GetBuiltinData;
  IntGliederToReal;
  Reset;
end;

destructor TGetriebe.Destroy;
begin
  LogList.Free;
  SchnittKK.Free;
  TrimmTab.Free;
  inherited Destroy;
end;

(* **************************************************************** *)

procedure TGetriebe.SetSalingTyp(Value: TSalingTyp);
begin
  if Value <> FSalingTyp then
  begin
    FSalingTyp := Value;
  end;
end;

procedure TGetriebe.SetMastunten(Value: Integer);
begin
  if Value <> FiMastunten then
  begin
    FiMastunten := Value;
    FrMastunten := Value;
  end;
end;

procedure TGetriebe.SetMastoben(Value: Integer);
begin
  if Value <> FiMastoben then
  begin
    FiMastoben := Value;
    FrMastoben := Value;
  end;
end;

procedure TGetriebe.SetMastL(Value: Integer);
begin
  if Value <> FiMastL then
 begin
    FiMastL := Value;
    FrMastEnde := Value - FiMastoben - FiMastunten;
  end;
end;

function TGetriebe.GetGlieder: TTrimmControls;
var
  Trimm: TTrimmControls;
begin
  RealGliederToInt;
  with Trimm do
  begin
    Controller := FiController;
    Wanten := FiWunten3d + FiWoben3d;
    Woben := FiWoben3d;
    SalingH := FiSalingH;
    SalingA := FiSalingA;
    SalingL := FiSalingL;
    Vorstag := FiVorstag;
    Winkel := FiWinkel;
    WPowerOS := FiWPowerOS;
  end;
  result := Trimm;
end;

procedure TGetriebe.SetGlieder(Values: TTrimmControls);
begin
  with Values do
  begin
    FiController := Controller;
    FiWinkel := Winkel;
    FiVorstag := Vorstag;
    FiWunten3d := Wanten - Woben;
    FiWoben3d := Woben;
    FiSalingH := SalingH;
    FiSalingA := SalingA;
    FiSalingL := SalingL;
    FiWPowerOS := WPowerOS;
  end;
  IntGliederToReal;
end;

function TGetriebe.GetRealGlied(Index: TsbName): double;
begin
  result := 0;
  case Index of
    fpController: result := FrController;
    fpWinkel: result := FrWinkel;
    fpVorstag: result := FrVorstag;
    fpWante: result := FrWunten3d + FrWoben3d;
    fpWoben: result := FrWoben3d;
    fpSalingH: result := FrSalingH;
    fpSalingA: result := FrSalingA;
    fpSalingL: result := FrSalingL;
    fpVorstagOS: result := FrVorstag;
    fpWPowerOS: result := FiWPowerOS;
  end;
end;

procedure TGetriebe.SetRealGlied(Index: TsbName; Value: double);
begin
  case Index of
    fpController: FrController := Value;
    fpWinkel: FrWinkel := Value;
    fpVorstag: FrVorstag := Value;
    fpWante: FrWunten3d := Value - FrWoben3d;
    fpWoben:
      begin
        FrWunten3d := FrWunten3d + FrWoben3d - Value;
        FrWoben3d := Value;
      end;
    fpSalingH: FrSalingH := Value;
    fpSalingA: FrSalingA := Value;
    fpSalingL: FrSalingL := Value;
    fpVorstagOS: FrVorstag := Value;
    fpWPowerOS: FiWPowerOS := Round(Value);
  end;
end;

function TGetriebe.GetSalingDaten: TSalingDaten;
var
  SD: TSalingDaten;
  ooTempA, ooTempB, ooTempC: TRealPoint;
  EbeneACD, EbeneACA0: TRealPoint;
  tempWW, tempWS: double;
  tempSinus, tempCosinus: double;
begin
  ooTempA := Evektor(rP[ooA], rP[ooC]);
  ooTempB := Evektor(rP[ooA0], rP[ooA]);
  tempWW := sprod(ooTempA, ooTempB);
  try
    tempWW := arctan2(sqrt(1 - sqr(tempWW)), tempWW);
    { Wurzel ev. Null bei stOhne }
  except
    on EMathError do
      tempWW := 0;
  end;
  { ooTempA := Evektor(rP[ooA],rP[ooC]); }
  ooTempB := Evektor(rP[ooA], rP[ooD]);
  EbeneACD := vprod(ooTempA, ooTempB);

  { ooTempA := Evektor(rP[ooA],rP[ooC]); }
  ooTempB := Evektor(rP[ooA], rP[ooA0]);
  EbeneACA0 := vprod(ooTempA, ooTempB);

  ooTempA := Evektor(Null, EbeneACD);
  ooTempB := Evektor(Null, EbeneACA0);
  ooTempC := vprod(ooTempA, ooTempB);
  tempSinus := Abstand(Null, ooTempC);
  tempCosinus := sprod(ooTempA, ooTempB);

  tempWS := 0;
  try
    tempWS := arctan2(tempSinus, tempCosinus);
  except
    on EMathError do
      Main.Logger.Error('Ebenen senkrecht in GetSalingDaten!');
  end;

  with SD do
  begin
    SalingH := FrSalingH;
    SalingA := FrSalingA;
    SalingL := FrSalingL;
    SalingW := arctan2(FrSalingA / 2, FrSalingH) * 180 / pi;
    WantenWinkel := tempWW * 180 / pi;
    KraftWinkel := tempWS * 180 / pi;
  end;
  result := SD;
end;

(* **************************************************************** *)

procedure TGetriebe.IntGliederToReal;
begin
  FrController := FiController;
  FrWinkel := FiWinkel / 10 * pi / 180; { FrWinkel in Grad }
  FrVorstag := FiVorstag;
  FrWunten3d := FiWunten3d;
  FrWoben3d := FiWoben3d;
  FrSalingH := FiSalingH;
  FrSalingA := FiSalingA;
  FrSalingL := FiSalingL;

  FrMastunten := FiMastunten;
  FrMastoben := FiMastoben;
  FrMastEnde := FiMastL - FiMastoben - FiMastunten;
end;

procedure TGetriebe.RealGliederToInt;
begin
  FiController := Round(FrController);
  FiWinkel := Round(FrWinkel * 10 * 180 / pi); { FiWinkel in 10E-1 Grad }
  FiVorstag := Round(FrVorstag);
  FiWunten3d := Round(FrWunten3d);
  FiWoben3d := Round(FrWoben3d);
  FiSalingH := Round(FrSalingH);
  FiSalingA := Round(FrSalingA);
  FiSalingL := Round(FrSalingL);

  FiMastunten := Round(FrMastunten);
  FiMastoben := Round(FrMastoben);
  FiMastL := Round(FrMastunten + FrMastoben + FrMastEnde);
end;

procedure TGetriebe.UpdateGSB;
begin
  RealGliederToInt;
  GSB[fpController, Ist] := FiController;
  GSB[fpWinkel, Ist] := FiWinkel;
  GSB[fpVorstag, Ist] := FiVorstag;
  GSB[fpWante, Ist] := FiWunten3d + FiWoben3d;
  GSB[fpWoben, Ist] := FiWoben3d;
  GSB[fpSalingH, Ist] := FiSalingH;
  GSB[fpSalingA, Ist] := FiSalingA;
  GSB[fpSalingL, Ist] := FiSalingL;
  GSB[fpVorstagOS, Ist] := FiVorstag;
  GSB[fpWPowerOS, Ist] := FiWPowerOS;
end;

procedure TGetriebe.UpdateGlieder;
begin
  FiController := GSB[fpController, Ist];
  FiWinkel := GSB[fpWinkel, Ist];
  FiVorstag := GSB[fpVorstag, Ist];
  FiWunten3d := GSB[fpWante, Ist] - GSB[fpWoben, Ist];
  FiWoben3d := GSB[fpWoben, Ist];
  FiSalingH := GSB[fpSalingH, Ist];
  FiSalingA := GSB[fpSalingA, Ist];
  FiSalingL := GSB[fpSalingL, Ist];
  FiWPowerOS := GSB[fpWPowerOS, Ist];
  IntGliederToReal;
end;

procedure TGetriebe.Wanten2dTo3d;
begin
  FrWunten3d := Round(sqrt(sqr(FrWunten2d) + sqr((FrPuettingA - FrSalingA) / 2)));
  FrWoben3d := Round(sqrt(sqr(FrWoben2d) + sqr(FrSalingA / 2)));
end;

procedure TGetriebe.Wanten3dTo2d;
begin
  FrWunten2d := sqrt(sqr(FrWunten3d) - sqr((FrPuettingA - FrSalingA) / 2));
  FrWoben2d := sqrt(sqr(FrWoben3d) - sqr(FrSalingA / 2));
end;

function TGetriebe.GetriebeStatusText: string;
var
  S: string;
begin
  S := '  Getriebe:';
  if FGetriebeOK then
    S := S + ' O.K.'
  else
  begin
    if gsWanteZukurz in FGetriebeStatus then
      S := S + ' Wante zu kurz.'
    else if gsWanteZulang in FGetriebeStatus then
      S := S + Format(' Wante um %5.2f mm zu lang!', [FrWanteZulang])
    else if gsErrorPsivonPhi in FGetriebeStatus then
      S := S + ' Salinghöhe zu klein!';
  end;
  result := S;
end;

procedure TGetriebe.GetBuiltinData;
begin
  if WantLogoData then
    GetLogoData
  else
    GetDefaultData;
end;

procedure TGetriebe.GetDefaultData;
{ Initialisierung aller Integerwerte und der TrimmTabelle;
  nachfolgend muß IntGliederToReal und Reset aufgerufen werden, um die
  Gleitkommawerte zu initialiseieren. }
var
  i: TsbName;
begin
  // see (update) similar code (duplication) in TRggDocument.GetDefaultDoc

  { Längen im Rigg in mm }
  FiControllerAnschlag := 50;
  FiController := 100; { Controllerposition bzw. Abstand E0-E }
  FiMastL := 6115; { Gesamtlänge Mast }
  FiMastunten := 2600; { unterer Teil Mast }
  FiMastoben := 2000; { oberer Teil Mast }
  FiMastfallVorlauf := 5000; { Abstand der Meßmarken }
  FiWunten3d := 2100; { unterer Teil Wante }
  FiWoben3d := 2020; { oberer Teil Wante }
  FiSalingH := 220; { Höhe des Salingdreiecks }
  FiSalingA := 850; { Abstand der Salingnocken }
  FiSalingL := Round(sqrt(sqr(FiSalingH) + sqr(FiSalingA / 2)));
  FiVorstag := 4500; { Vorstaglänge }
  FiWinkel := 950; { Winkel der unteren Wantabschnitte Winkel in 10E-1 Grad }
  FiWPowerOS := 1000; { angenommene Wantenspannung 3d }

  { RumpfKoordinaten in mm }
  iP[ooA0, x] := 2560; { Pütting Stbd }
  iP[ooA0, y] := 765;
  iP[ooA0, z] := 430;

  iP[ooB0, x] := 2560; { Püttinge Bb }
  iP[ooB0, y] := -765;
  iP[ooB0, z] := 430;

  iP[ooC0, x] := 4140; { Vorstag }
  iP[ooC0, y] := 0;
  iP[ooC0, z] := 340;

  iP[ooD0, x] := 2870; { Mastfuß }
  iP[ooD0, y] := 0;
  iP[ooD0, z] := -100;

  iP[ooE0, x] := 2970; { Controller }
  iP[ooE0, y] := 0;
  iP[ooE0, z] := 450;

  iP[ooF0, x] := -30; { Spiegel }
  iP[ooF0, y] := 0;
  iP[ooF0, z] := 300;

  iP[ooP0] := iP[ooA0];
  iP[ooP0, y] := 0;

  GSB[fpController, Ist] := FiController;
  GSB[fpWinkel, Ist] := FiWinkel;
  GSB[fpVorstag, Ist] := FiVorstag;
  GSB[fpWante, Ist] := FiWunten3d + FiWoben3d;
  GSB[fpWoben, Ist] := FiWoben3d;
  GSB[fpSalingH, Ist] := FiSalingH;
  GSB[fpSalingA, Ist] := FiSalingA;
  GSB[fpSalingL, Ist] := FiSalingL; {oben aus FiSalingH und FiSalingA errechnet}
  GSB[fpVorstagOS, Ist] := FiVorstag;
  GSB[fpWPowerOS, Ist] := FiWPowerOS;

  for i := fpController to fpWPowerOS do begin
    {GSB[i,Min] := GSB[i,Ist]-100;}{wird unten genau eingestellt}
    {GSB[i,Max] := GSB[i,Ist]+100;}{wird unten genau eingestellt}
    GSB[i, TinyStep] := 1;
    GSB[i, BigStep] := 10;
  end;
  { Bereichsgrenzen einstellen:
    Woben2d.Min + SalingH.Min > Mastoben
    Mastunten + SalingH.Min > Abstand D0-P, daraus Winkel.Max }
  GSB[fpController, Min] := 50;
  GSB[fpController, Max] := 200;
  GSB[fpWinkel, Min] := 850;
  GSB[fpWinkel, Max] := 1050;
  GSB[fpVorstag, Min] := 4400;
  GSB[fpVorstag, Max] := 4600;
  GSB[fpWante, Min] := 4050;
  GSB[fpWante, Max] := 4200;
  GSB[fpWoben, Min] := 2000;
  GSB[fpWoben, Max] := 2070;
  GSB[fpSalingH, Min] := 140;
  GSB[fpSalingH, Max] := 300;
  GSB[fpSalingA, Min] := 780;
  GSB[fpSalingA, Max] := 1000;
  GSB[fpSalingL, Min] := 450;
  GSB[fpSalingL, Max] := 600;
  GSB[fpVorstagOS, Min] := 4200;
  GSB[fpVorstagOS, Max] := 4700;
  GSB[fpWPowerOS, Min] := 100;
  GSB[fpWPowerOS, Max] := 3000;

  TrimmTab.TrimmTabDaten := DefaultTrimmTabDaten;
end;

procedure TGetriebe.GetLogoData;
{ Initialisierung aller Integerwerte und der TrimmTabelle;
  nachfolgend muß IntGliederToReal und Reset aufgerufen werden, um die
  Gleitkommawerte zu initialiseieren. }
var
  i: TsbName;
  f, ox, oz: Integer;
begin
  // see similar code (duplication) in TRggDocument.GetLogoDoc

  ox := 1400;
  oz := -350;

  f := 18;

  { Längen im Rigg in mm }
  FiControllerAnschlag := 50;
  FiController := 100; { Controllerposition bzw. Abstand E0-E }
  FiMastL := Round((40 + sqrt(250) * 10) * f); { Gesamtlänge Mast }
  FiMastunten := Round((sqrt(40) + sqrt(10)) * 10 * f); { unterer Teil Mast }
  FiMastoben := Round(sqrt(40) * 10 * f); { oberer Teil Mast }
  FiMastfallVorlauf := Round(FiMastL * 0.75); { Abstand der Meßmarken }
  FiWunten3d := Round(sqrt(40) * 10 * f); { unterer Teil Wante }
  FiWoben3d := Round(sqrt(56) * 10 * f); { oberer Teil Wante }
  FiSalingH := 40 * f; { Höhe des Salingdreiecks }
  FiSalingA := 80 * f; { Abstand der Salingnocken }
  FiSalingL := Round(sqrt(sqr(FiSalingH) + sqr(FiSalingA / 2)));
  FiVorstag := Round(sqrt(288) * 10 * f); { Vorstaglänge }
  FiWinkel := Round((90 + arctan2(1, 3) * 180 / pi) * 10);
  { Winkel der unteren Wantabschnitte Winkel in 10E-1 Grad }
  FiWPowerOS := 1000; { angenommene Wantenspannung 3d }

  { RumpfKoordinaten in mm }
  iP[ooA0, x] := 30 * f + ox;  { Pütting Stbd }
  iP[ooA0, y] := 40 * f;
  iP[ooA0, z] := 40 * f + oz;

  iP[ooB0, x] := 30 * f + ox;
  iP[ooB0, y] := -40 * f;
  iP[ooB0, z] := 40 * f + oz;

  iP[ooC0, x] := 150 * f + ox;
  iP[ooC0, y] := 0;
  iP[ooC0, z] := 40 * f + oz;

  iP[ooD0, x] := 80 * f + ox;
  iP[ooD0, y] := 0;
  iP[ooD0, z] := 10 * f + oz;

  iP[ooE0, x] := 85 * f + ox;
  iP[ooE0, y] := 0;
  iP[ooE0, z] := 50 * f + oz;

  iP[ooF0, x] := -85 * f + ox;
  iP[ooF0, y] := 0;
  iP[ooF0, z] := 40 * f + oz;

  iP[ooP0] := iP[ooA0];
  iP[ooP0, y] := 0;

  GSB[fpController, Ist] := FiController;
  GSB[fpWinkel, Ist] := FiWinkel;
  GSB[fpVorstag, Ist] := FiVorstag;
  GSB[fpWante, Ist] := FiWunten3d + FiWoben3d;
  GSB[fpWoben, Ist] := FiWoben3d;
  GSB[fpSalingH, Ist] := FiSalingH;
  GSB[fpSalingA, Ist] := FiSalingA;
  GSB[fpSalingL, Ist] := FiSalingL; {oben aus FiSalingH und FiSalingA errechnet}
  GSB[fpVorstagOS, Ist] := FiVorstag;
  GSB[fpWPowerOS, Ist] := FiWPowerOS;

  for i := fpController to fpWPowerOS do
  begin
    {GSB[i,Min] := GSB[i,Ist]-100;}{wird unten genau eingestellt}
    {GSB[i,Max] := GSB[i,Ist]+100;}{wird unten genau eingestellt}
    GSB[i, TinyStep] := 1;
    GSB[i, BigStep] := 10;
  end;

  { Bereichsgrenzen einstellen:
    Woben2d.Min + SalingH.Min > Mastoben
    Mastunten + SalingH.Min > Abstand D0-P, daraus Winkel.Max }
  GSB[fpController, Min] := 50;
  GSB[fpController, Max] := 200;
  GSB[fpWinkel, Min] := 700;
  GSB[fpWinkel, Max] := 1200;
  GSB[fpVorstag, Min] := FiVorstag - 20 * f;
  GSB[fpVorstag, Max] := FiVorstag + 0 * f;
  GSB[fpWante, Min] := FiWunten3D + FiWoben3D - 10 * f;
  GSB[fpWante, Max] := FiWunten3D + FiWoben3D + 10 * f;
  GSB[fpWoben, Min] := FiWoben3D - 10 * f;
  GSB[fpWoben, Max] := FiWoben3D + 10 * f;
  GSB[fpSalingH, Min] := FiSalingH - 10 * f;
  GSB[fpSalingH, Max] := FiSalingH + 10 * f;
  GSB[fpSalingA, Min] := FiSalingA - 10 * f;
  GSB[fpSalingA, Max] := FiSalingA + 10 * f;
  GSB[fpSalingL, Min] := FiSalingL - 10 * f;
  GSB[fpSalingL, Max] := FiSalingL + 10 * f;
  GSB[fpVorstagOS, Min] := FiVorstag - 10 * f;
  GSB[fpVorstagOS, Max] := FiVorstag + 10 * f;
  GSB[fpWPowerOS, Min] := 100;
  GSB[fpWPowerOS, Max] := 3000;

  TrimmTab.TrimmTabDaten := DefaultTrimmTabDaten;
end;

procedure TGetriebe.Reset;
{ Wenn die Integerwerte für Rumpf und Mast verändert wurden, dann muß Reset
  aufgerufen werden, um die Gleitkommawerte zu aktualisieren. }
var
  i: TRiggPoints;
  j: TKoord;
begin
  { Rumpfkoordinaten }
  iP[ooP0] := iP[ooA0];
  iP[ooP0, y] := 0; { diesen Integerwert hier aktualisieren }
  for i := ooA0 to ooP0 do
  begin
    for j := x to z do
    begin
      rP[i, j] := iP[i, j];
    end;
  end;
  { Mast }
  FrMastEnde := FiMastL - FiMastunten - FiMastoben;
  { Rumpflängen }
  FrPuettingA := rP[ooA0, y] - rP[ooB0, y];
  FrBasis := Abstand(rP[ooP0], rP[ooD0]);
  FrAlpha := arctan2((rP[ooP0, z] - rP[ooD0, z]), (rP[ooD0, x] - rP[ooP0, x]));
end;

{ ****************************************************************************** }

procedure TGetriebe.WriteToIniFile(ini: TIniFile);
var
  S: string;
begin
    S := 'Rigg';
  ini.WriteInteger(S, 'SalingTyp', Ord(FSalingTyp));
    TrimmTab.WriteToIniFile(ini);

    S := 'Mast';
  ini.WriteInteger(S, 'MastL', FiMastL);
  ini.WriteInteger(S, 'Mastunten', FiMastunten);
  ini.WriteInteger(S, 'Mastoben', FiMastoben);
  ini.WriteInteger(S, 'MastfallVorlauf', FiMastfallVorlauf);

    S := 'Ist';
  ini.WriteInteger(S, 'Controller', FiController);
  ini.WriteInteger(S, 'Winkel', FiWinkel);
  ini.WriteInteger(S, 'Vorstag', FiVorstag);
  ini.WriteInteger(S, 'Wante', FiWunten3d + FiWoben3d);
  ini.WriteInteger(S, 'Woben', FiWoben3d);
  ini.WriteInteger(S, 'SalingH', FiSalingH);
  ini.WriteInteger(S, 'SalingA', FiSalingA);
  ini.WriteInteger(S, 'WPowerOS', FiWPowerOS);

  S := 'Min';
  ini.WriteInteger(S, 'Controller', GSB[fpController, Min]);
  ini.WriteInteger(S, 'Winkel', GSB[fpWinkel, Min]);
  ini.WriteInteger(S, 'Vorstag', GSB[fpVorstag, Min]);
  ini.WriteInteger(S, 'Wante', GSB[fpWante, Min]);
  ini.WriteInteger(S, 'Woben', GSB[fpWoben, Min]);
  ini.WriteInteger(S, 'SalingH', GSB[fpSalingH, Min]);
  ini.WriteInteger(S, 'SalingA', GSB[fpSalingA, Min]);
  ini.WriteInteger(S, 'SalingL', GSB[fpSalingL, Min]);
  ini.WriteInteger(S, 'VorstagOS', GSB[fpVorstagOS, Min]);
  ini.WriteInteger(S, 'WPowerOS', GSB[fpWPowerOS, Min]);

  S := 'Max';
  ini.WriteInteger(S, 'Controller', GSB[fpController, Max]);
  ini.WriteInteger(S, 'Winkel', GSB[fpWinkel, Max]);
  ini.WriteInteger(S, 'Vorstag', GSB[fpVorstag, Max]);
  ini.WriteInteger(S, 'Wante', GSB[fpWante, Max]);
  ini.WriteInteger(S, 'Woben', GSB[fpWoben, Max]);
  ini.WriteInteger(S, 'SalingH', GSB[fpSalingH, Max]);
  ini.WriteInteger(S, 'SalingA', GSB[fpSalingA, Max]);
  ini.WriteInteger(S, 'SalingL', GSB[fpSalingL, Max]);
  ini.WriteInteger(S, 'VorstagOS', GSB[fpVorstagOS, Max]);
  ini.WriteInteger(S, 'WPowerOS', GSB[fpWPowerOS, Max]);

  S := 'Koordinaten Rumpf';
  ini.WriteInteger(S, 'A0x', iP[ooA0, x]);
  ini.WriteInteger(S, 'A0y', iP[ooA0, y]);
  ini.WriteInteger(S, 'A0z', iP[ooA0, z]);
  ini.WriteInteger(S, 'B0x', iP[ooB0, x]);
  ini.WriteInteger(S, 'B0y', iP[ooB0, y]);
  ini.WriteInteger(S, 'B0z', iP[ooB0, z]);
  ini.WriteInteger(S, 'C0x', iP[ooC0, x]);
  ini.WriteInteger(S, 'C0y', iP[ooC0, y]);
  ini.WriteInteger(S, 'C0z', iP[ooC0, z]);
  ini.WriteInteger(S, 'D0x', iP[ooD0, x]);
  ini.WriteInteger(S, 'D0y', iP[ooD0, y]);
  ini.WriteInteger(S, 'D0z', iP[ooD0, z]);
  ini.WriteInteger(S, 'E0x', iP[ooE0, x]);
  ini.WriteInteger(S, 'E0y', iP[ooE0, y]);
  ini.WriteInteger(S, 'E0z', iP[ooE0, z]);
  ini.WriteInteger(S, 'F0x', iP[ooF0, x]);
  ini.WriteInteger(S, 'F0y', iP[ooF0, y]);
  ini.WriteInteger(S, 'F0z', iP[ooF0, z]);

  S := 'Koordinaten Rigg';
  ini.WriteInteger(S, 'Ax', iP[ooA, x]);
  ini.WriteInteger(S, 'Ay', iP[ooA, y]);
  ini.WriteInteger(S, 'Az', iP[ooA, z]);
  ini.WriteInteger(S, 'Bx', iP[ooB, x]);
  ini.WriteInteger(S, 'By', iP[ooB, y]);
  ini.WriteInteger(S, 'Bz', iP[ooB, z]);
  ini.WriteInteger(S, 'Cx', iP[ooC, x]);
  ini.WriteInteger(S, 'Cy', iP[ooC, y]);
  ini.WriteInteger(S, 'Cz', iP[ooC, z]);
  ini.WriteInteger(S, 'Dx', iP[ooD, x]);
  ini.WriteInteger(S, 'Dy', iP[ooD, y]);
  ini.WriteInteger(S, 'Dz', iP[ooD, z]);
  ini.WriteInteger(S, 'Ex', iP[ooE, x]);
  ini.WriteInteger(S, 'Ey', iP[ooE, y]);
  ini.WriteInteger(S, 'Ez', iP[ooE, z]);
  ini.WriteInteger(S, 'Fx', iP[ooF, x]);
  ini.WriteInteger(S, 'Fy', iP[ooF, y]);
  ini.WriteInteger(S, 'Fz', iP[ooF, z]);
end;

procedure TGetriebe.LoadFromIniFile(ini: TIniFile);
var
  S: string;
begin
    S := 'Rigg';
  SalingTyp := TSalingTyp(ini.ReadInteger(S, 'SalingTyp', Ord(stFest)));

    TrimmTab.LoadFromIniFile(ini);

    S := 'Mast';
  FiMastL := ini.ReadInteger(S, 'MastL', FiMastL);
  FiMastunten := ini.ReadInteger(S, 'Mastunten', FiMastunten);
  FiMastoben := ini.ReadInteger(S, 'Mastoben', FiMastoben);
  FiMastfallVorlauf := ini.ReadInteger(S, 'MastfallVorlauf', FiMastfallVorlauf);

    S := 'Ist';
  FiController := ini.ReadInteger(S, 'Controller', FiController);
  FiWinkel := ini.ReadInteger(S, 'Winkel', FiWinkel);
  FiVorstag := ini.ReadInteger(S, 'Vorstag', FiVorstag);
  FiWoben3d := ini.ReadInteger(S, 'Woben', FiWoben3d);
  FiWunten3d := ini.ReadInteger(S, 'Wante', FiWunten3d + FiWoben3d) - FiWoben3d;
  FiSalingH := ini.ReadInteger(S, 'SalingH', FiSalingH);
  FiSalingA := ini.ReadInteger(S, 'SalingA', FiSalingA);
  FiWPowerOS := ini.ReadInteger(S, 'WPowerOS', FiWPowerOS);

  S := 'Min';
  GSB[fpController, Min] := ini.ReadInteger(S, 'Controller', GSB[fpController, Min]);
  GSB[fpWinkel, Min] := ini.ReadInteger(S, 'Winkel', GSB[fpWinkel, Min]);
  GSB[fpVorstag, Min] := ini.ReadInteger(S, 'Vorstag', GSB[fpVorstag, Min]);
  GSB[fpWante, Min] := ini.ReadInteger(S, 'Wante', GSB[fpWante, Min]);
  GSB[fpWoben, Min] := ini.ReadInteger(S, 'Woben', GSB[fpWoben, Min]);
  GSB[fpSalingH, Min] := ini.ReadInteger(S, 'SalingH', GSB[fpSalingH, Min]);
  GSB[fpSalingA, Min] := ini.ReadInteger(S, 'SalingA', GSB[fpSalingA, Min]);
  GSB[fpSalingL, Min] := ini.ReadInteger(S, 'SalingL', GSB[fpSalingL, Min]);
  GSB[fpVorstagOS, Min] := ini.ReadInteger(S, 'VorstagOS', GSB[fpVorstagOS, Min]);
  GSB[fpWPowerOS, Min] := ini.ReadInteger(S, 'WPowerOS', GSB[fpWPowerOS, Min]);

  S := 'Max';
  GSB[fpController, Max] := ini.ReadInteger(S, 'Controller', GSB[fpController, Max]);
  GSB[fpWinkel, Max] := ini.ReadInteger(S, 'Winkel', GSB[fpWinkel, Max]);
  GSB[fpVorstag, Max] := ini.ReadInteger(S, 'Vorstag', GSB[fpVorstag, Max]);
  GSB[fpWante, Max] := ini.ReadInteger(S, 'Wante', GSB[fpWante, Max]);
  GSB[fpWoben, Max] := ini.ReadInteger(S, 'Woben', GSB[fpWoben, Max]);
  GSB[fpSalingH, Max] := ini.ReadInteger(S, 'SalingH', GSB[fpSalingH, Max]);
  GSB[fpSalingA, Max] := ini.ReadInteger(S, 'SalingA', GSB[fpSalingA, Max]);
  GSB[fpSalingL, Max] := ini.ReadInteger(S, 'SalingL', GSB[fpSalingL, Max]);
  GSB[fpVorstagOS, Max] := ini.ReadInteger(S, 'VorstagOS', GSB[fpVorstagOS, Max]);
  GSB[fpWPowerOS, Max] := ini.ReadInteger(S, 'WPowerOS', GSB[fpWPowerOS, Max]);

  S := 'Koordinaten Rumpf';
  iP[ooA0, x] := ini.ReadInteger(S, 'A0x', iP[ooA0, x]);
  iP[ooA0, y] := ini.ReadInteger(S, 'A0y', iP[ooA0, y]);
  iP[ooA0, z] := ini.ReadInteger(S, 'A0z', iP[ooA0, z]);
  iP[ooB0, x] := ini.ReadInteger(S, 'B0x', iP[ooB0, x]);
  iP[ooB0, y] := ini.ReadInteger(S, 'B0y', iP[ooB0, y]);
  iP[ooB0, z] := ini.ReadInteger(S, 'B0z', iP[ooB0, z]);
  iP[ooC0, x] := ini.ReadInteger(S, 'C0x', iP[ooC0, x]);
  iP[ooC0, y] := ini.ReadInteger(S, 'C0y', iP[ooC0, y]);
  iP[ooC0, z] := ini.ReadInteger(S, 'C0z', iP[ooC0, z]);
  iP[ooD0, x] := ini.ReadInteger(S, 'D0x', iP[ooD0, x]);
  iP[ooD0, y] := ini.ReadInteger(S, 'D0y', iP[ooD0, y]);
  iP[ooD0, z] := ini.ReadInteger(S, 'D0z', iP[ooD0, z]);
  iP[ooE0, x] := ini.ReadInteger(S, 'E0x', iP[ooE0, x]);
  iP[ooE0, y] := ini.ReadInteger(S, 'E0y', iP[ooE0, y]);
  iP[ooE0, z] := ini.ReadInteger(S, 'E0z', iP[ooE0, z]);
  iP[ooF0, x] := ini.ReadInteger(S, 'F0x', iP[ooF0, x]);
  iP[ooF0, y] := ini.ReadInteger(S, 'F0y', iP[ooF0, y]);
  iP[ooF0, z] := ini.ReadInteger(S, 'F0z', iP[ooF0, z]);

    S := 'Koordinaten Rigg';
  iP[ooA, x] := ini.ReadInteger(S, 'Ax', iP[ooA, x]);
  iP[ooA, y] := ini.ReadInteger(S, 'Ay', iP[ooA, y]);
  iP[ooA, z] := ini.ReadInteger(S, 'Az', iP[ooA, z]);
  iP[ooB, x] := ini.ReadInteger(S, 'Bx', iP[ooB, x]);
  iP[ooB, y] := ini.ReadInteger(S, 'By', iP[ooB, y]);
  iP[ooB, z] := ini.ReadInteger(S, 'Bz', iP[ooB, z]);
  iP[ooC, x] := ini.ReadInteger(S, 'Cx', iP[ooC, x]);
  iP[ooC, y] := ini.ReadInteger(S, 'Cy', iP[ooC, y]);
  iP[ooC, z] := ini.ReadInteger(S, 'Cz', iP[ooC, z]);
  iP[ooD, x] := ini.ReadInteger(S, 'Dx', iP[ooD, x]);
  iP[ooD, y] := ini.ReadInteger(S, 'Dy', iP[ooD, y]);
  iP[ooD, z] := ini.ReadInteger(S, 'Dz', iP[ooD, z]);
  iP[ooE, x] := ini.ReadInteger(S, 'Ex', iP[ooE, x]);
  iP[ooE, y] := ini.ReadInteger(S, 'Ey', iP[ooE, y]);
  iP[ooE, z] := ini.ReadInteger(S, 'Ez', iP[ooE, z]);
  iP[ooF, x] := ini.ReadInteger(S, 'Fx', iP[ooF, x]);
  iP[ooF, y] := ini.ReadInteger(S, 'Fy', iP[ooF, y]);
  iP[ooF, z] := ini.ReadInteger(S, 'Fz', iP[ooF, z]);
end;

procedure TGetriebe.LoadFromStream(S: TStream);
var
  temp: Integer;
begin
  S.ReadBuffer(temp, SizeOf(Integer));
  SalingTyp := TSalingTyp(temp);
  TrimmTab.LoadFromStream(S);
  { Mast }
  S.ReadBuffer(FiMastL, SizeOf(Integer));
  S.ReadBuffer(FiMastunten, SizeOf(Integer));
  S.ReadBuffer(FiMastoben, SizeOf(Integer));
  S.ReadBuffer(FiMastfallVorlauf, SizeOf(Integer));
  { Ist }
  S.ReadBuffer(FiController, SizeOf(Integer));
  S.ReadBuffer(FiWinkel, SizeOf(Integer));
  S.ReadBuffer(FiVorstag, SizeOf(Integer));
  S.ReadBuffer(FiWoben3d, SizeOf(Integer));
  S.ReadBuffer(FiWunten3d, SizeOf(Integer));
  S.ReadBuffer(FiSalingH, SizeOf(Integer));
  S.ReadBuffer(FiSalingA, SizeOf(Integer));
  S.ReadBuffer(FiWPowerOS, SizeOf(Integer));
  { GSB }
  S.ReadBuffer(GSB, SizeOf(TsbArray));
  { Koordinaten }
  S.ReadBuffer(iP, SizeOf(TIntRiggPoints));
end;

procedure TGetriebe.SaveToStream(S: TStream);
begin
  S.WriteBuffer(SalingTyp, SizeOf(Integer));
  TrimmTab.SaveToStream(S);
  { Mast }
  S.WriteBuffer(FiMastL, SizeOf(Integer));
  S.WriteBuffer(FiMastunten, SizeOf(Integer));
  S.WriteBuffer(FiMastoben, SizeOf(Integer));
  S.WriteBuffer(FiMastfallVorlauf, SizeOf(Integer));
  { Ist }
  S.WriteBuffer(FiController, SizeOf(Integer));
  S.WriteBuffer(FiWinkel, SizeOf(Integer));
  S.WriteBuffer(FiVorstag, SizeOf(Integer));
  S.WriteBuffer(FiWoben3d, SizeOf(Integer));
  S.WriteBuffer(FiWunten3d, SizeOf(Integer));
  S.WriteBuffer(FiSalingH, SizeOf(Integer));
  S.WriteBuffer(FiSalingA, SizeOf(Integer));
  S.WriteBuffer(FiWPowerOS, SizeOf(Integer));
  { GSB }
  S.WriteBuffer(GSB, SizeOf(TsbArray));
  { Koordinaten }
  S.WriteBuffer(iP, SizeOf(TIntRiggPoints));
end;

end.

