object Frente_Loja00: TFrente_Loja00
  Left = 240
  Top = 137
  BorderStyle = bsNone
  Caption = 'Frente de Loja - PdvTex'
  ClientHeight = 524
  ClientWidth = 790
  Color = clBackground
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = Menu_Loja
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_Principal: TPanel
    Left = 4
    Top = 34
    Width = 783
    Height = 486
    Caption = ','
    Enabled = False
    TabOrder = 0
    object Dados_Produto: TGroupBox
      Left = 10
      Top = 6
      Width = 762
      Height = 42
      Caption = '  Dados do Produto  '
      TabOrder = 0
      object lblCod_Barras: TLabel
        Left = 10
        Top = 16
        Width = 134
        Height = 16
        AutoSize = False
        Caption = 'C'#211'DIGO DE BARRAS:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDescricao: TLabel
        Left = 259
        Top = 16
        Width = 74
        Height = 16
        AutoSize = False
        Caption = 'PRODUTO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EditDescricao: TLabel
        Left = 331
        Top = 16
        Width = 422
        Height = 16
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EditCod_Barras: TEdit
        Left = 149
        Top = 13
        Width = 99
        Height = 21
        AutoSize = False
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        MaxLength = 16
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnChange = EditCod_BarrasChange
        OnKeyPress = EditCod_BarrasKeyPress
      end
      object EditPermissao_Acesso: TEdit
        Left = 656
        Top = 6
        Width = 12
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        Text = 'N'
        Visible = False
      end
      object EditNro_Linha: TEdit
        Left = 680
        Top = 6
        Width = 11
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        Text = '0'
        Visible = False
      end
      object EditFoco_Linha: TEdit
        Left = 691
        Top = 6
        Width = 11
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
        Text = '0'
        Visible = False
      end
      object EditNro_Cupom: TEdit
        Left = 702
        Top = 6
        Width = 11
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
        Visible = False
      end
      object EditPermissao_Fechamento: TEdit
        Left = 668
        Top = 6
        Width = 12
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
        Text = 'N'
        Visible = False
      end
      object EditQuantidade: TEdit
        Left = 713
        Top = 6
        Width = 11
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 6
        Text = '1'
        Visible = False
      end
      object Vezes_Teclado: TEdit
        Left = 724
        Top = 6
        Width = 12
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 7
        Text = 'N'
        Visible = False
      end
    end
    object Compra: TPanel
      Left = 11
      Top = 47
      Width = 761
      Height = 426
      TabOrder = 1
      object Titulo_Lista_Compras: TPanel
        Left = 0
        Top = 0
        Width = 761
        Height = 25
        Alignment = taLeftJustify
        BevelInner = bvRaised
        BevelOuter = bvNone
        BevelWidth = 2
        BorderStyle = bsSingle
        Caption = '  Lista de Compras'
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        object Label1: TLabel
          Left = 222
          Top = 5
          Width = 50
          Height = 13
          Caption = 'Posi'#231#227'o:'
        end
        object Porcentagem_Venda_Total: TGauge
          Left = 277
          Top = 3
          Width = 300
          Height = 17
          Progress = 0
        end
      end
      object Lista_Itens: TStringGrid
        Left = 12
        Top = 27
        Width = 736
        Height = 327
        ColCount = 7
        Ctl3D = False
        FixedCols = 0
        RowCount = 2
        FixedRows = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnClick = Lista_ItensClick
      end
      object Panel_Totais: TPanel
        Left = 312
        Top = 367
        Width = 294
        Height = 48
        TabOrder = 2
        object Panel11: TPanel
          Left = 4
          Top = 4
          Width = 285
          Height = 40
          BevelOuter = bvLowered
          TabOrder = 0
          object Label20: TLabel
            Left = 10
            Top = 10
            Width = 146
            Height = 24
            AutoSize = False
            Caption = 'VALOR TOTAL:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object Total_Vlr_Compra: TLabel
            Left = 163
            Top = 4
            Width = 118
            Height = 32
            AutoSize = False
            Caption = '0,00'
            Color = clBtnFace
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -29
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
        end
      end
      object Panel5: TPanel
        Left = 12
        Top = 367
        Width = 238
        Height = 48
        TabOrder = 1
        object Panel6: TPanel
          Left = 4
          Top = 4
          Width = 229
          Height = 40
          BevelOuter = bvLowered
          TabOrder = 0
          object Label27: TLabel
            Left = 10
            Top = 10
            Width = 133
            Height = 22
            Caption = 'QUANTIDADE:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Total_Qtd_Compra: TLabel
            Left = 152
            Top = 4
            Width = 73
            Height = 31
            Alignment = taCenter
            AutoSize = False
            Caption = '0'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -29
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
      object BTN_Emite_Nota: TBitBtn
        Left = 612
        Top = 361
        Width = 144
        Height = 25
        Caption = 'Nota Fiscal'
        TabOrder = 4
        OnClick = BTN_Emite_NotaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
          0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0FEEEEEEE
          F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
          F05557F7F777777757F550F0FF777FFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
          F05557F7F777777757F550F0FF7F777FF05557F7F5FFFFFFF7F550F0FEEEEEEE
          F05557F7F777777757F550F0FF77F7FFF05557F7F5FFFFFFF7F550F0FEEEEEEE
          F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
          005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
          0555557575757575755555505050505055555557575757575555}
        NumGlyphs = 2
      end
      object NFP_Consumidor: TRadioButton
        Left = 612
        Top = 388
        Width = 77
        Height = 17
        Caption = 'Consumidor'
        Checked = True
        TabOrder = 5
        TabStop = True
      end
      object NFP_Produto: TRadioButton
        Left = 697
        Top = 388
        Width = 60
        Height = 17
        Caption = 'Produto'
        TabOrder = 6
      end
      object NFP_Site: TRadioButton
        Left = 697
        Top = 406
        Width = 60
        Height = 17
        Caption = 'Site'
        TabOrder = 7
      end
    end
  end
  object Panel1: TPanel
    Left = 4
    Top = 3
    Width = 783
    Height = 27
    TabOrder = 1
    object Nome_Loja: TLabel
      Left = 463
      Top = 1
      Width = 314
      Height = 25
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label2: TLabel
      Left = 429
      Top = 6
      Width = 35
      Height = 16
      AutoSize = False
      Caption = 'Loja:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 5
      Top = 5
      Width = 81
      Height = 16
      AutoSize = False
      Caption = 'C'#243'd.Cliente:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label4: TLabel
      Left = 4
      Top = 6
      Width = 67
      Height = 16
      AutoSize = False
      Caption = 'Vendedor:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Nome_Vendedor: TLabel
      Left = 72
      Top = 1
      Width = 111
      Height = 25
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object EditCodCliente: TEdit
      Left = 88
      Top = 4
      Width = 104
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 0
      Visible = False
      OnKeyPress = EditCodClienteKeyPress
    end
    object EditNomeCliente: TEdit
      Left = 193
      Top = 4
      Width = 200
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
      Visible = False
    end
    object EditVinculoCliente: TCheckBox
      Left = 408
      Top = 5
      Width = 14
      Height = 17
      TabOrder = 2
      Visible = False
    end
    object EditDesconto: TEdit
      Left = 393
      Top = 4
      Width = 8
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
      Visible = False
    end
  end
  object Menu_Loja: TMainMenu
    Left = 638
    Top = 38
    object mnuLista_Compras: TMenuItem
      Caption = '&Lista de Compras'
      object mnuLista_Multiplicacao: TMenuItem
        Caption = '[ * ]   -  &Multiplica a Quantidade'
        Enabled = False
        OnClick = mnuLista_MultiplicacaoClick
      end
      object mnuLista_Soma: TMenuItem
        Caption = '[ + ]  -  &Soma a Quantidade'
        OnClick = mnuLista_SomaClick
      end
      object mnuLista_Subtracao: TMenuItem
        Caption = '[ - ]   -  S&ubtrai a Quantidade'
        OnClick = mnuLista_SubtracaoClick
      end
      object mnuLista_Apaga: TMenuItem
        Caption = 'Del   -  &Apaga o Item'
        Enabled = False
        OnClick = mnuLista_ApagaClick
      end
    end
    object mnuTeclas_Atalho: TMenuItem
      Caption = '&Teclas de Atalho'
      object mnuTeclas_F01: TMenuItem
        Caption = 'F1   -  Abertura de &Caixa'
        OnClick = mnuTeclas_F01Click
      end
      object mnuTeclas_F02: TMenuItem
        Caption = 'F2   -  &Fechamento de Caixa'
        OnClick = mnuTeclas_F02Click
      end
      object mnuTeclas_F03: TMenuItem
        Caption = 'F3   -  Apaga &Item'
        OnClick = mnuTeclas_F03Click
      end
      object mnuTeclas_F04: TMenuItem
        Caption = 'F4   -  &Sangria  / Retirada no Caixa'
        OnClick = mnuTeclas_F04Click
      end
      object mnuTeclas_F05: TMenuItem
        Caption = 'F5   -  Cancela o Cupom &Atual'
        OnClick = mnuTeclas_F05Click
      end
      object mnuTeclas_F06: TMenuItem
        Caption = 'F6   -  Cancela o Cupom &Impresso'
        OnClick = mnuTeclas_F06Click
      end
      object mnuTeclas_F07: TMenuItem
        Caption = 'F7   -  &Buscar Produto'
        OnClick = mnuTeclas_F07Click
      end
      object mnuTeclas_F09: TMenuItem
        Caption = 'F9   -  Abrir &Gaveta'
        OnClick = mnuTeclas_F09Click
      end
      object mnuTeclas_F10: TMenuItem
        Caption = 'F10 -  F&echa o Cupom'
        OnClick = mnuTeclas_F10Click
      end
      object mnuTeclas_F11: TMenuItem
        Caption = 'F11 -  Excluir/Alterar uma Retirada/Sangria'
        OnClick = mnuTeclas_F11Click
      end
    end
    object mnuSair: TMenuItem
      Caption = '&Sair'
      OnClick = mnuSairClick
    end
  end
end
