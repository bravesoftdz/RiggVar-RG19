﻿unit RiggVar.App.Main0;

(*
-
-     F
-    * * *
-   *   *   G
-  *     * *   *
- E - - - H - - - I
-  *     * *         *
-   *   *   *           *
-    * *     *             *
-     D-------A---------------B
-              *
-              (C) federgraph.de
-
*)

interface

uses
  System.SysUtils,
  System.Classes,
  System.Math,
  System.UIConsts,
  Vcl.Controls,
  RiggVar.FB.Action,
  RiggVar.FB.ActionConst,
  RiggVar.FB.ActionGroups,
  RiggVar.FB.ActionTable,
  RiggVar.FB.ActionKeys,
  RiggVar.FB.ActionMap,
  RiggVar.FB.ActionTest,
  RiggVar.FB.TextBase,
  RiggVar.FederModel.Action,
  RiggVar.FederModel.Binding,
  RiggVar.FederModel.TouchBase,
  RiggVar.FederModel.Touch,
  RiggVar.FederModel.TouchPhone,
  RiggVar.RG.Main;

type
  TMain0 =  class(TRggMain)
  private
    FTouch: Integer;
    procedure InitRaster;
    function GetIsLandscape: Boolean;
    function GetIsPortrait: Boolean;
    function GetColorScheme: Integer;
    procedure SetColorScheme(const Value: Integer);
    procedure InitFederText(ft: TFederTouch0);
    function GetIsPhone: Boolean;
    procedure SetTouch(const Value: Integer);
    function GetFederText: TFederTouchBase;
  public
    ActionMap1: TActionMap;
    ActionMap2: TActionMap;
    ActionHandler: IFederActionHandler;
    ActionHelper: TActionHelper;

    IsOrthoProjection: Boolean;

    FederText1: TFederTouch;
    FederText2: TFederTouchPhone;

    FederKeyboard: TFederKeyboard;
    BackgroundLock: Boolean;

    ActionGroupList: TActionGroupList;
    ActionTest: TActionTest;
    FederBinding: TFederBinding;

    Scale: single;
    IsRetina: Boolean;

    constructor Create;
    destructor Destroy; override;

    procedure HandleAction(fa: Integer); virtual;
    function GetChecked(fa: TFederAction): Boolean; virtual;

    procedure InitText;

    procedure DoTouchbarLeft(Delta: single);
    procedure DoTouchbarRight(Delta: single);
    procedure DoTouchbarBottom(Delta: single);
    procedure DoTouchbarTop(Delta: single);

    procedure CycleToolSet(i: Integer); virtual;
    procedure CycleColorSchemeM; virtual;
    procedure CycleColorSchemeP; virtual;
    procedure ToggleDarkMode;

    procedure BlackText;
    procedure GrayText;
    procedure WhiteText;

    procedure InitTouch;
    procedure UpdateTouch;

    procedure UpdateText(ClearFlash: Boolean = False); override;

    procedure PlusOne;
    procedure PlusTen;
    procedure DoMouseWheel(Shift: TShiftState; WheelDelta: Integer);

    property IsPhone: Boolean read GetIsPhone;
    property IsLandscape: Boolean read GetIsLandscape;
    property IsPortrait: Boolean read GetIsPortrait;

    property ColorScheme: Integer read GetColorScheme write SetColorScheme;
    property Touch: Integer read FTouch write SetTouch;

    property ActionMapTablet: TActionMap read ActionMap1;
    property ActionMapPhone: TActionMap read ActionMap2;

    property Keyboard: TFederKeyboard read FederKeyboard;
    property FederText: TFederTouchBase read GetFederText;
  end;

implementation

uses
  FrmMain,
  RiggVar.App.Main,
  RiggVar.FederModel.Keyboard01,
  RiggVar.FederModel.ActionMapPhone,
  RiggVar.FederModel.ActionMapTablet;

{ TMain0 }

constructor TMain0.Create;
begin
  inherited;
  Scale := MainVar.Scale;
  IsRetina := Scale > 1;

  ActionGroupList := TActionGroupList.Create;
  ActionTest := TActionTest.Create;

  ActionMap1 := TActionMapTablet.Create;
  ActionMap2 := TActionMapPhone.Create;

  InitRaster;

  TTouchBtn.WantHint := True;
  FederText1 := TFederTouch.Create(nil);
  FederText2 := TFederTouchPhone.Create(nil);
  FederKeyboard := TFederKeyboard01.Create;
  FederBinding := TFederBinding.Create;

  ActionHandler := TFederActionHandler.Create;
  ActionHelper := TActionHelper.Create(ActionHandler);
