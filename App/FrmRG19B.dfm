object FormRG19B: TFormRG19B
  Left = 0
  Top = 0
  Caption = 'RG19B'
  ClientHeight = 695
  ClientWidth = 1094
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBoxR: TPaintBox
    Left = 688
    Top = 287
    Width = 105
    Height = 105
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 673
    Width = 1094
    Height = 22
    Panels = <
      item
        Text = 'MenuText'
        Width = 353
      end
      item
        Text = 'RiggText'
        Width = 50
      end>
  end
  object SpeedPanel: TPanel
    Left = 0
    Top = 0
    Width = 1094
    Height = 55
    Align = alTop
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object OpenBtn: TSpeedButton
      Left = 8
      Top = 3
      Width = 25
      Height = 25
      Hint = #214'ffnen|'
      Glyph.Data = {
        06020000424D0602000000000000760000002800000028000000140000000100
        0400000000009001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        333FFFFFFFFFFFFFF3333380000000000000333333888888888888883F333300
        7B7B7B7B7B7B033333883F33333333338F33330F07B7B7B7B7B70333338F8F33
        3333333383F3330B0B7B7B7B7B7B7033338F83F33333333338F3330FB0B7B7B7
        B7B7B033338F38F333333333383F330BF07B7B7B7B7B7B03338F383FFFFF3333
        338F330FBF000007B7B7B703338F33888883FFFFFF83330BFBFBFBF000000033
        338F3333333888888833330FBFBFBFBFBFB03333338F333333333338F333330B
        FBFBFBFBFBF03333338F33333FFFFFF83333330FBFBF0000000333333387FFFF
        8888888333333330000033333333333333388888333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        33333333333333333333}
      NumGlyphs = 2
    end
    object SaveBtn: TSpeedButton
      Left = 33
      Top = 3
      Width = 25
      Height = 25
      Hint = 'Speichern|'
      Glyph.Data = {
        06020000424D0602000000000000760000002800000028000000140000000100
        0400000000009001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333FFFFFFFFFFFFFF3333380000000000008333
        333888F8FF888F888F333330CC08CCF770CC0333333888F8FF888F888F333330
        CC08CCF770CC0333333888F888888F888F333330CC07887770CC03333338888F
        FFFFF8888F333330CC60000006CC033333388888888888888F333330CCCCCCCC
        CCCC033333388888888888888F333330C6000000006C03333338888888888888
        8F333330C0FFFFFFFF0C0333333888FFFFFFFF888F333330C0FFFFFFFF0C0333
        333888FFFFFFFF888F333330C0FFFFFFFF0C0333333888FFFFFFFF888F333330
        C0FFFFFFFF0C0333333888FFFFFFFF888F33333000FFFFFFFF000333333888FF
        FFFFFF888F333330C0FFFFFFFF0C0333333888FFFFFFFF888F33333800000000
        0000833333388888888888888333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        33333333333333333333}
      NumGlyphs = 2
    end
    object ExitBtn: TSpeedButton
      Left = 66
      Top = 3
      Width = 25
      Height = 25
      Hint = 'Beenden|'
      Glyph.Data = {
        06020000424D0602000000000000760000002800000028000000140000000100
        0400000000009001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00377777777777
        777777773FFFFFFFFFFFF333333F888888888888F7F7F7888888888888883333
        33888888888888877F7F788888888888888F333FF88844444400888FFF444444
        88888888888333888883333334D5007FFF433333333338F888F3338F33333333
        345D50FFFF4333333333388788F3338F3333333334D5D0FFFF433333333338F8
        78F3338F33333333345D50FEFE4333333333388788F3338F3333333334D5D0FF
        FF433333333338F878F3338F33333333345D50FEFE4333333333388788F3338F
        3333333334D5D0FFFF433333333338F878F3338F33333333345D50FEFE433333
        3333388788F3338F3333333334D5D0EFEF433333333338F878F3338F33333333
        345D50FEFE4333333333388788F3338F3333333334D5D0EFEF433333333338F8
        F8FFFF8F33333333344444444443333333333888888888833333333333333333
        3333333333333333FFFFFF333333333333300000033333333333333888888F33
        333333333330AAAA0333333333333338FFFF8F33333333333330000003333333
        33333338888883333333}
      NumGlyphs = 2
    end
    object UpdateBtn: TSpeedButton
      Left = 113
      Top = 3
      Width = 25
      Height = 25
      Hint = 'Rigg neu Berechnen|'
      Caption = '='
      NumGlyphs = 2
    end
    object BtnGrau: TSpeedButton
      Left = 294
      Top = 3
      Width = 25
      Height = 25
      Hint = '2D Grafik - Entspanntes Rigg einblenden|'
      AllowAllUp = True
      GroupIndex = 2
      Down = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777777977788CCC7777777977788CCC7777877797888CCC7777877797888CC
        C7777877779888CCC7797877779888CCC7797887778987CCC7977887788987CC
        C7977887888897CCC9777888888897CCC9777788888779CC977777888887797C
        977777888877779CC7777788887777CCC7777777777777777777}
    end
    object KoppelBtn: TSpeedButton
      Left = 319
      Top = 3
      Width = 25
      Height = 25
      Hint = '2D Grafik - Koppelkurve anzeigen|'
      AllowAllUp = True
      GroupIndex = 3
      Down = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333BBBB3333333333331313133333333333333BBBB333
        33333331111313333333333333BBBBB333333333331133313333333333333BBB
        333333333333111133333333333333BBB333333333333131333333333333333B
        BB333333333333331133333333333333BB333333333333313133333333333333
        BB3331133333333313133B3333333333BB33313113333333131333BB3333333B
        B3333311311111111133333BBBBBBBBBB333333333333131133333333BBBBBB3
        3333333333111333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object ReglerBtn: TSpeedButton
      Left = 138
      Top = 3
      Width = 25
      Height = 25
      Hint = 'Trimm Regeln|'
      Caption = 'R'
    end
    object MemoryBtn: TSpeedButton
      Left = 163
      Top = 3
      Width = 25
      Height = 25
      Hint = 'Memory (Trimm als Referenz speichern|)'
      Caption = 'M'
    end
    object MemoryRecallBtn: TSpeedButton
      Left = 188
      Top = 3
      Width = 30
      Height = 25
      Hint = 'Memory Recall|'
      Caption = 'MR'
    end
    object PaintBtn: TSpeedButton
      Left = 244
      Top = 3
      Width = 25
      Height = 25
      Hint = '2D Grafik - Alte Grafik stehenlassen|'
      AllowAllUp = True
      GroupIndex = 1
      Glyph.Data = {
        CA010000424DCA01000000000000760000002800000022000000110000000100
        04000000000054010000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777777777777777777770000007C9C7C7C9C7C779977111717111717711700
        00007C9C7C7C9C9C79977711171711111711770000007C7C9C7C7C9C79777717
        111717111717770000007C7C9C7C7C9C99797717111717111117170000007C7C
        7C9C7C7C97797717171117171177170000007C9C7C9C7C7C9799771117111717
        1171170000007C9C7C7C9C7C77977711171711171771770000007C9C9C7C9C7C
        79977711111711171711770000007C7C9C7C7C9C797777171117171117177700
        00007C7C9C9C7C9C79777717111117111717770000007C7C7C9C7C7C97777717
        171117171177770000007C7C7C9C9C7C97777717171111171177770000007C7C
        7C7C9C7C77777717171711171777770000007C7C7C7C9C9C7777771717171111
        1777770000007C7C7C7C7C9C7777771717171711177777000000777777777777
        7777777777777777777777000000}
      NumGlyphs = 2
    end
    object BtnBlau: TSpeedButton
      Left = 269
      Top = 3
      Width = 25
      Height = 25
      Hint = '2D Grafik - Nullstellung anzeigen|'
      AllowAllUp = True
      GroupIndex = 4
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777877
        7777700000007EE8EEEE88E7EE77700000007EEEEEEEEE7EEEEE7000000078EE
        E0000EEE00EE700000007EEE00EE00EE00E7700000007E8E00EE00EEEEEE7000
        00007EEE00EE0077E77E700000007EEE00EE00EEEEE77000000078EE00EE00EE
        7EEE700000007EEE00EE00EE7EE870000000788E00EE00EEEE8E700000007EEE
        00EE00E77EEE700000008EEEE0000EEEEE7E7000000078EE7EEEEE7E8EEE7000
        000078EE7EEE8E7EEE88700000007EE8EEEE8EEE7EEE70000000777777777777
        777770000000}
    end
    object SofortBtn: TSpeedButton
      Left = 479
      Top = 3
      Width = 25
      Height = 25
      Hint = 'Umschalter Rigg sofort berechnen (Automatik)|'
      AllowAllUp = True
      GroupIndex = 8
      Down = True
      Caption = 'A'
    end
    object DiffBtn: TSpeedButton
      Left = 429
      Top = 3
      Width = 25
      Height = 25
      Hint = 'Umschalter Differenzen/Absolutwerte|'
      AllowAllUp = True
      GroupIndex = 7
      Caption = 'D'
    end
    object WinkelBtn: TSpeedButton
      Left = 454
      Top = 3
      Width = 25
      Height = 25
      Hint = 'Umschalter Winkel/Vorstag|'
      AllowAllUp = True
      GroupIndex = 9
      Caption = 'W'
    end
    object ControllerBtn: TSpeedButton
      Left = 404
      Top = 3
      Width = 25
      Height = 25
      Hint = 'Umschalter f'#252'r Controller-Modus|'
      AllowAllUp = True
      GroupIndex = 6
      Down = True
      Caption = 'C'
    end
    object ZweischlagBtn: TSpeedButton
      Left = 344
      Top = 3
      Width = 25
      Height = 25
      Hint = '2D Grafik - Mast als Zweischlag einzeichnen|'
      AllowAllUp = True
      GroupIndex = 5
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0077CCC7777777
        7777700000007CCCCC0000077777700000007CCCCCCAAAA007777000000077CC
        CCCCAAAAA07770000000770CCCCCCAAAAA0770000000770ACCCCCCAAAA077000
        000070AAACCCCCCAAAA07000000070AAAACCCCCCAAA07000000070AAAAACCCCC
        CAA07000000070AAAAAACCCCCAA07000000070AAAAACCCCCAAA070000000770A
        AACCCCCAAA0770000000770AACCCCCCAAA07700000007770ACCCCCAAA0777000
        00007777CCCCCAA00777700000007777CCCCC00777777000000077777CCC7777
        777770000000}
    end
  end
  object ReportListBox: TListBox
    Left = 8
    Top = 389
    Width = 169
    Height = 180
    ItemHeight = 13
    Items.Strings = (
      'Listbox')
    TabOrder = 2
  end
  object ReportMemo: TMemo
    Left = 211
    Top = 289
    Width = 291
    Height = 140
    Lines.Strings = (
      'ReportMemo')
    TabOrder = 3
  end
  object TrimmMemo: TMemo
    Left = 8
    Top = 62
    Width = 169
    Height = 185
    Lines.Strings = (
      'TrimmMemo')
    TabOrder = 4
  end
  object TrimmCombo: TComboBox
    Left = 8
    Top = 262
    Width = 155
    Height = 21
    TabOrder = 5
    Text = 'TrimmCombo'
  end
  object ParamCombo: TComboBox
    Left = 8
    Top = 289
    Width = 155
    Height = 21
    TabOrder = 6
    Text = 'ParamCombo'
  end
  object ViewpointCombo: TComboBox
    Left = 8
    Top = 316
    Width = 155
    Height = 21
    TabOrder = 7
    Text = 'ViewpointCombo'
  end
  object FixPointCombo: TComboBox
    Left = 8
    Top = 343
    Width = 155
    Height = 21
    TabOrder = 8
    Text = 'FixpointCombo'
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'rgi'
    Filter = 'Rigg Ini File (*.rgi)|*.rgi|Alle Dateien (*.*)|*.*'
    Options = [ofOverwritePrompt, ofPathMustExist, ofFileMustExist]
    Left = 303
    Top = 550
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'rgi'
    Filter = 'Rigg Ini File (*.rgi)|*.rgi|Alle Dateien (*.*)|*.*'
    Options = [ofOverwritePrompt, ofPathMustExist]
    Left = 408
    Top = 550
  end
end
