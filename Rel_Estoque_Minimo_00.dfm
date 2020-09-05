object RelEstoqueMinimo00: TRelEstoqueMinimo00
  Left = 276
  Top = 153
  BorderStyle = bsDialog
  Caption = 'Relat'#243'rio de Estoque M'#237'nimo'
  ClientHeight = 373
  ClientWidth = 787
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pan_Botoes: TPanel
    Left = 5
    Top = 327
    Width = 775
    Height = 41
    TabOrder = 1
    object BT_Sair: TBitBtn
      Left = 688
      Top = 8
      Width = 80
      Height = 25
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
      Left = 7
      Top = 8
      Width = 80
      Height = 25
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
    object BT_Planilha: TBitBtn
      Left = 308
      Top = 8
      Width = 159
      Height = 25
      Caption = 'Gerar Planilha de Pedido'
      TabOrder = 2
      OnClick = BT_PlanilhaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
        C8807FF7777777777FF700000000000000007777777777777777333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 5
    Width = 774
    Height = 319
    TabOrder = 0
    object LBL_Rel_Titulo: TLabel
      Left = 8
      Top = 11
      Width = 252
      Height = 13
      AutoSize = False
      Caption = 'Rela'#231#227'o de Produtos em Estado de Estoque M'#237'nimo'
    end
    object Label1: TLabel
      Left = 284
      Top = 11
      Width = 83
      Height = 13
      Caption = 'Busca por Grupo:'
    end
    object Label2: TLabel
      Left = 532
      Top = 11
      Width = 86
      Height = 13
      Caption = 'Ou     Fornecedor:'
    end
    object GridProdutos: TDBGrid
      Left = 5
      Top = 36
      Width = 764
      Height = 278
      Ctl3D = True
      DataSource = ConexaoBD.DS_Estoque_Minimo
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
      OnDrawColumnCell = GridProdutosDrawColumnCell
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
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Produto_Descricao'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 186
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Produto_Custo'
          Title.Caption = 'Vlr.'#218'ltima Compra R$'
          Width = 125
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Produto_Estoque_Atual'
          Title.Caption = 'Estoque Atual'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Produto_Estoque_Minimo'
          Title.Caption = 'Estoque M'#237'nimo'
          Width = 100
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Produto_Ultima_Venda'
          Title.Alignment = taCenter
          Title.Caption = #218'ltima Venda'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Produto_Pedido_Qtde_Perdas'
          Title.Caption = 'Perdas'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Produto_Margem_Lucro'
          Title.Caption = 'Lucro(%)'
          Width = 55
          Visible = True
        end>
    end
    object CBGrupo: TComboBox
      Left = 370
      Top = 8
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
      OnChange = CBGrupoChange
    end
    object CBFornecedor: TComboBox
      Left = 622
      Top = 8
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
      TabOrder = 2
      OnChange = CBFornecedorChange
    end
  end
end
