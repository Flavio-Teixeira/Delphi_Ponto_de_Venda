object RelLucratividadeD00: TRelLucratividadeD00
  Left = 281
  Top = 165
  BorderStyle = bsDialog
  Caption = 'Lucratividade Distribuidora'
  ClientHeight = 432
  ClientWidth = 263
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
    Height = 321
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    object Label2: TLabel
      Left = 22
      Top = 60
      Width = 38
      Height = 13
      Caption = 'Per'#237'odo'
    end
    object Label3: TLabel
      Left = 139
      Top = 60
      Width = 16
      Height = 13
      Caption = 'At'#233
    end
    object Label1: TLabel
      Left = 24
      Top = 10
      Width = 41
      Height = 13
      Caption = 'M'#225'quina'
    end
    object Label4: TLabel
      Left = 24
      Top = 215
      Width = 59
      Height = 13
      Caption = 'Ordenar por:'
    end
    object Rel_Periodo_Inicial: TMaskEdit
      Left = 64
      Top = 56
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
      Top = 56
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
      Top = 24
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
    object CB_Ordenar: TComboBox
      Left = 24
      Top = 229
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
      ItemIndex = 0
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      Text = 'Lucro Bruto'
      OnKeyPress = CB_OrdenarKeyPress
      Items.Strings = (
        'Lucro Bruto'
        'C'#243'digo'
        'Produto'
        'Qtde. Vendida'
        'Pre'#231'o M'#233'dio Venda'
        'Total Faturado'
        #218'ltimo Custo'
        'Custo Total'
        'Margem Lucro')
    end
    object GroupBox2: TGroupBox
      Left = 21
      Top = 80
      Width = 211
      Height = 122
      Caption = '  Quebrar por   '
      TabOrder = 3
      object Label5: TLabel
        Left = 28
        Top = 96
        Width = 59
        Height = 13
        Caption = 'C'#243'd.Produto'
      end
      object Label6: TLabel
        Left = 98
        Top = 77
        Width = 14
        Height = 13
        Caption = 'Ou'
      end
      object Label7: TLabel
        Left = 98
        Top = 37
        Width = 14
        Height = 13
        Caption = 'Ou'
      end
      object Label8: TLabel
        Left = 8
        Top = 56
        Width = 32
        Height = 13
        Caption = 'Grupo:'
      end
      object Opcao_Sem_Grupo: TRadioButton
        Left = 14
        Top = 19
        Width = 78
        Height = 17
        Caption = 'Sem Grupo'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnKeyPress = Opcao_Sem_GrupoKeyPress
      end
      object Opcao_Grupo: TRadioButton
        Left = 135
        Top = 19
        Width = 56
        Height = 17
        Caption = 'Grupo'
        TabOrder = 1
        OnKeyPress = Opcao_GrupoKeyPress
      end
      object Cod_Produto: TEdit
        Left = 91
        Top = 93
        Width = 92
        Height = 19
        Ctl3D = False
        MaxLength = 14
        ParentCtl3D = False
        TabOrder = 2
      end
      object cb_grupos: TComboBox
        Left = 48
        Top = 52
        Width = 155
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
        TabOrder = 3
        OnKeyPress = CB_OrdenarKeyPress
      end
    end
    object GroupBox3: TGroupBox
      Left = 21
      Top = 254
      Width = 211
      Height = 56
      Caption = '  Dados de Leitura   '
      TabOrder = 5
      object LBL_Registro: TLabel
        Left = 8
        Top = 20
        Width = 196
        Height = 13
        AutoSize = False
      end
      object lblNotas: TLabel
        Left = 6
        Top = 37
        Width = 40
        Height = 13
        Caption = 'Notas: 0'
      end
      object lblProgramadas: TLabel
        Left = 100
        Top = 37
        Width = 74
        Height = 13
        Caption = 'Programadas: 0'
      end
    end
  end
  object pan_Botoes: TPanel
    Left = 7
    Top = 383
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
      Caption = 'Visualizar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BT_ImprimirClick
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000DDDDDDDDDDDDDDDDDD000000DD00
        0DDDD000DDDDDD000000D07E70DD07E70DDDDD000000D0E7E0DD0E7E0DDDDD00
        0000D0FE70DD0FE70DDDDD000000D0EFE0DD0EFE0DDDDD000000D8000D00D000
        8DDDDD000000DD0DDDDDDDDD0DDD0D000000DDD0DDD0DDDDD0DD0D000000DDDD
        0DD0DDDDDD0D0D000000DDDDD0D0DDDDDDD0DD000000DDDDDD0DDDDDDDDDDD00
        0000DDDDDDDDDDDDDDDDDD000000DDDDDDDDDDDDDDDDDD000000DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
    end
  end
  object Panel1: TPanel
    Left = 7
    Top = 336
    Width = 250
    Height = 41
    TabOrder = 2
    object BT_Atualizar: TBitBtn
      Left = 10
      Top = 8
      Width = 231
      Height = 25
      Hint = 
        'Imprimir Servi'#231'os do Dia Especificado|Imprimir Servi'#231'os do Dia E' +
        'specificado'
      Caption = 'Atualizar Pre'#231'o de Custo dos Produtos'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BT_AtualizarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF33339993707399933333773337F3777FF3399933000339
        9933377333777F3377F3399333707333993337733337333337FF993333333333
        399377F33333F333377F993333303333399377F33337FF333373993333707333
        333377F333777F333333993333101333333377F333777F3FFFFF993333000399
        999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
        99933773FF777F3F777F339993707399999333773F373F77777F333999999999
        3393333777333777337333333999993333333333377777333333}
      NumGlyphs = 2
    end
  end
end
