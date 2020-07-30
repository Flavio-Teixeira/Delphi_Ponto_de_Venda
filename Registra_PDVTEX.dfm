object RegistraPDVTEX: TRegistraPDVTEX
  Left = 277
  Top = 154
  BorderStyle = bsDialog
  Caption = 'Registra o PDVTEX'
  ClientHeight = 139
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 2
    Top = 2
    Width = 384
    Height = 135
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 11
      Width = 117
      Height = 13
      Caption = 'N'#250'mero de Registro:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 6
      Top = 40
      Width = 371
      Height = 41
      BevelOuter = bvLowered
      TabOrder = 0
      object Label9: TLabel
        Left = 37
        Top = 14
        Width = 50
        Height = 13
        Caption = 'Licen'#231'a:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Licenca_1: TEdit
        Left = 91
        Top = 11
        Width = 271
        Height = 19
        Ctl3D = False
        MaxLength = 100
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = Licenca_1KeyPress
      end
    end
    object BT_Registrar: TBitBtn
      Left = 152
      Top = 95
      Width = 81
      Height = 25
      Caption = 'Registrar'
      TabOrder = 1
      OnClick = BT_RegistrarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
    end
    object Registro: TEdit
      Left = 131
      Top = 8
      Width = 206
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 30
      ParentCtl3D = False
      TabOrder = 2
    end
  end
end