end;

destructor TMain0.Destroy;
begin
  ActionHelper.Free;
  ActionMap1.Free;
  ActionMap2.Free;

  FederKeyboard.Free;
  FederText1.Free;
  FederText2.Free;

  ActionGroupList.Free;
  ActionTest.Free;
  FederBinding.Free;

  inherited;
end;

procedure TMain0.BlackText;
begin
  MainVar.ColorScheme.BlackText;
  FederText.UpdateColorScheme;
end;

procedure TMain0.WhiteText;
begin
  MainVar.ColorScheme.WhiteText;
  FederText.UpdateColorScheme;
end;

procedure TMain0.GrayText;
begin
  MainVar.ColorScheme.GrayText;
  FederText.UpdateColorScheme;
end;

procedure TMain0.InitFederText(ft: TFederTouch0);
begin
  if ft is TControl then
  begin
    ft.Parent := FormMain;
    TFederTouchBase.OwnerComponent := ft;
    TFederTouchBase.ParentObject := ft;
  end
  else
  begin
    TFederTouchBase.OwnerComponent := FormMain;
    TFederTouchBase.ParentObject := FormMain;
  end;

  ft.Left := 0;
  ft.Top := 0;
  ft.Width := MainVar.ClientWidth;
  ft.Height := MainVar.ClientHeight;
  ft.Init;
end;

procedure TMain0.InitRaster;
begin
  MainVar.ClientWidth := FormMain.ClientWidth;
  MainVar.ClientHeight := FormMain.ClientHeight;
end;

procedure TMain0.InitText;
begin
  MainVar.ClientWidth := FormMain.ClientWidth;
  MainVar.ClientHeight := FormMain.ClientHeight;
  InitFederText(FederText1);
  InitFederText(FederText2);
  Touch := faTouchDesk;
end;

procedure TMain0.InitTouch;
begin
  InitRaster;
  FederText2.Visible := IsPhone;
  FederText1.Visible := not FederText2.Visible;
end;

procedure TMain0.UpdateText;
begin
  if FederText <> nil then
    FederText.UpdateText;
end;

procedure TMain0.UpdateTouch;
begin
  if Assigned(FederText) and FederText.InitOK then
  begin
    MainVar.ClientWidth := FormMain.ClientWidth;
    MainVar.ClientHeight := FormMain.ClientHeight;
    InitTouch;
    FederText.UpdateShape;
  end;
end;

function TMain0.GetIsLandscape: Boolean;
begin
  result := FormMain.ClientWidth >= FormMain.ClientHeight;
end;

function TMain0.GetIsPhone: Boolean;
var
  MinCount, MaxCount: Integer;
begin
  case FTouch of
    faTouchPhone: result := True;
    faTouchTablet: result := False;
    else
    begin
      MinCount := Min(FormMain.ClientHeight, FormMain.ClientWidth) div MainVar.ScaledRaster;
      MaxCount := Max(FormMain.ClientHeight, FormMain.ClientWidth) div MainVar.ScaledRaster;
      result  := (MinCount < 8) or (MaxCount < 12);
    end;
  end;
end;

function TMain0.GetIsPortrait: Boolean;
begin
  result := FormMain.ClientWidth < FormMain.ClientHeight;
end;

procedure TMain0.SetColorScheme(const Value: Integer);
begin
  if not BackgroundLock then
  begin
    MainVar.ColorScheme.Scheme := Value;
    MainVar.ColorScheme.Init(Value);
//    if MainVar.ColorScheme.claBackground = claNull then
//      BlackText;
    FormMain.UpdateBackgroundColor(MainVar.ColorScheme.claBackground);
    FederText.UpdateColorScheme;
  end;

  if IsUp then
  begin
    FormMain.SpeedPanel.DarkMode := MainVar.ColorScheme.IsDark;
    FormMain.SpeedPanel.UpdateColor;
    FormMain.UpdateColorScheme;
  end;
end;

procedure TMain0.ToggleDarkMode;
begin
  if MainVar.ColorScheme.IsDark then
    ColorScheme := MainVar.ColorScheme.Light
  else
    ColorScheme := MainVar.ColorScheme.Dark;
end;

