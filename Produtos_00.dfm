object Produtos00: TProdutos00
  Left = 294
  Top = 158
  BorderStyle = bsDialog
  Caption = 'Cadastro de Produtos'
  ClientHeight = 245
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 617
    Height = 189
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 601
      Height = 49
      Caption = 'Busca'
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 21
        Width = 49
        Height = 13
        Caption = 'buscar em'
      end
      object BT_Buscar: TBitBtn
        Left = 512
        Top = 16
        Width = 75
        Height = 25
        Caption = '&Buscar'
        TabOrder = 2
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
      object ComboLocalBusca: TComboBox
        Left = 80
        Top = 18
        Width = 217
        Height = 21
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 1
        TabOrder = 0
        Text = 'Descri'#231#227'o'
        OnChange = ComboLocalBuscaChange
        OnKeyPress = ComboLocalBuscaKeyPress
        Items.Strings = (
          'C'#243'digo'
          'Descri'#231#227'o'
          'Grupo'
          'Fornecedor'
          'Unidade'
          'Pre'#231'o'
          'C'#243'digo de Barra'
          'Estoque')
      end
      object EditBusca: TMaskEdit
        Left = 312
        Top = 18
        Width = 182
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        OnChange = EditBuscaChange
        OnKeyPress = EditBuscaKeyPress
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 64
      Width = 601
      Height = 117
      Caption = '  Resultados Obtidos  '
      TabOrder = 1
      object GridProdutos: TDBGrid
        Left = 7
        Top = 14
        Width = 586
        Height = 95
        Ctl3D = True
        DataSource = ConexaoBD.DS_Produtos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = GridProdutosCellClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Produto_Codigo'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Produto_Descricao'
            Title.Alignment = taCenter
            Title.Caption = 'Descri'#231#227'o'
            Width = 224
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Produto_Fornecedor_Desc'
            Title.Alignment = taCenter
            Title.Caption = 'Fornecedor'
            Width = 164
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Produto_Preco_Varejo'
            Title.Alignment = taCenter
            Title.Caption = 'Preco ( R$ )'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Produto_Grupo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Produto_Fornecedor_Cod'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Produto_Fornecedor_Desc'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Produto_Cod_Barra'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Produto_Cod_Alternativo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Produto_Estoque_Atual'
            Title.Caption = 'Estoque'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Produto_Custo'
            Visible = False
          end>
      end
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 200
    Width = 617
    Height = 41
    TabOrder = 1
    object BT_Incluir: TBitBtn
      Left = 264
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Cadastrar Novo Produto|Cadastrar Novo Produto'
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
      Left = 534
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Retornar ao Menu Principal|Retornar ao Menu Principal'
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
    object Edit_Tipo: TEdit
      Left = 8
      Top = 11
      Width = 8
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
  end
end
