object Rel_ComprasClientes00: TRel_ComprasClientes00
  Left = 282
  Top = 141
  BorderStyle = bsDialog
  Caption = 'Relat'#243'rio de Compras dos Clientes'
  ClientHeight = 561
  ClientWidth = 790
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
    Width = 773
    Height = 64
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    object Label2: TLabel
      Left = 284
      Top = 18
      Width = 38
      Height = 13
      Caption = 'Per'#237'odo'
    end
    object Label3: TLabel
      Left = 401
      Top = 18
      Width = 16
      Height = 13
      Caption = 'At'#233
    end
    object Label1: TLabel
      Left = 8
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
    object Label5: TLabel
      Left = 520
      Top = 18
      Width = 23
      Height = 13
      Caption = 'Hora'
    end
    object Label9: TLabel
      Left = 593
      Top = 18
      Width = 16
      Height = 13
      Caption = 'At'#233
    end
    object Label10: TLabel
      Left = 8
      Top = 42
      Width = 109
      Height = 13
      Caption = 'Formas de Pagamento:'
    end
    object Rel_Periodo_Inicial: TMaskEdit
      Left = 326
      Top = 14
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
      Left = 423
      Top = 14
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
      Left = 54
      Top = 14
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
    object BT_Procurar: TBitBtn
      Left = 675
      Top = 12
      Width = 75
      Height = 25
      Caption = '&Procurar'
      TabOrder = 5
      OnClick = BT_ProcurarClick
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
    object Rel_Hora_Inicial: TMaskEdit
      Left = 548
      Top = 14
      Width = 40
      Height = 21
      Ctl3D = False
      EditMask = '!90:00;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 5
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      Text = '  :  '
      OnKeyPress = Rel_Periodo_InicialKeyPress
    end
    object Rel_Hora_Final: TMaskEdit
      Left = 615
      Top = 14
      Width = 40
      Height = 21
      Ctl3D = False
      EditMask = '!90:00;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 5
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      Text = '  :  '
      OnKeyPress = Rel_Periodo_FinalKeyPress
    end
    object pgtoTodos: TRadioButton
      Left = 128
      Top = 42
      Width = 53
      Height = 17
      Caption = 'Todas'
      Checked = True
      TabOrder = 6
      TabStop = True
    end
    object pgtoDinheiro: TRadioButton
      Left = 196
      Top = 42
      Width = 65
      Height = 17
      Caption = 'Dinheiro'
      TabOrder = 7
    end
    object pgtoDebito: TRadioButton
      Left = 280
      Top = 42
      Width = 53
      Height = 17
      Caption = 'D'#233'bito'
      TabOrder = 8
    end
    object pgtoCredito: TRadioButton
      Left = 353
      Top = 42
      Width = 59
      Height = 17
      Caption = 'Cr'#233'dito'
      TabOrder = 9
    end
    object pgtoOutros: TRadioButton
      Left = 428
      Top = 42
      Width = 65
      Height = 17
      Caption = 'Outras'
      TabOrder = 10
    end
  end
  object pan_Botoes: TPanel
    Left = 7
    Top = 515
    Width = 776
    Height = 41
    TabOrder = 1
    object Label6: TLabel
      Left = 6
      Top = 4
      Width = 333
      Height = 13
      Caption = 'ATEN'#199#195'O: S'#243' ser'#227'o impressos os Pedidos com Status "Aguardando".'
    end
    object Label7: TLabel
      Left = 6
      Top = 20
      Width = 351
      Height = 13
      Caption = 
        'Para imprimir um pedido espec'#237'fico, clique duas vezes em cima do' +
        ' mesmo.'
    end
    object BT_Sair: TBitBtn
      Left = 718
      Top = 8
      Width = 50
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
      Left = 361
      Top = 8
      Width = 70
      Height = 25
      Hint = 
        'Imprimir Servi'#231'os do Dia Especificado|Imprimir Servi'#231'os do Dia E' +
        'specificado'
      Caption = 'Imprimir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Visible = False
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
    object BT_Produtos: TBitBtn
      Left = 435
      Top = 8
      Width = 120
      Height = 25
      Hint = 
        'Imprimir Servi'#231'os do Dia Especificado|Imprimir Servi'#231'os do Dia E' +
        'specificado'
      Caption = 'Produtos Vendidos'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BT_ProdutosClick
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
    object BT_Margem: TBitBtn
      Left = 560
      Top = 8
      Width = 130
      Height = 25
      Hint = 
        'Imprimir Servi'#231'os do Dia Especificado|Imprimir Servi'#231'os do Dia E' +
        'specificado'
      Caption = 'Margem Contribui'#231#227'o'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BT_MargemClick
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
    Left = 8
    Top = 74
    Width = 772
    Height = 395
    TabOrder = 2
    object DBGrid_Pedidos: TDBGrid
      Left = 8
      Top = 8
      Width = 755
      Height = 377
      Ctl3D = False
      DataSource = ConexaoBD.DS_Compras_Clientes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid_PedidosDrawColumnCell
      OnDblClick = DBGrid_PedidosDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Cabeca_Cupom_Numero'
          Title.Caption = 'Pedido'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cabeca_Cupom_Data_Emissao'
          Title.Caption = 'Data'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cabeca_Cupom_Hora_Emissao'
          Title.Caption = 'Hora'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cabeca_Cupom_Cliente_Codigo'
          Title.Caption = 'C'#243'd.Cliente'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cabeca_Cupom_Cliente_Razao_Social'
          Title.Caption = 'Cliente Raz'#227'o Social'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 206
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cabeca_Cupom_Vlr_Total'
          Title.Caption = 'Vlr.Pedido (R$)'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cabeca_Cupom_Forma_Pgto'
          Title.Caption = 'Pgto'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 31
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cabeca_Cupom_Cliente_Status'
          Title.Caption = 'Status Pedido'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 87
          Visible = True
        end>
    end
  end
  object Panel4: TPanel
    Left = 7
    Top = 476
    Width = 776
    Height = 31
    TabOrder = 3
    object Panel5: TPanel
      Left = 4
      Top = 4
      Width = 768
      Height = 23
      BevelOuter = bvLowered
      TabOrder = 0
      object Label4: TLabel
        Left = 6
        Top = 5
        Width = 173
        Height = 13
        Caption = 'Quantidade de Pedidos Localizados:'
      end
      object Total_Pedidos: TLabel
        Left = 184
        Top = 5
        Width = 8
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 278
        Top = 5
        Width = 44
        Height = 13
        Caption = 'Valor R$:'
      end
      object Valor_Pedidos: TLabel
        Left = 328
        Top = 5
        Width = 8
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
end
