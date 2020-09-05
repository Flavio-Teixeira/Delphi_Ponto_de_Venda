object EntradaProdutosNF00: TEntradaProdutosNF00
  Left = 192
  Top = 103
  BorderStyle = bsDialog
  Caption = 'Entrada de Produtos por Nota Fiscal'
  ClientHeight = 409
  ClientWidth = 712
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
    Width = 697
    Height = 58
    Caption = '  Dados Principais  '
    TabOrder = 0
    object Label5: TLabel
      Left = 6
      Top = 19
      Width = 54
      Height = 13
      Caption = 'Fornecedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 300
      Top = 19
      Width = 76
      Height = 13
      Caption = 'Nro. Nota Fiscal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 393
      Top = 19
      Width = 56
      Height = 13
      Caption = 'Dt. Emiss'#227'o'
    end
    object Label6: TLabel
      Left = 471
      Top = 18
      Width = 133
      Height = 13
      Caption = 'Cond. Pagto / Observa'#231#245'es'
    end
    object Cod_Fornecedores: TEdit
      Left = 6
      Top = 34
      Width = 41
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnKeyPress = Cod_FornecedoresKeyPress
    end
    object CBFornecedor: TComboBox
      Left = 54
      Top = 34
      Width = 145
      Height = 19
      BevelInner = bvNone
      BevelKind = bkSoft
      Style = csOwnerDrawFixed
      Ctl3D = False
      DragMode = dmAutomatic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnKeyPress = CBFornecedorKeyPress
    end
    object Numero_Nota: TEdit
      Left = 300
      Top = 34
      Width = 80
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      OnKeyPress = Numero_NotaKeyPress
    end
    object Data_Emissao: TMaskEdit
      Left = 393
      Top = 34
      Width = 65
      Height = 19
      Ctl3D = False
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 4
      Text = '  /  /    '
      OnKeyPress = Data_EmissaoKeyPress
    end
    object Cond_Pagto: TEdit
      Left = 471
      Top = 33
      Width = 219
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 50
      ParentCtl3D = False
      TabOrder = 5
      OnKeyPress = Cond_PagtoKeyPress
    end
    object BitBtn2: TBitBtn
      Left = 206
      Top = 33
      Width = 64
      Height = 21
      Hint = 'Inserir Registro de Produto|Inserir Registro de Produto'
      Caption = 'Incluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn2Click
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
  object GroupBox2: TGroupBox
    Left = 8
    Top = 73
    Width = 697
    Height = 208
    Caption = '  Dados do Produtos  '
    TabOrder = 1
    object Entrada_Produtos: TStringGrid
      Left = 8
      Top = 64
      Width = 682
      Height = 137
      Ctl3D = False
      DefaultRowHeight = 19
      FixedCols = 0
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      ColWidths = (
        64
        64
        64
        64
        64)
    end
    object Panel4: TPanel
      Left = 8
      Top = 19
      Width = 536
      Height = 40
      BevelOuter = bvLowered
      TabOrder = 0
      object Label11: TLabel
        Left = 4
        Top = 2
        Width = 59
        Height = 13
        Caption = 'C'#243'd.Produto'
      end
      object Label12: TLabel
        Left = 261
        Top = 2
        Width = 23
        Height = 13
        Caption = 'Qtde'
      end
      object Label18: TLabel
        Left = 304
        Top = 2
        Width = 51
        Height = 13
        Caption = 'Vlr.Unit'#225'rio'
      end
      object Label21: TLabel
        Left = 375
        Top = 2
        Width = 39
        Height = 13
        Caption = 'Vlr.Total'
      end
      object Label23: TLabel
        Left = 69
        Top = 2
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Produto_Codigo: TEdit
        Left = 4
        Top = 17
        Width = 60
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = Produto_CodigoKeyPress
      end
      object Produto_Qtde: TEdit
        Left = 261
        Top = 17
        Width = 39
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 7
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = Produto_QtdeKeyPress
      end
      object Produto_Vlr_Unitario: TEdit
        Left = 304
        Top = 17
        Width = 67
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 3
        OnExit = Produto_Vlr_UnitarioExit
        OnKeyPress = Produto_Vlr_UnitarioKeyPress
      end
      object Produto_Vlr_Total: TEdit
        Left = 375
        Top = 17
        Width = 67
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Enabled = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 4
        OnKeyPress = Produto_Vlr_TotalKeyPress
      end
      object Produto_Descricao: TEdit
        Left = 69
        Top = 17
        Width = 187
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Enabled = False
        MaxLength = 50
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = Produto_DescricaoKeyPress
      end
      object BT_Adicionar: TBitBtn
        Left = 449
        Top = 8
        Width = 80
        Height = 25
        Caption = 'Adicionar'
        TabOrder = 5
        OnClick = BT_AdicionarClick
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
    object Panel5: TPanel
      Left = 549
      Top = 18
      Width = 140
      Height = 40
      BevelOuter = bvLowered
      TabOrder = 2
      object BT_Localizar: TBitBtn
        Left = 7
        Top = 8
        Width = 125
        Height = 25
        Caption = 'Localizar Produto'
        TabOrder = 0
        WordWrap = True
        OnClick = BT_LocalizarClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888800000888880000080F000888880F00080F000888880F
          0008000000080000000800F000000F00000800F000800F00000800F000800F00
          00088000000000000088880F00080F0008888800000800000888888000888000
          88888880F08880F0888888800088800088888888888888888888}
      end
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 352
    Width = 697
    Height = 49
    TabOrder = 2
    object BT_Sair: TBitBtn
      Left = 614
      Top = 12
      Width = 75
      Height = 25
      Hint = 'Retornar a Tela Anterior|Retornar a Tela Anterior'
      Caption = '&Sair'
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
    object BT_Alterar: TBitBtn
      Left = 247
      Top = 12
      Width = 202
      Height = 25
      Hint = 'Alterar Registro de Produto|Alterar Registro de Produto'
      Caption = '&Adicionar Nota Informada Acima'
      TabOrder = 0
      OnClick = BT_AlterarClick
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
    object Ajusta_Estoque: TCheckBox
      Left = 8
      Top = 16
      Width = 232
      Height = 17
      Caption = 'Ajustar a Qtde do Estoque Automaticamente'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 289
    Width = 697
    Height = 56
    Caption = '  Valores da Nota  '
    TabOrder = 3
    object Label1: TLabel
      Left = 20
      Top = 25
      Width = 82
      Height = 13
      Caption = 'Valor Total do IPI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 508
      Top = 25
      Width = 92
      Height = 13
      Caption = 'Valor Total da Nota'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 261
      Top = 25
      Width = 88
      Height = 13
      Caption = 'Valor de Desconto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Valor_IPI: TEdit
      Left = 108
      Top = 22
      Width = 80
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnKeyPress = Valor_IPIKeyPress
    end
    object Total_Nota: TEdit
      Left = 608
      Top = 22
      Width = 80
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      OnKeyPress = Total_NotaKeyPress
    end
    object Valor_Desconto: TEdit
      Left = 357
      Top = 22
      Width = 80
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnKeyPress = Valor_DescontoKeyPress
    end
  end
end
