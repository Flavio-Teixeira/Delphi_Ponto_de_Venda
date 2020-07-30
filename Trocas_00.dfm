object Trocas00: TTrocas00
  Left = 207
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Controle de Trocas'
  ClientHeight = 334
  ClientWidth = 634
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
  object Panel1: TPanel
    Left = 5
    Top = 285
    Width = 623
    Height = 41
    TabOrder = 1
    object BT_Sair: TBitBtn
      Left = 542
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Retornar ao Menu Principal|Retornar ao Menu Principal'
      Caption = 'Sair'
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
    object BT_Incluir: TBitBtn
      Left = 274
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Cadastrar Novo Usu'#225'rio|Cadastrar Novo Usu'#225'rio'
      Caption = 'Incluir'
      ParentShowHint = False
      ShowHint = True
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
    object BT_Imprimir: TBitBtn
      Left = 406
      Top = 8
      Width = 80
      Height = 25
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
  end
  object Panel2: TPanel
    Left = 5
    Top = 5
    Width = 623
    Height = 273
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 64
      Width = 609
      Height = 201
      Caption = '  Resultados Obtidos  '
      TabOrder = 1
      object GridTrocas: TDBGrid
        Left = 9
        Top = 14
        Width = 592
        Height = 179
        Ctl3D = False
        DataSource = ConexaoBD.DS_Trocas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnCellClick = GridTrocasCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Troca_Numero'
            Title.Caption = 'Nro'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Troca_Codigo'
            Title.Caption = 'C'#243'digo'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Troca_Descricao'
            Title.Caption = 'Descri'#231#227'o'
            Width = 195
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Troca_Qtde'
            Title.Caption = 'Qtde'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Troca_Data'
            Title.Caption = 'Data'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Troca_Observacao'
            Title.Caption = 'Observa'#231#227'o'
            Width = 100
            Visible = True
          end>
      end
    end
    object GroupBox2: TGroupBox
      Left = 9
      Top = 8
      Width = 609
      Height = 49
      Caption = '  Busca  '
      TabOrder = 0
      object Label2: TLabel
        Left = 156
        Top = 23
        Width = 38
        Height = 13
        Caption = 'Per'#237'odo'
      end
      object Label3: TLabel
        Left = 274
        Top = 23
        Width = 16
        Height = 13
        Caption = 'At'#233
      end
      object BT_Buscar: TBitBtn
        Left = 373
        Top = 16
        Width = 81
        Height = 25
        Caption = '&Buscar'
        TabOrder = 0
        OnClick = BT_BuscarClick
        Glyph.Data = {
          EE000000424DEE000000000000007600000028000000100000000F0000000100
          04000000000078000000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888800000888880000080F000888880F00080F000888880F0008000000080000
          000800F000000F00000800F000800F00000800F000800F000008800000000000
          0088880F00080F000888880000080000088888800088800088888880F08880F0
          888888800088800088888888888888888888}
      end
      object Rel_Periodo_Inicial: TMaskEdit
        Left = 198
        Top = 18
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
        Left = 295
        Top = 18
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
    end
  end
end
