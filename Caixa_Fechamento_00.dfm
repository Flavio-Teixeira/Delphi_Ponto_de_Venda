object Caixa_Fechamento00: TCaixa_Fechamento00
  Left = 277
  Top = 101
  BorderStyle = bsDialog
  Caption = 'Fechamento do Caixa'
  ClientHeight = 397
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_Botoes: TPanel
    Left = 5
    Top = 351
    Width = 332
    Height = 41
    TabOrder = 1
    object BT_Fechar: TBitBtn
      Left = 125
      Top = 8
      Width = 83
      Height = 25
      Caption = '&Fechar'
      TabOrder = 0
      OnClick = BT_FecharClick
      OnKeyPress = BT_FecharKeyPress
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
  end
  object Panel_Valores: TPanel
    Left = 5
    Top = 136
    Width = 332
    Height = 209
    Enabled = False
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 170
      Width = 137
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vlr. Total no caixa   R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 15
      Top = 65
      Width = 137
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vlr. Vendas    R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 15
      Top = 21
      Width = 137
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vlr. de Abertura    R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 15
      Top = 109
      Width = 137
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Vlr. Sangria    R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object EditVlr_Total: TEdit
      Left = 160
      Top = 160
      Width = 161
      Height = 37
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      Ctl3D = False
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnKeyPress = EditVlr_TotalKeyPress
    end
    object EditVlr_Faturado: TEdit
      Left = 160
      Top = 54
      Width = 161
      Height = 37
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      Ctl3D = False
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnKeyPress = EditVlr_FaturadoKeyPress
    end
    object EditAbertura: TEdit
      Left = 160
      Top = 11
      Width = 161
      Height = 37
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      Ctl3D = False
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      OnKeyPress = EditVlr_TotalKeyPress
    end
    object EditSangria: TEdit
      Left = 160
      Top = 98
      Width = 161
      Height = 37
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      Ctl3D = False
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      OnKeyPress = EditVlr_FaturadoKeyPress
    end
  end
  object GroupBox1: TGroupBox
    Left = 7
    Top = 8
    Width = 329
    Height = 121
    Caption = '  '#218'ltimo Cupom  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label3: TLabel
      Left = 24
      Top = 16
      Width = 66
      Height = 13
      AutoSize = False
      Caption = 'Nro. Cupom'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 138
      Top = 16
      Width = 100
      Height = 13
      AutoSize = False
      Caption = 'Vlr. Total Cupom'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblNro_Cupom: TLabel
      Left = 25
      Top = 30
      Width = 89
      Height = 27
      AutoSize = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lblVlr_Cupom: TLabel
      Left = 139
      Top = 30
      Width = 166
      Height = 27
      AutoSize = False
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label7: TLabel
      Left = 15
      Top = 83
      Width = 137
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Qtde de Cupons Di'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object EditCupom: TEdit
      Left = 160
      Top = 72
      Width = 161
      Height = 37
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      Ctl3D = False
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnKeyPress = EditVlr_TotalKeyPress
    end
  end
  object Valida_Gaveta: TTimer
    Enabled = False
    Interval = 1250
    OnTimer = Valida_GavetaTimer
    Left = 10
    Top = 357
  end
  object IdSMTP: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 587
    AuthenticationType = atLogin
    Left = 270
    Top = 358
  end
  object IdMessage: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 303
    Top = 358
  end
end
