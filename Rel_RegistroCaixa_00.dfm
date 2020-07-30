object Rel_RegistroCaixa00: TRel_RegistroCaixa00
  Left = 316
  Top = 157
  BorderStyle = bsDialog
  Caption = 'Relat'#243'rio de Caixa'
  ClientHeight = 177
  ClientWidth = 266
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 249
    Height = 113
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    object Label2: TLabel
      Left = 22
      Top = 68
      Width = 38
      Height = 13
      Caption = 'Per'#237'odo'
    end
    object Label3: TLabel
      Left = 139
      Top = 68
      Width = 16
      Height = 13
      Caption = 'At'#233
    end
    object Label1: TLabel
      Left = 24
      Top = 18
      Width = 41
      Height = 13
      Caption = 'M'#225'quina'
    end
    object LBL_Registro: TLabel
      Left = 8
      Top = 92
      Width = 235
      Height = 13
      AutoSize = False
    end
    object Rel_Periodo_Inicial: TMaskEdit
      Left = 64
      Top = 64
      Width = 71
      Height = 21
      Ctl3D = False
      EditMask = '!99/99/0000;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 10
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      Text = '  /  /    '
      OnKeyPress = Rel_Periodo_InicialKeyPress
    end
    object Rel_Periodo_Final: TMaskEdit
      Left = 161
      Top = 64
      Width = 71
      Height = 21
      Ctl3D = False
      EditMask = '!99/99/0000;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 10
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      Text = '  /  /    '
      OnKeyPress = Rel_Periodo_FinalKeyPress
    end
    object Maquinas: TComboBox
      Left = 24
      Top = 32
      Width = 208
      Height = 22
      BevelKind = bkFlat
      Style = csOwnerDrawVariable
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnKeyPress = MaquinasKeyPress
    end
  end
  object pan_Botoes: TPanel
    Left = 7
    Top = 129
    Width = 250
    Height = 41
    TabOrder = 1
    object BT_Sair: TBitBtn
      Left = 161
      Top = 8
      Width = 80
      Height = 25
      Hint = 'Retorna ao Menu Principal|Retorna ao Menu Principal'
      Caption = '&Sair'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BT_SairClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F3333333F7F333301111111B10333337F333333737F33330111111111
        0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
        0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
        0333337F377777337F333301111111110333337F333333337F33330111111111
        0333337FFFFFFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
    end
    object BT_Imprimir: TBitBtn
      Left = 10
      Top = 8
      Width = 80
      Height = 25
      Hint = 
        'Imprimir Servi'#231'os do Dia Especificado|Imprimir Servi'#231'os do Dia E' +
        'specificado'
      Caption = 'Imprimir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BT_ImprimirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
end
