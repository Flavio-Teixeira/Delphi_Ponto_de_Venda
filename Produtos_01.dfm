object Produtos01: TProdutos01
  Left = 289
  Top = 358
  BorderStyle = bsDialog
  Caption = 'Inclus'#227'o de Produtos'
  ClientHeight = 283
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
    Left = 7
    Top = 232
    Width = 904
    Height = 41
    TabOrder = 1
    object BT_Incluir: TBitBtn
      Left = 414
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Inserir Registro de Produto|Inserir Registro de Produto'
      Caption = '&Incluir'
      TabOrder = 0
      OnClick = BT_IncluirClick
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
    object BT_Sair: TBitBtn
      Left = 822
      Top = 8
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
  end
  object Panel1: TPanel
    Left = 7
    Top = 8
    Width = 904
    Height = 217
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 6
      Width = 569
      Height = 201
      Caption = '  Dados Cadastrais  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 37
        Top = 20
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
        Top = 87
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
        Top = 32
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
        Top = 65
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
      object Label11: TLabel
        Left = 154
        Top = 108
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
        Top = 108
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
        Top = 130
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
      object Label1: TLabel
        Left = 152
        Top = 130
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
      object Label12: TLabel
        Left = 5
        Top = 183
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
        Top = 11
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
      object Label13: TLabel
        Left = 7
        Top = 42
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
        Top = 17
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
        TabOrder = 0
        OnKeyPress = EditDescricaoKeyPress
      end
      object EditDescricao_Curta: TEdit
        Left = 424
        Top = 29
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
      object GroupBox2: TGroupBox
        Left = 352
        Top = 55
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
        Top = 105
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
        TabOrder = 8
        OnKeyPress = EditCod_BarraKeyPress
      end
      object EditEstoque: TEdit
        Left = 88
        Top = 127
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
        TabOrder = 7
        OnKeyPress = EditEstoqueKeyPress
      end
      object CBGrupo: TComboBox
        Left = 125
        Top = 61
        Width = 145
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
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
        Left = 125
        Top = 83
        Width = 145
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
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
      object EditNCM: TEdit
        Left = 240
        Top = 127
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
      object BitBtn1: TBitBtn
        Left = 273
        Top = 60
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
        TabOrder = 13
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
      object BitBtn2: TBitBtn
        Left = 273
        Top = 83
        Width = 64
        Height = 20
        Hint = 'Inserir Registro de Produto|Inserir Registro de Produto'
        Caption = 'Incluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
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
      object Cod_Grupo: TEdit
        Left = 88
        Top = 61
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
        Top = 83
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
        Top = 105
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
        Top = 8
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
        Top = 39
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
        TabOrder = 1
        OnKeyPress = CodProdFornecedorKeyPress
      end
    end
    object GroupBox4: TGroupBox
      Left = 584
      Top = 6
      Width = 313
      Height = 201
      Caption = 
        ' Inf.Nutricionais (10g)                Gramas                   ' +
        '        %VD '
      TabOrder = 1
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