procedure TMain0.SetTouch(const Value: Integer);
begin
  FTouch := Value;

  if IsPhone then
    FederText1.Visible := False
  else case FTouch of
    faTouchTablet: FederText1.Visible := True;
    faTouchPhone: FederText1.Visible := False;
    else
      FederText1.Visible := not IsPhone;
  end;
  FederText2.Visible := not FederText1.Visible;

  FederText.UpdateShape;
end;

procedure TMain0.CycleColorSchemeM;
var
  i: Integer;
  l: Boolean;
begin
  l := BackgroundLock;
  BackgroundLock := false;
  i := ColorScheme;
  Dec(i);
  if (i < 1) then
    i := ColorSchemeCount;
  if i > ColorSchemeCount then
    i := 1;

  MainVar.ColorScheme.SchemeDefault := i;
  ColorScheme := i;
  BackgroundLock := l;
end;

procedure TMain0.CycleColorSchemeP;
var
  i: Integer;
  l: Boolean;
begin
  l := BackgroundLock;
  BackgroundLock := false;
  i := ColorScheme;
  Inc(i);
  if (i < 1) then
    i := ColorSchemeCount;
  if i > ColorSchemeCount then
    i := 1;

  MainVar.ColorScheme.SchemeDefault := i;
  ColorScheme := i;
  BackgroundLock := l;
end;

procedure TMain0.CycleToolSet(i: Integer);
begin
  FederText.UpdateToolSet(i);
  FormMain.UpdateReport;
end;

function TMain0.GetColorScheme: Integer;
begin
  result := MainVar.ColorScheme.Scheme;
end;

function TMain0.GetFederText: TFederTouchBase;
begin
  case FTouch of
    faTouchTablet: result := FederText1;
    faTouchPhone: result := FederText2;
    faTouchDesk:
    begin
      if IsPhone then
        result := FederText2
      else
        result := FederText1;
    end;
    else
      result := FederText1;
  end;
end;

procedure TMain0.HandleAction(fa: Integer);
begin
  if IsUp then
  case fa of
    faNoop: ;
    faToggleTouchFrame: FederText.ToggleTouchFrame;

    faActionPageM: CycleToolSet(-1);
    faActionPageP: CycleToolSet(1);

    faCycleColorSchemeM: CycleColorSchemeM;
    faCycleColorSchemeP: CycleColorSchemeP;

    faToggleFontColor: ToggleDarkMode;

    else
    begin
      FormMain.HandleAction(fa);
    end;
  end;
end;

function TMain0.GetChecked(fa: TFederAction): Boolean;
var
  F: TFormMain;
begin
  F := FormMain;
  result := false;
  if not IsUp then
    Exit;

  case fa of
    faMemeToggleReport: result := F.ReportText.Visible;
    faButtonFrameReport: result := F.WantButtonFrameReport;
    faChartRect..faChartReset: result := F.ChartGraph.GetChecked(fa);
    faReportNone..faReportReadme: result := F.ReportManager.GetChecked(fa);

    faToggleDataText: result := F.ShowDataText;
    faToggleDiffText: result := F.ShowDiffText;
    faToggleTrimmText: result := F.ShowTrimmText;

    faToggleFontColor: result := MainVar.ColorScheme.IsDark;

    else
      result := F.GetChecked(fa);
  end;
end;

procedure TMain0.DoTouchbarLeft(Delta: single);
begin
  DoMouseWheel([ssCtrl], Round(Delta));
end;

procedure TMain0.DoTouchbarTop(Delta: single);
begin
  FormMain.RotaForm.RotateZ(Delta * 0.3);
end;

procedure TMain0.DoTouchbarRight(Delta: single);
begin
  DoMouseWheel([ssShift], Round(Delta));
end;

procedure TMain0.DoTouchbarBottom(Delta: single);
begin
  FormMain.RotaForm.Zoom(Delta);
end;

procedure TMain0.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer);
begin
  if ssCtrl in Shift then
  begin
    Main.DoBigWheel(WheelDelta);
  end
  else if ssShift in Shift then
  begin
    Main.DoSmallWheel(WheelDelta);
  end;
  FormMain.UpdateOnParamValueChanged;
end;

procedure TMain0.PlusOne;
begin
  DoMouseWheel([ssShift], 1);
end;

procedure TMain0.PlusTen;
begin
  DoMouseWheel([ssCtrl], 1);
end;

end.
