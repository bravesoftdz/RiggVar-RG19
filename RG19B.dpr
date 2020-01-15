﻿program RG19B;

uses
  Vcl.Forms,
  FrmRG19B in 'App\FrmRG19B.pas' {FormRG19B},
  FrmMain in 'App\FrmMain.pas' {FormMain},
  FrmText in 'App\FrmText.pas' {TextForm},
  FrmRegler in 'Frm\FrmRegler.pas' {CtrlDlg},
  FrmReport in 'Frm\FrmReport.pas' {ReportForm},
  FrmSelect in 'Frm\FrmSelect.pas' {MemoDlg},
  FrmOptions in 'Frm\FrmOptions.pas' {OptionForm},
  FrmPreview in 'Frm\FrmPreview.pas' {PreviewGForm},
  FrmReglerGraph in 'Frm\FrmReglerGraph.pas' {CtrlDlg1},
  FrmBiege in 'Frm\FrmBiege.pas' {BiegeUndNeigeForm},
  FrmInput in 'Frm\FrmInput.pas' {InputForm},
  FrmOutput in 'Frm\FrmOutput.pas' {OutputForm},
  FrmGrafic in 'Frm\FrmGrafic.pas' {GrafikForm},
  FrmRot in 'Frm\FrmRot.pas' {RotationForm},
  FrmConsole in 'Frm\FrmConsole.pas' {ConsoleForm},
  FrmChart in 'Frm\FrmChart.pas' {ChartForm},
  FrmAuswahl in 'Frm\FrmAuswahl.pas' {YAuswahlDlg},
  FrmProgress in 'Frm\FrmProgress.pas' {ProgressDlg},
  FrmChartRgg in 'Frm\FrmChartRgg.pas' {ChartFormGS},
  FrmInfo in 'Frm\FrmInfo.pas' {KreisForm},
  FrmMemo in 'Frm\FrmMemo.pas' {MemoFormC},
  FrmAni in 'Frm\FrmAni.pas' {AnimationForm},
  FrmAniRot in 'Frm\FrmAniRot.pas' {AniRotationForm},
  FrmModel in 'Frm\FrmModel.pas' {RiggDialog},
  FrmCmd in 'Frm\FrmCmd.pas' {CommandForm},
  FrmAdjust in 'Frm\FrmAdjust.pas' {AdjustForm},
  FrmScale in 'Frm\FrmScale.pas' {RumpfFaktorDlg},
  FrmIndicator in 'Frm\FrmIndicator.pas' {IndicatorForm},
  FwUnit in 'Core\FwUnit.pas',
  Iotypes in 'Core\Iotypes.pas',
  RggTypes in 'Core\RggTypes.pas',
  RggUnit0 in 'Core\RggUnit0.pas',
  RggUnit1 in 'Core\RggUnit1.pas',
  RggUnit2 in 'Core\RggUnit2.pas',
  RggUnit3 in 'Core\RggUnit3.pas',
  RggUnit4 in 'Core\RggUnit4.pas',
  RiggUnit in 'Core\RiggUnit.pas',
  RggCtrls in 'Graph\RggCtrls.pas',
  Rggmat01 in 'Graph\Rggmat01.pas',
  Rggdoc in 'Core\Rggdoc.pas',
  RggGbox in 'Graph\RggGbox.pas',
  RggPBox in 'Graph\RggPBox.pas',
  RggHull in 'Graph\RggHull.pas',
  RggPal in 'Graph\RggPal.pas',
  TrimmTab in 'Core\TrimmTab.pas',
  Print004 in 'Util\Print004.pas',
  uRggPrinter in 'Graph\uRggPrinter.pas',
  Vector3d in 'Graph\Vector3d.pas',
  StrBox in 'Util\StrBox.pas',
  Saling3Eck in 'Core\Saling3Eck.pas',
  ThreeD in 'Graph\ThreeD.pas',
  ThreeDSolid in 'Graph\ThreeDSolid.pas',
  Schnttkk in 'Core\Schnttkk.pas',
  Vcalc116 in 'Core\Vcalc116.pas',
  RggGraph in 'Graph\RggGraph.pas',
  Polarkar in 'Graph\Polarkar.pas',
  BootGraph in 'Graph\BootGraph.pas',
  RaumGraph in 'Graph\RaumGraph.pas',
  RiggVar.InfoMemo in 'Util\RiggVar.InfoMemo.pas',
  FrmKreis in 'Frm\FrmKreis.pas',
  RiggVar.App.Main in 'App\RiggVar.App.Main.pas',
  RiggVar.Util.Logger in 'Util\RiggVar.Util.Logger.pas',
  RggScroll in 'Core\RggScroll.pas',
  RiggVar.FB.Classes in 'FB\RiggVar.FB.Classes.pas',
  RiggVar.RG.Data in 'RG\RiggVar.RG.Data.pas',
  RiggVar.App.Main0 in 'App\RiggVar.App.Main0.pas',
  RiggVar.App.Main1 in 'App\RiggVar.App.Main1.pas',
  RiggVar.Util.AppUtils in 'Util\RiggVar.Util.AppUtils.pas',
  RiggVar.RG.Main in 'RG\RiggVar.RG.Main.pas',
  RiggVar.RG.Def in 'RG\RiggVar.RG.Def.pas',
  RggKraft in 'Graph\RggKraft.pas',
  RiggVar.RG.Track in 'RG\RiggVar.RG.Track.pas',
  RiggVar.RG.Graph in 'RG\RiggVar.RG.Graph.pas',
  RiggVar.RG.Report in 'RG\RiggVar.RG.Report.pas',
  RiggVar.VM.FormMain in 'VM\RiggVar.VM.FormMain.pas',
  RiggVar.VM.FormMainB in 'VM\RiggVar.VM.FormMainB.pas',
  RiggVar.VM.FormMainA in 'VM\RiggVar.VM.FormMainA.pas',
  RggRota in 'Graph\RggRota.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'RG19B';
  Application.CreateForm(TFormRG19B, FormRG19B);
  Application.CreateForm(TBiegeUndNeigeForm, BiegeUndNeigeForm);
  Application.CreateForm(TCtrlDlg, CtrlDlg);
  Application.CreateForm(TCtrlDlg1, CtrlDlg1);
  Application.CreateForm(TMemoDlg, MemoDlg);
  Application.CreateForm(TOptionForm, OptionForm);
  Application.CreateForm(TPreviewGForm, PreviewGForm);
  Application.CreateForm(TYAuswahlDlg, YAuswahlDlg);
  Application.Run;
end.