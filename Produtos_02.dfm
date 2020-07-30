object Produtos02: TProdutos02
  Left = 200
  Top = 313
  BorderStyle = bsDialog
  Caption = 'Altera'#231#227'o / Exclus'#227'o  de Produtos'
  ClientHeight = 289
  ClientWidth = 918
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 8
    Top = 232
    Width = 904
    Height = 49
    TabOrder = 1
    object BT_Sair: TBitBtn
      Left = 819
      Top = 12
      Width = 75
      Height = 25
      Hint = 'Retornar a Tela Anterior|Retornar a Tela Anterior'
      Caption = '&Sair'
      TabOrder = 2
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
      Left = 631
      Top = 12
      Width = 75
      Height = 25
      Hint = 'Alterar Registro de Produto|Alterar Registro de Produto'
      Caption = '&Alterar'
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
    object BT_Excluir: TBitBtn
      Left = 711
      Top = 12
      Width = 75
      Height = 25
      Hint = 'Excluir Registro de Produto|Excluir Registro de Produto'
      Caption = '&Excluir'
      TabOrder = 1
      OnClick = BT_ExcluirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 2
      Width = 297
      Height = 40
      TabOrder = 3
      object BT_Inicio: TBitBtn
        Left = 5
        Top = 10
        Width = 70
        Height = 25
        Hint = 'Primeiro Registro'
        Caption = 'In'#237'cio'
        TabOrder = 0
        OnClick = BT_InicioClick
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
      end
      object BT_Anterior: TBitBtn
        Left = 77
        Top = 10
        Width = 70
        Height = 25
        Hint = 'Registro Anterior'
        Caption = 'Anterior'
        TabOrder = 1
        OnClick = BT_AnteriorClick
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
      end
      object BT_Proximo: TBitBtn
        Left = 149
        Top = 10
        Width = 70
        Height = 25
        Hint = 'Pr'#243'ximo Registro'
        Caption = 'Pr'#243'ximo'
        TabOrder = 2
        OnClick = BT_ProximoClick
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
      end
      object BT_Final: TBitBtn
        Left = 222
        Top = 10
        Width = 70
        Height = 25
        Hint = #218'ltimo Registro'
        Caption = 'Final'
        TabOrder = 3
        OnClick = BT_FinalClick
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
      end
    end
    object GroupBox5: TGroupBox
      Left = 346
      Top = 2
      Width = 254
      Height = 40
      Caption = ' Impress'#227'o de Etiquetas '
      TabOrder = 4
      object Label17: TLabel
        Left = 71
        Top = 17
        Width = 75
        Height = 13
        Caption = 'Qtde. p/Imprimir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label26: TLabel
        Left = 4
        Top = 18
        Width = 24
        Height = 13
        Caption = 'Peso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object BT_Imprimir: TBitBtn
        Left = 178
        Top = 9
        Width = 70
        Height = 25
        Hint = 
          'Imprimir Servi'#231'os do Dia Especificado|Imprimir Servi'#231'os do Dia E' +
          'specificado'
        Caption = 'Imprimir'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
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
      object EditEtiquetas: TEdit
        Left = 150
        Top = 14
        Width = 24
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 2
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnKeyPress = EditEtiquetasKeyPress
      end
      object EditPeso: TEdit
        Left = 31
        Top = 14
        Width = 35
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 5
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnKeyPress = EditPesoKeyPress
      end
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 904
    Height = 217
    TabOrder = 0
    object Label13: TLabel
      Left = 8
      Top = 18
      Width = 83
      Height = 13
      Caption = 'Busca por c'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 40
      Width = 569
      Height = 169
      Caption = '  Dados Cadastrais  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object Label1: TLabel
        Left = 52
        Top = 14
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 37
        Top = 55
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 31
        Top = 97
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 352
        Top = 44
        Width = 59
        Height = 13
        Caption = 'Descr. Curta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 56
        Top = 76
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblCodigo: TLabel
        Left = 89
        Top = 15
        Width = 145
        Height = 13
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 154
        Top = 118
        Width = 81
        Height = 13
        Caption = 'C'#243'digo de Barras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 45
        Top = 120
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 7
        Top = 138
        Width = 78
        Height = 13
        Alignment = taRightJustify
        Caption = 'Qtde.Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 152
        Top = 138
        Width = 85
        Height = 13
        Caption = 'N.C.M do Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object BT_Incluir_Grupo: TLabel
        Left = 274
        Top = 75
        Width = 58
        Height = 13
        Cursor = crHandPoint
        Caption = '< Incluir >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BT_Incluir_GrupoClick
      end
      object BT_Incluir_Fornecedor: TLabel
        Left = 274
        Top = 96
        Width = 58
        Height = 13
        Cursor = crHandPoint
        Caption = '< Incluir >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BT_Incluir_FornecedorClick
      end
      object Label14: TLabel
        Left = 5
        Top = 153
        Width = 558
        Height = 13
        Caption = 
          'Obs.: O C'#243'digo de Barras s'#243' aceita N'#250'meros, caso precise informa' +
          'r um C'#243'digo com Letras , utilize o C'#243'digo Alternativo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 369
        Top = 15
        Width = 123
        Height = 13
        Caption = 'Qtde.Estoque M'#237'nimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 7
        Top = 34
        Width = 192
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'digo do Produto no Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EditDescricao: TEdit
        Left = 88
        Top = 51
        Width = 249
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 100
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnKeyPress = EditDescricaoKeyPress
      end
      object EditDescricao_Curta: TEdit
        Left = 424
        Top = 41
        Width = 129
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 20
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 11
        OnKeyPress = EditDescricao_CurtaKeyPress
      end
      object CBGrupo: TComboBox
        Left = 126
        Top = 72
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
        TabOrder = 3
        OnKeyPress = CBGrupoKeyPress
      end
      object CBFornecedor: TComboBox
        Left = 126
        Top = 93
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
        TabOrder = 5
        OnKeyPress = CBFornecedorKeyPress
      end
      object GroupBox2: TGroupBox
        Left = 352
        Top = 62
        Width = 201
        Height = 89
        Caption = '  Detalhamento  '
        TabOrder = 12
        object Label8: TLabel
          Left = 13
          Top = 21
          Width = 61
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Custo ( R$ )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 13
          Top = 44
          Width = 61
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Lucro ( % )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 13
          Top = 67
          Width = 61
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Pre'#231'o ( R$ )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object EditCusto: TEdit
          Left = 87
          Top = 17
          Width = 98
          Height = 19
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnExit = EditCustoExit
          OnKeyPress = EditCustoKeyPress
        end
        object EditLucro: TEdit
          Left = 87
          Top = 40
          Width = 98
          Height = 19
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          OnExit = EditLucroExit
          OnKeyPress = EditLucroKeyPress
        end
        object EditPreco: TEdit
          Left = 87
          Top = 63
          Width = 98
          Height = 19
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          OnExit = EditPrecoExit
          OnKeyPress = EditPrecoKeyPress
        end
      end
      object EditCod_Barra: TEdit
        Left = 240
        Top = 114
        Width = 97
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 15
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        OnKeyPress = EditCod_BarraKeyPress
      end
      object EditEstoque: TEdit
        Left = 88
        Top = 135
        Width = 57
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
        OnKeyPress = EditEstoqueKeyPress
      end
      object EditNCM: TEdit
        Left = 240
        Top = 135
        Width = 97
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 8
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 9
        OnKeyPress = EditNCMKeyPress
      end
      object EditGrupo_Ant: TEdit
        Left = 285
        Top = 8
        Width = 9
        Height = 19
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 13
        Visible = False
      end
      object EditFor_Cod_Ant: TEdit
        Left = 293
        Top = 8
        Width = 9
        Height = 19
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 14
        Visible = False
      end
      object EditFor_Desc_Ant: TEdit
        Left = 301
        Top = 8
        Width = 9
        Height = 19
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 15
        Visible = False
      end
      object Edit_Cod_Barra: TEdit
        Left = 309
        Top = 8
        Width = 9
        Height = 19
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 16
        Visible = False
      end
      object Cod_Grupo: TEdit
        Left = 88
        Top = 72
        Width = 35
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
        OnKeyPress = Cod_GrupoKeyPress
      end
      object Cod_Fornecedores: TEdit
        Left = 88
        Top = 93
        Width = 35
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
        TabOrder = 4
        OnKeyPress = Cod_FornecedoresKeyPress
      end
      object EditUnidade: TComboBox
        Left = 88
        Top = 114
        Width = 57
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
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        Text = 'UN'
        OnKeyPress = CBFornecedorKeyPress
        Items.Strings = (
          'UN'
          'PT'
          'CX'
          'FD'
          'MT'
          'RL')
      end
      object EditMinimo: TEdit
        Left = 496
        Top = 12
        Width = 57
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 10
        OnKeyPress = EditMinimoKeyPress
      end
      object CodProdFornecedor: TEdit
        Left = 201
        Top = 31
        Width = 136
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 255
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnKeyPress = CodProdFornecedorKeyPress
      end
    end
    object Edit_Busca: TEdit
      Left = 96
      Top = 15
      Width = 161
      Height = 19
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 100
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnChange = Edit_BuscaChange
      OnKeyPress = Edit_BuscaKeyPress
    end
    object BitBtn3: TBitBtn
      Left = 264
      Top = 11
      Width = 75
      Height = 25
      Caption = '&Localizar'
      TabOrder = 1
      OnClick = BitBtn3Click
      Glyph.Data = {
        36050000424D360500000000000036040000280000000E000000100000000100
        08000000000000010000CA0E0000C30E00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000ACACACACACAC
        ACACACAC0000ACAC0000ACACACACACACACACAC02230500AC0000ACAC00000000
        00000223050500000000ACAC56ACACACAC02230505ACAC000000ACAC56D7D7D7
        02230505ACD7AC000000ACAC56000056AC0505ACD7D7AC000000AC56AC23AC00
        5656ACD7D7D7AC00000056D723AC23AC00ACD7D7D7D7AC0000005623D723AC23
        00ACD7D7D7D7AC00000056D723D723AC00ACD7D7D7D7AC000000AC56D723D700
        ACD7D7D7D7D7AC000000ACAC565600ACD7D7D7D7D7D7AC000000ACAC56D7D7D7
        D7D7D7D700000000FFFFACAC56D7D7D7D7D7D7D7ACD756AC0000ACAC56D7D7D7
        D7D7D7D7AC56ACAC0000ACAC565656565656565656ACACAC0000}
    end
    object BitBtn1: TBitBtn
      Left = 359
      Top = 11
      Width = 217
      Height = 25
      Caption = '&Gerar novo produto com mesmos dados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn1Click
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
    object GroupBox4: TGroupBox
      Left = 584
      Top = 8
      Width = 313
      Height = 201
      Caption = 
        ' Inf.Nutricionais (10g)                Gramas                   ' +
        '        %VD '
      TabOrder = 4
      object Label18: TLabel
        Left = 21
        Top = 19
        Width = 78
        Height = 13
        Caption = 'Valor Energ'#233'tico'
      end
      object Label19: TLabel
        Left = 40
        Top = 42
        Width = 59
        Height = 13
        Caption = 'Carboidratos'
      end
      object Label20: TLabel
        Left = 53
        Top = 65
        Width = 46
        Height = 13
        Caption = 'Prote'#237'nas'
      end
      object Label21: TLabel
        Left = 24
        Top = 88
        Width = 75
        Height = 13
        Caption = 'Gorduras Totais'
      end
      object Label22: TLabel
        Left = 5
        Top = 111
        Width = 94
        Height = 13
        Caption = 'Gorduras Saturadas'
      end
      object Label23: TLabel
        Left = 26
        Top = 133
        Width = 73
        Height = 13
        Caption = 'Gorduras Trans'
      end
      object Label24: TLabel
        Left = 30
        Top = 156
        Width = 69
        Height = 13
        Caption = 'Fibra Alimentar'
      end
      object Label25: TLabel
        Left = 72
        Top = 179
        Width = 27
        Height = 13
        Caption = 'S'#243'dio'
      end
      object EditValorEnergeticoG: TEdit
        Left = 102
        Top = 16
        Width = 100
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 20
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnKeyPress = EditValorEnergeticoGKeyPress
      end
      object EditValorEnergeticoP: TEdit
        Left = 206
        Top = 16
        Width = 100
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 20
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnKeyPress = EditValorEnergeticoPKeyPress
      end
      object EditCarboidratosG: TEdit
        Left = 102
        Top = 39
        Width = 100
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 20
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnKeyPress = EditCarboidratosGKeyPress
      end
      object EditCarboidratosP: TEdit
        Left = 206
        Top = 39
        Width = 100
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 20
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnKeyPress = EditCarboidratosPKeyPress
      end
      object EditProteinasG: TEdit
        Left = 102
        Top = 62
        Width = 100
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 20
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnKeyPress = EditProteinasGKeyPress
      end
      object EditProteinasP: TEdit
        Left = 206
        Top = 62
        Width = 100
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 20
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        OnKeyPress = EditProteinasPKeyPress
      end
      object EditGordurasTotaisG: TEdit
        Left = 102
        Top = 85
        Width = 100
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 20
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        OnKeyPress = EditGordurasTotaisGKeyPress
      end
      object EditGordurasTotaisP: TEdit
        Left = 206
        Top = 85
        Width = 100
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 20
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        OnKeyPress = EditGordurasTotaisPKeyPress
      end
      object EditGordurasSaturadasG: TEdit
        Left = 102
        Top = 108
        Width = 100
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 20
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
        OnKeyPress = EditGordurasSaturadasGKeyPress
      end
      object EditGordurasSaturadasP: TEdit
        Left = 206
        Top = 108
        Width = 100
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 20
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 9
        OnKeyPress = EditGordurasSaturadasPKeyPress
      end
      object EditGordurasTransG: TEdit
        Left = 102
        Top = 130
        Width = 100
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 20
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 10
        OnKeyPress = EditGordurasTransGKeyPress
      end
      object EditGordurasTransP: TEdit
        Left = 206
        Top = 130
        Width = 100
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 20
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 11
        OnKeyPress = EditGordurasTransPKeyPress
      end
      object EditFibrasG: TEdit
        Left = 102
        Top = 153
        Width = 100
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 20
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 12
        OnKeyPress = EditFibrasGKeyPress
      end
      object EditFibrasP: TEdit
        Left = 206
        Top = 153
        Width = 100
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 20
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 13
        OnKeyPress = EditFibrasPKeyPress
      end
      object EditSodioG: TEdit
        Left = 102
        Top = 176
        Width = 100
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 20
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 14
        OnKeyPress = EditSodioGKeyPress
      end
      object EditSodioP: TEdit
        Left = 206
        Top = 176
        Width = 100
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 20
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 15
        OnKeyPress = EditSodioPKeyPress
      end
    end
  end
end
