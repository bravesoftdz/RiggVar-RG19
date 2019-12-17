object RotationForm: TRotationForm
  Left = 126
  Top = 130
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = '3D Grafik'
  ClientHeight = 454
  ClientWidth = 726
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = 16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000099999999999999999999999999999900999
    9999999999999999999999999990099999999999999999999999999999900990
    0000000000000000000000000990099000000000000000000000000009900999
    9999999999999999999999999990099999999999999999999999999999900999
    9999999999999999999999999990099999000099999000000009999999900999
    9000000999900000000009999990099990000000999000000000009999900999
    0009900009990009990000999990099900099900099900099990000999900999
    9999990009990009999900099990099999999900099900099999000099900999
    9999000099990009999990009990099999990009999990009999900099900999
    9999000009999000999990009990099999999900099990009999900099900999
    9999999000999000999990009990099999000990009990009999900099900999
    9900099000999000999900099990099999900000009999000000000999900999
    9990000009999900000000999990099999999000999999000000099999900999
    9999999999999999999999999990099999999999999999999999999999900999
    9999999999999999999999999990099999999999999999999999999999900999
    9999999999999999999999999990000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  Menu = MainMenu
  OldCreateOrder = True
  Position = poDefault
  Scaled = False
  Visible = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object ToolbarPanel: TPanel
    Left = 0
    Top = 0
    Width = 726
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TabStop = True
    OnResize = ToolbarPanelResize
    object LeftButton: TSpeedButton
      Tag = -1
      Left = 710
      Top = 1
      Width = 16
      Height = 18
      Glyph.Data = {
        DE000000424DDE0000000000000076000000280000000D0000000D0000000100
        0400000000006800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7000777777077777700077777007777770007777060777777000777066000007
        7000770666666607700070666666660770007706666666077000777066000007
        7000777706077777700077777007777770007777770777777000777777777777
        7000}
      Visible = False
      OnClick = LeftButtonClick
    end
    object RightButton: TSpeedButton
      Tag = -1
      Left = 710
      Top = 19
      Width = 16
      Height = 16
      Glyph.Data = {
        DE000000424DDE0000000000000076000000280000000D0000000D0000000100
        0400000000006800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7000777777077777700077777700777770007777770607777000770000066077
        7000770666666607700077066666666070007706666666077000770000066077
        7000777777060777700077777700777770007777770777777000777777777777
        7000}
      Visible = False
      OnClick = RightButtonClick
    end
    object Panel: TPanel
      Left = 0
      Top = 0
      Width = 689
      Height = 33
      TabOrder = 0
      object ZoomOutBtn: TSpeedButton
        Left = 12
        Top = 6
        Width = 25
        Height = 25
        Hint = 'Grafik verkleinern|'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33033333333333333F7F3333333333333000333333333333F777333333333333
          000333333333333F777333333333333000333333333333F77733333333333300
          033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
          333333773337777333333078F8F87033333337F3333337F33333778F8F8F8773
          333337333333373F333307F8F8F8F70333337F33FFFFF37F3333078999998703
          33337F377777337F333307F8F8F8F703333373F3333333733333778F8F8F8773
          333337F3333337F333333078F8F870333333373FF333F7333333330777770333
          333333773FF77333333333370007333333333333777333333333}
        NumGlyphs = 2
        OnClick = ZoomOutBtnClick
      end
      object ZoomInBtn: TSpeedButton
        Tag = 1
        Left = 37
        Top = 6
        Width = 25
        Height = 25
        Hint = 'Grafik vergr'#246#223'ern|'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33033333333333333F7F3333333333333000333333333333F777333333333333
          000333333333333F777333333333333000333333333333F77733333333333300
          033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
          33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
          3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
          33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
          333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
          333333773FF77333333333370007333333333333777333333333}
        NumGlyphs = 2
        OnClick = ZoomInBtnClick
      end
      object LeftBtn: TSpeedButton
        Tag = 2
        Left = 70
        Top = 6
        Width = 25
        Height = 25
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333FF3333333333333003333333333333F77F33333333333009033
          333333333F7737F333333333009990333333333F773337FFFFFF330099999000
          00003F773333377777770099999999999990773FF33333FFFFF7330099999000
          000033773FF33777777733330099903333333333773FF7F33333333333009033
          33333333337737F3333333333333003333333333333377333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = LeftBtnClick
      end
      object RightBtn: TSpeedButton
        Tag = 3
        Left = 95
        Top = 6
        Width = 25
        Height = 25
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333FF3333333333333003333
          3333333333773FF3333333333309003333333333337F773FF333333333099900
          33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
          99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
          33333333337F3F77333333333309003333333333337F77333333333333003333
          3333333333773333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = LeftBtnClick
      end
      object UpBtn: TSpeedButton
        Tag = 4
        Left = 120
        Top = 6
        Width = 25
        Height = 25
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
          3333333333777F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
          3333333777737777F333333099999990333333373F3333373333333309999903
          333333337F33337F33333333099999033333333373F333733333333330999033
          3333333337F337F3333333333099903333333333373F37333333333333090333
          33333333337F7F33333333333309033333333333337373333333333333303333
          333333333337F333333333333330333333333333333733333333}
        NumGlyphs = 2
        OnClick = LeftBtnClick
      end
      object DownBtn: TSpeedButton
        Tag = 5
        Left = 145
        Top = 6
        Width = 25
        Height = 25
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333337F33333333333333033333333333333373F333333333333090333
          33333333337F7F33333333333309033333333333337373F33333333330999033
          3333333337F337F33333333330999033333333333733373F3333333309999903
          333333337F33337F33333333099999033333333373333373F333333099999990
          33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333300033333333333337773333333}
        NumGlyphs = 2
        OnClick = LeftBtnClick
      end
      object GammaDownBtn: TSpeedButton
        Tag = 6
        Left = 177
        Top = 6
        Width = 25
        Height = 25
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330333333
          3333333330333333333333330903333333333333090333333333333099903333
          3333333099903333333333099999033333333309999903333333309999999033
          3333300009000033000333330903333309033333090333330903333309033333
          0903333309000000090333330999999999033333000000000003}
        OnClick = LeftBtnClick
      end
      object GammaUpBtn: TSpeedButton
        Tag = 7
        Left = 202
        Top = 6
        Width = 25
        Height = 25
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
          3333333333333303333333333333309033333333333330903333333333330999
          0333333333330999033333333330999990333333333099999033333333099999
          9903300033000090000330903333309033333090333330903333309033333090
          3333309000000090333330999999999033333000000000003333}
        OnClick = LeftBtnClick
      end
      object TransLeftBtn: TSpeedButton
        Tag = 8
        Left = 234
        Top = 6
        Width = 25
        Height = 25
        Hint = 'Grafik nach links schieben|'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000CE0E0000D80E00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333FF3333333333333003333333333333F77F3333333333300C033
          333333333F7737F33333333300CCC0333333333F773337FFFFFF3300CCCCC000
          00003F7733333777777700CCCCCCCCCCCCC0773FF33333FFFFF73300CCCCC000
          000033773FF337777777333300CCC03333333333773FF7F3333333333300C033
          33333333337737F3333333333333003333333333333377333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = TransLeftBtnClick
      end
      object TransRightBtn: TSpeedButton
        Tag = 9
        Left = 259
        Top = 6
        Width = 25
        Height = 25
        Hint = 'Grafik nach rechts schieben|'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000CE0E0000D80E00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333FF3333333333333003333
          3333333333773FF333333333330C003333333333337F773FF3333333330CCC00
          33333FFFFF7F33773FF30000000CCCCC0033777777733333773F0CCCCCCCCCCC
          CC007FFFFFFF33333F770000000CCCCC00337777777F333F77333333330CCC00
          33333333337F3F7733333333330C003333333333337F77333333333333003333
          3333333333773333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = TransLeftBtnClick
      end
      object TransUpBtn: TSpeedButton
        Tag = 10
        Left = 284
        Top = 6
        Width = 25
        Height = 25
        Hint = 'Grafik nach oben schieben|'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000CE0E0000D80E00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
          3333333333777F3333333333330C033333333333337F7F3333333333330C0333
          33333333337F7F3333333333330C033333333333337F7F3333333333330C0333
          33333333337F7F3333333333330C033333333333FF7F7FFFF3333330000C0000
          3333333777737777F3333330CCCCCCC0333333373F333337333333330CCCCC03
          333333337F33337F333333330CCCCC033333333373F333733333333330CCC033
          3333333337F337F33333333330CCC03333333333373F373333333333330C0333
          33333333337F7F3333333333330C033333333333337373333333333333303333
          333333333337F333333333333330333333333333333733333333}
        NumGlyphs = 2
        OnClick = TransLeftBtnClick
      end
      object TransDownBtn: TSpeedButton
        Tag = 11
        Left = 309
        Top = 6
        Width = 25
        Height = 25
        Hint = 'Grafik nach unten schieben|'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000CE0E0000D80E00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333337F33333333333333033333333333333373F3333333333330C0333
          33333333337F7F3333333333330C033333333333337373F33333333330CCC033
          3333333337F337F33333333330CCC033333333333733373F333333330CCCCC03
          333333337F33337F333333330CCCCC033333333373333373F3333330CCCCCCC0
          33333337FFFF3FF7F3333330000C000033333337777F777733333333330C0333
          33333333337F7F3333333333330C033333333333337F7F3333333333330C0333
          33333333337F7F3333333333330C033333333333337F7F3333333333330C0333
          33333333337F7F33333333333300033333333333337773333333}
        NumGlyphs = 2
        OnClick = TransLeftBtnClick
      end
      object NullBtn: TSpeedButton
        Tag = 12
        Left = 342
        Top = 6
        Width = 25
        Height = 25
        Hint = 'Ansicht wechseln|'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555550555
          555555555555F55555555505555B0555570555F55557F55555F55B50555B0555
          7B55575F5557F555575555B5055B5557B5555575F55755557555555B5550005B
          55555557555FFF575555555555BBB0055555555555777FF5555555555BBBBB00
          55555555577777FF55555000BBBBBBB050005FFF7777777F5FFFBBB5BBBBBBB0
          BBB577757777777F77755555BBBBBBB55555555577777775555555555BBBBB55
          55555555577777555555555705BBB55505555555F5777555F555557B5555055B
          505555575555F5575F5557B5555B0555B50555755557F55575F55B55555B0555
          5B5557555557F55557555555555B555555555555555755555555}
        NumGlyphs = 2
        OnClick = NullBtnClick
      end
      object Btn01Grad: TSpeedButton
        Tag = 13
        Left = 374
        Top = 6
        Width = 25
        Height = 25
        Hint = 'Winkelschritt = 0,1 Grad|'
        GroupIndex = 1
        Caption = '.1'
        OnClick = Btn1GradClick
      end
      object Btn1Grad: TSpeedButton
        Tag = 14
        Left = 399
        Top = 6
        Width = 25
        Height = 25
        Hint = 'Winkelschritt = 1 Grad|'
        GroupIndex = 1
        Caption = '1'
        OnClick = Btn1GradClick
      end
      object Btn5Grad: TSpeedButton
        Tag = 15
        Left = 424
        Top = 6
        Width = 25
        Height = 25
        Hint = 'Winkelschritt = 5 Grad|'
        GroupIndex = 1
        Caption = '5'
        OnClick = Btn1GradClick
      end
      object Btn10Grad: TSpeedButton
        Tag = 16
        Left = 449
        Top = 6
        Width = 25
        Height = 25
        Hint = 'Winkelschritt = 10 Grad|'
        GroupIndex = 1
        Caption = '10'
        OnClick = Btn1GradClick
      end
      object Btn30Grad: TSpeedButton
        Tag = 17
        Left = 474
        Top = 6
        Width = 25
        Height = 25
        Hint = 'Winkelschritt = 30 Grad|'
        GroupIndex = 1
        Caption = '30'
        OnClick = Btn1GradClick
      end
      object PaintBtn: TSpeedButton
        Tag = 19
        Left = 573
        Top = 6
        Width = 25
        Height = 25
        Hint = 'alte Grafik stehenlassen|'
        AllowAllUp = True
        GroupIndex = 5
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777700000007C9C7C7C9C7C7799700000007C9C7C7C9C9C7997700000007C7C
          9C7C7C9C7977700000007C7C9C7C7C9C9979700000007C7C7C9C7C7C97797000
          00007C9C7C9C7C7C9799700000007C9C7C7C9C7C7797700000007C9C9C7C9C7C
          7997700000007C7C9C7C7C9C7977700000007C7C9C9C7C9C7977700000007C7C
          7C9C7C7C9777700000007C7C7C9C9C7C9777700000007C7C7C7C9C7C77777000
          00007C7C7C7C9C9C7777700000007C7C7C7C7C9C777770000000777777777777
          777770000000}
        OnClick = PaintBtnClick
      end
      object RumpfBtn: TSpeedButton
        Tag = 20
        Left = 598
        Top = 6
        Width = 25
        Height = 25
        Hint = 'Rumpf einblenden|'
        AllowAllUp = True
        GroupIndex = 2
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777CCCCCCCCC
          C77777CCCC7777CCCC7777CCCC7777CCCC7777CCC777777CCC7777CCC777777C
          CC7777C9CCCCCCCC9C7777CC99AAAA99CC7777CCCA9CC9ACCC7777C77C9AA9C7
          7C77777C77C99C77C777777CC7CBBC7CC777777CC77BB77CC7777777CCCBBCCC
          777777777CCBBCC77777777777CCCC7777777777777CC7777777}
        OnClick = RumpfBtnClick
      end
      object PreviewBtn: TSpeedButton
        Tag = 21
        Left = 623
        Top = 6
        Width = 25
        Height = 25
        Hint = 'Seite einblenden|'
        AllowAllUp = True
        GroupIndex = 3
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777779999999999777777977777777977777797CCCCCC7977777797C7777C7
          977777797C7777C7977777797C7777C7977777797C7777C7977777797C7777C7
          977777797C7777C7977777797C7777C7977777797C7777C7977777797CCCCCC7
          9777777977777777977777799999999997777777777777777777}
        OnClick = PreviewItemClick
      end
      object QuerBtn: TSpeedButton
        Tag = 22
        Left = 648
        Top = 6
        Width = 25
        Height = 25
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
          1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
          1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
          193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
          11155557F755F777777555000755033305555577755F75F77F55555555503335
          0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
          05555757F75F75557F5505000333555505557F777FF755557F55000000355557
          07557777777F55557F5555000005555707555577777FF5557F55553000075557
          0755557F7777FFF5755555335000005555555577577777555555}
        NumGlyphs = 2
      end
      object FixPunktCombo: TComboBox
        Tag = 18
        Left = 512
        Top = 6
        Width = 49
        Height = 24
        Hint = 'Drehpunkt festlegen|'
        Style = csDropDownList
        TabOrder = 0
        OnChange = FixPunktComboChange
        Items.Strings = (
          'A'
          'A0'
          'B'
          'B0'
          'C'
          'C0'
          'D'
          'D0'
          'E'
          'E0'
          'F'
          'F0')
      end
    end
  end
  object RahmenPanel: TPanel
    Left = 31
    Top = 37
    Width = 695
    Height = 398
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BorderWidth = 4
    ParentColor = True
    TabOrder = 1
    object PaintBox3D: TPaintBox
      Left = 5
      Top = 5
      Width = 685
      Height = 388
      Align = alClient
      Color = clBtnFace
      ParentColor = False
      OnMouseDown = PaintBox3DMouseDown
      OnMouseMove = PaintBox3DMouseMove
      OnMouseUp = PaintBox3DMouseUp
      OnPaint = PaintBox3DPaint
      ExplicitWidth = 463
      ExplicitHeight = 207
    end
    object FocusEdit: TEdit
      Left = 10
      Top = 10
      Width = 17
      Height = 24
      Hint = 'Fokus hier --> Pfeiltasten f'#252'r Drehung'
      Color = clBtnFace
      MaxLength = 1
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      Text = 'L'
      OnKeyDown = FocusEditKeyDown
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 435
    Width = 726
    Height = 19
    Panels = <
      item
        Bevel = pbNone
        Width = 33
      end
      item
        Alignment = taRightJustify
        Width = 50
      end
      item
        Bevel = pbNone
        Text = 'phi'
        Width = 50
      end
      item
        Alignment = taRightJustify
        Width = 50
      end
      item
        Bevel = pbNone
        Text = 'theta'
        Width = 50
      end
      item
        Alignment = taRightJustify
        Width = 50
      end
      item
        Bevel = pbNone
        Text = 'gamma'
        Width = 80
      end
      item
        Text = 'zoom'
        Width = 50
      end
      item
        Bevel = pbNone
        Text = 'zoom'
        Width = 50
      end>
  end
  object pnPositionTools: TPanel
    Left = 0
    Top = 37
    Width = 31
    Height = 398
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 3
    object Pos1Btn: TSpeedButton
      Left = 4
      Top = 4
      Width = 25
      Height = 25
      Hint = 'Position #1|'
      GroupIndex = 4
      Caption = 'p1'
      ParentShowHint = False
      ShowHint = True
      OnClick = Pos1BtnClick
    end
    object Pos2Btn: TSpeedButton
      Left = 4
      Top = 29
      Width = 25
      Height = 25
      Hint = 'Position #2|'
      GroupIndex = 4
      Caption = 'p2'
      ParentShowHint = False
      ShowHint = True
      OnClick = Pos1BtnClick
    end
    object Pos3Btn: TSpeedButton
      Left = 4
      Top = 54
      Width = 25
      Height = 25
      Hint = 'Position #3|'
      GroupIndex = 4
      Down = True
      Caption = 'p3'
      ParentShowHint = False
      ShowHint = True
      OnClick = Pos1BtnClick
    end
    object Pos4Btn: TSpeedButton
      Left = 4
      Top = 79
      Width = 25
      Height = 25
      Hint = 'Position #4|'
      GroupIndex = 4
      Caption = 'p4'
      ParentShowHint = False
      ShowHint = True
      OnClick = Pos1BtnClick
    end
    object MemoryBtn: TSpeedButton
      Left = 4
      Top = 111
      Width = 25
      Height = 25
      Hint = 'Position speichern|'
      Caption = 'M'
      ParentShowHint = False
      ShowHint = True
      OnClick = PositionSaveItemClick
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'plt'
    Filter = 'Alle Dateien(*.*)|*.*|Plot Dateien(*.plt)|*.plt'
    FilterIndex = 2
    Left = 81
    Top = 58
  end
  object MainMenu: TMainMenu
    Left = 112
    Top = 58
    object GrafikMenu: TMenuItem
      Caption = '&3D Grafik'
      GroupIndex = 8
      Hint = '  Einstellungen f'#252'r 3D Grafik'
      OnClick = GrafikMenuClick
      object ZoomItem: TMenuItem
        Caption = 'Skalieren'
        Hint = '  Grafik skalieren'
        object ZoomInItem: TMenuItem
          Caption = 'Zoom In'
          Hint = '  Grafik vergr'#246#223'ern'
          ShortCut = 16457
          OnClick = ZoomInBtnClick
        end
        object ZoomOutItem: TMenuItem
          Caption = 'Zoom Out'
          Hint = '  Grafik verkleinern'
          ShortCut = 16463
          OnClick = ZoomOutBtnClick
        end
      end
      object DrehenItem: TMenuItem
        Caption = 'Rotieren'
        Hint = '  Grafik drehen'
        object PhiDownItem: TMenuItem
          Caption = 'Phi ( Pfeiltaste '#39'nach links'#39' )'
          OnClick = PhiDownItemClick
        end
        object PhiUpItem: TMenuItem
          Caption = 'Phi ( Pfeiltaste '#39'nach rechts'#39' )'
          OnClick = PhiDownItemClick
        end
        object ThetaDownItem: TMenuItem
          Caption = 'Theta ( Pfeiltaste '#39'nach unten'#39' )'
          OnClick = PhiDownItemClick
        end
        object ThetaUpItem: TMenuItem
          Caption = 'Theta ( Pfeiltaste '#39'nach oben'#39' )'
          OnClick = PhiDownItemClick
        end
        object GammaDownItem: TMenuItem
          Caption = 'Gamma ( Umsch + Pfeiltaste '#39'nach links'#39' )'
          OnClick = PhiDownItemClick
        end
        object GammaUpItem: TMenuItem
          Caption = 'Gamma ( Umsch + Pfeiltaste '#39'nach rechts'#39' )'
          OnClick = PhiDownItemClick
        end
      end
      object VerschiebenItem: TMenuItem
        Caption = 'Verschieben'
        Hint = '  Grafik verschieben'
        object TransLeftItem: TMenuItem
          Caption = 'nach links ( Ctrl + Pfeiltaste '#39'nach links'#39' )'
          Hint = '  Grafik nach links verschieben'
          OnClick = TransLeftItemClick
        end
        object TransRightItem: TMenuItem
          Caption = 'nach rechts ( Ctrl + Pfeiltaste '#39'nach rechts'#39' )'
          Hint = '  Grafik nach rechts verschieben'
          OnClick = TransLeftItemClick
        end
        object TransUpItem: TMenuItem
          Caption = 'nach oben ( Ctrl + Pfeiltaste '#39'nach oben'#39' )'
          Hint = '  Grafik nach oben verschieben'
          OnClick = TransLeftItemClick
        end
        object TransDownItem: TMenuItem
          Caption = 'nach unten ( Ctrl + Pfeiltaste '#39'nach unten'#39' )'
          Hint = '  Grafik nach unten verschieben'
          OnClick = TransLeftItemClick
        end
      end
      object MinusItem1: TMenuItem
        Caption = '-'
      end
      object DrehpunktItem: TMenuItem
        Caption = 'Drehpunkt'
        Hint = '  Den festgehaltenen Punkt der Grafik bestimmen'
        object A0_Item: TMenuItem
          Caption = 'A0'
          Hint = '  P'#252'tting Stb als Fixpunkt festlegen'
          OnClick = A0_ItemClick
        end
        object B0_Item: TMenuItem
          Caption = 'B0'
          Hint = '  P'#252'tting Bb als Fixpunkt festlegen'
          OnClick = A0_ItemClick
        end
        object C0_Item: TMenuItem
          Caption = 'C0'
          Hint = '  Vorstagbasis als Fixpunkt festlegen'
          OnClick = A0_ItemClick
        end
        object D0_Item: TMenuItem
          Caption = 'D0'
          Hint = '  Mastfu'#223' als Fixpunkt festlegen'
          OnClick = A0_ItemClick
        end
        object E0_Item: TMenuItem
          Caption = 'E0'
          Hint = '  Controllerbasis als Fixpunkt festlegen'
          OnClick = A0_ItemClick
        end
        object F0_Item: TMenuItem
          Caption = 'F0'
          Hint = '  Me'#223'punkt Spiegel als Fixpunkt festlegen'
          OnClick = A0_ItemClick
        end
        object MinusItem8: TMenuItem
          Caption = '-'
        end
        object A_Item: TMenuItem
          Caption = 'A'
          Hint = '  Salingnocke Stb als Fixpunkt festlegen'
          OnClick = A0_ItemClick
        end
        object B_Item: TMenuItem
          Caption = 'B'
          Hint = '  Salingnocke Bb als Fixpunkt festlegen'
          OnClick = A0_ItemClick
        end
        object C_Item: TMenuItem
          Caption = 'C'
          Hint = '  Vorstagpunkt (Mast) als Fixpunkt festlegen'
          OnClick = A0_ItemClick
        end
        object D_Item: TMenuItem
          Caption = 'D'
          Hint = '  Salingpunkt (Mast) als Fixpunkt festlegen'
          OnClick = A0_ItemClick
        end
        object E_Item: TMenuItem
          Caption = 'E'
          Hint = '  Controllerpunkt (Mast) als Fixpunkt festlegen'
          OnClick = A0_ItemClick
        end
        object F_Item: TMenuItem
          Caption = 'F'
          Hint = '  Masttop als Fixpunkt festlegen'
          OnClick = A0_ItemClick
        end
      end
      object StepItem: TMenuItem
        Caption = 'Schrittweite'
        Hint = ' Schrittweite f'#252'r die Drehung (und Verschiebung) festlegen'
        object Step01Item: TMenuItem
          Caption = '0.1 Grad'
          Hint = '  Winkel-Schrittweite von 0,1 Grad einstellen'
          OnClick = Step01ItemClick
        end
        object Step1Item: TMenuItem
          Caption = '   1 Grad'
          Hint = '  Winkel-Schrittweite von 1 Grad einstellen'
          OnClick = Step1ItemClick
        end
        object Step5Item: TMenuItem
          Caption = '   5 Grad'
          Hint = '  Winkel-Schrittweite von 5 Grad einstellen'
          OnClick = Step5ItemClick
        end
        object Step10Item: TMenuItem
          Caption = ' 10 Grad'
          Hint = '  Winkel-Schrittweite von 10 Grad einstellen'
          OnClick = Step10ItemClick
        end
        object Step30Item: TMenuItem
          Caption = ' 30 Grad'
          Hint = '  Winkel-Schrittweite von 30 Grad einstellen'
          OnClick = Step30ItemClick
        end
      end
      object Positionen1: TMenuItem
        Caption = 'Positionen'
        Hint = '  Ansichtspositionen'
        object PositionItem: TMenuItem
          Caption = 'Position wechseln'
          Hint = '  Position des Betrachters umschalten'
          OnClick = NullBtnClick
        end
        object PositionSaveItem: TMenuItem
          Caption = 'Position speichern'
          Hint = '  aktuelle Position '#252'bernehmen'
          OnClick = PositionSaveItemClick
        end
        object PositionResetItem: TMenuItem
          Caption = 'Positionen zur'#252'cksetzen'
          Hint = '  alle Positionen auf Standardwerte setzen'
          OnClick = PositionResetItemClick
        end
      end
      object MinusItem2: TMenuItem
        Caption = '-'
      end
      object ModusItem: TMenuItem
        Caption = 'Absolutwinkel'
        Hint = '  Absolutwerte f'#252'r Drehwinkel oder Inkremente'
        OnClick = ModusItemClick
      end
      object KeepInsideItem: TMenuItem
        Caption = 'Drehpunkt sichtbar'
        Checked = True
        Hint = '  Drehpunkt immer innerhalb der Bildgrenzen halten'
        OnClick = KeepInsideItemClick
      end
      object PaintItem: TMenuItem
        Caption = 'Alte Grafik stehenlassen'
        Hint = '  Alte Grafik stehenlassen oder l'#246'schen'
        ShortCut = 45
        OnClick = PaintBtnClick
      end
      object RumpfItem: TMenuItem
        Caption = 'Boot einblenden'
        Hint = '  Bootsrumpf einblenden'
        ShortCut = 16450
        OnClick = RumpfBtnClick
      end
      object DrawAlwaysItem: TMenuItem
        Caption = 'Boot immer zeichnen'
        Hint = '  Boot auch w'#228'hrend der Bewegung zeichnen'
        OnClick = DrawAlwaysItemClick
      end
      object MinusItem3: TMenuItem
        Caption = '-'
      end
      object PreviewItem: TMenuItem
        Caption = 'Seite einblenden'
        Hint = '  Seitenr'#228'nder einblenden'
        OnClick = PreviewItemClick
      end
      object PrintItem: TMenuItem
        Caption = 'Drucken ...'
        Hint = '  Gafik drucken'
        OnClick = PrintItemClick
      end
      object PlotItem: TMenuItem
        Caption = 'Plotfile ...'
        Hint = '  Grafik im HPGL Format ausgeben'
        OnClick = PlotItemClick
      end
      object MinusItem4: TMenuItem
        Caption = '-'
      end
      object SpeedBarItem: TMenuItem
        Caption = 'Symbolleiste'
        Checked = True
        Hint = '  Symbolleiste einblenden (3D Grafik)'
        OnClick = SpeedBarItemClick
      end
      object PosiToolItem: TMenuItem
        Caption = 'Positionsschalter'
        Checked = True
        Hint = '  Auswahlschalter f'#252'r Positionen einblenden'
        OnClick = PosiToolItemClick
      end
      object StatusBarItem: TMenuItem
        Caption = 'Statusleiste'
        Checked = True
        Hint = '  Statusleiste einblenden (3D Grafik)'
        OnClick = StatusBarItemClick
      end
    end
    object Options3DMenu: TMenuItem
      Caption = '3D &Optionen'
      GroupIndex = 8
      Hint = '  Optionen f'#252'r 3D Grafik'
      OnClick = Options3DMenuClick
      object SelectHullItem: TMenuItem
        Caption = 'Rumpf ausw'#228'hlen'
        object Sample420Item: TMenuItem
          Caption = 'Beispiel 420er Jolle'
          OnClick = Sample420ItemClick
        end
        object SampleDinghyItem: TMenuItem
          Caption = 'Beispiel Dinglhy'
          OnClick = Sample420ItemClick
        end
        object SampleYachtItem: TMenuItem
          Caption = 'Beispiel Yacht'
          OnClick = Sample420ItemClick
        end
        object SamplePlaningItem: TMenuItem
          Caption = 'Beispiel Planing'
          OnClick = Sample420ItemClick
        end
      end
      object HullItem: TMenuItem
        Caption = 'Rumpf laden...'
        Hint = '  Rumpfdaten aus Datei laden'
        OnClick = HullItemClick
      end
      object FaktorDlgItem: TMenuItem
        Caption = 'Rumpf skalieren...'
        Hint = '  Rumpfgr'#246#223'e anpassen'
        OnClick = FaktorDlgItemClick
      end
      object MinusItem5: TMenuItem
        Caption = '-'
      end
      object OpenBackBmpItem: TMenuItem
        Caption = 'Hintergrund laden...'
        Hint = '  Bitmapdatei als Hintergrundbild laden'
        OnClick = OpenBackBmpItemClick
      end
      object CloseBackBmpItem: TMenuItem
        Caption = 'Hintergrund l'#246'schen'
        Hint = '  Hintergrundbitmap l'#246'schen'
        OnClick = CloseBackBmpItemClick
      end
      object MinusItem6: TMenuItem
        Caption = '-'
      end
      object IndicatorItem: TMenuItem
        Caption = 'Indikator'
        Hint = '  Indikator f'#252'r Drehwinkel anzeigen'
        OnClick = IndicatorItemClick
      end
      object IndicatorLocalRotItem: TMenuItem
        Caption = 'Lokale Achsen (Indikator)'
        Hint = '  Indikator um lokale Achsen drehen'
        OnClick = IndicatorLocalRotItemClick
      end
      object MatrixItem: TMenuItem
        Caption = 'Rotationmatrix'
        Hint = '  Rotationsmatrix einblenden'
        OnClick = MatrixItemClick
      end
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'dat'
    Filter = 'Hull Data File (*.dat)|*.dat|alle Dateien (*.*)|*.*'
    Left = 265
    Top = 58
  end
  object OpenPictureDialog: TOpenPictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 297
    Top = 58
  end
end
