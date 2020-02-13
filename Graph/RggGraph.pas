﻿unit RggGraph;

interface

uses
  System.Classes,
  System.Types,
  Vcl.Graphics,
  RggTypes,
  RggDisplay,
  RggPolarKar;

type
  TRggGraph = class
  private
    FFixPunkt: TRealPoint;
    FZoom: single;
    FColored: Boolean;
  protected
    GrafikOK: Boolean; // loaded
    Updated: Boolean; // transformed
    procedure SetFixPunkt(Value: TRealPoint);
    procedure SetZoom(Value: single); virtual;
  public
    Rotator: TPolarKar; // injected, not owned
    DL: TRggDisplayList;
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Update; virtual;
    procedure DrawToCanvas(Canvas: TCanvas); virtual;
    procedure GetPlotList(ML: TStrings); virtual;

    property FixPunkt: TRealPoint read FFixPunkt write SetFixPunkt;
    property Zoom: single read FZoom write SetZoom;
    property Coloriert: Boolean read FColored write FColored;
  end;

implementation

constructor TRggGraph.Create;
begin
  DL := TRggDisplayList.Create;
  FColored := True;
  FZoom := 0.05;
end;

destructor TRggGraph.Destroy;
begin
  DL.Free;
  inherited;
end;

procedure TRggGraph.SetFixPunkt(Value: TRealPoint);
begin
  FFixPunkt := Value;
  Updated := False;
end;

procedure TRggGraph.SetZoom(Value: single);
begin
  FZoom := Value;
  Updated := False;
end;

procedure TRggGraph.Update;
begin
  //if GrafikOK then ...
  //virtual
end;

procedure TRggGraph.DrawToCanvas(Canvas: TCanvas);
begin
  //if GrafikOK then ...
  //virtual
end;

procedure TRggGraph.GetPlotList(ML: TStrings);
begin
  //if GrafikOK then ...
  //virtual
end;

end.
