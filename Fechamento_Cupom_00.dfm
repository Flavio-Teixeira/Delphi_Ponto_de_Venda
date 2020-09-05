object Fechamento_Cupom00: TFechamento_Cupom00
  Left = 485
  Top = 188
  BorderStyle = bsDialog
  Caption = 'Fechamento do Cupom'
  ClientHeight = 325
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_Opcoes: TPanel
    Left = -1
    Top = -1
    Width = 522
    Height = 325
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    object GroupBox3: TGroupBox
      Left = 8
      Top = 28
      Width = 505
      Height = 258
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Pan_Vlr_Total: TPanel
        Left = 24
        Top = 31
        Width = 455
        Height = 45
        BevelInner = bvRaised
        BevelOuter = bvNone
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object lbl_Vlr_Total: TLabel
          Left = 10
          Top = 12
          Width = 199
          Height = 20
          Align = alCustom
          AutoSize = False
          Caption = 'VALOR TOTAL   R$'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Final_Vlr_Total: TEdit
          Left = 229
          Top = 5
          Width = 220
          Height = 36
          AutoSize = False
          Ctl3D = False
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          Text = '0,00'
          OnKeyPress = Final_Vlr_TotalKeyPress
        end
      end
      object Pan_Vlr_Pago: TPanel
        Left = 24
        Top = 76
        Width = 455
        Height = 45
        BevelInner = bvRaised
        BevelOuter = bvNone
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 1
        object lbl_Vlr_Pago: TLabel
          Left = 10
          Top = 12
          Width = 199
          Height = 20
          Align = alCustom
          AutoSize = False
          Caption = 'VALOR PAGO     R$'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Final_Vlr_Pago: TEdit
          Left = 229
          Top = 5
          Width = 220
          Height = 36
          AutoSize = False
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          Text = '0,00'
          OnKeyPress = Final_Vlr_PagoKeyPress
        end
      end
      object Pan_Forma_Pgto: TPanel
        Left = 24
        Top = 121
        Width = 455
        Height = 31
        BevelInner = bvRaised
        BevelOuter = bvNone
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 2
        object Forma_Pgto: TComboBox
          Left = 229
          Top = 4
          Width = 220
          Height = 22
          BevelKind = bkFlat
          Style = csOwnerDrawVariable
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          ItemHeight = 16
          ItemIndex = 0
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          Text = 'D - Dinheiro'
          OnKeyPress = Forma_PgtoKeyPress
          Items.Strings = (
            'D - Dinheiro'
            'C - Cart'#227'o D'#233'bito'
            'R - Cart'#227'o Cr'#233'dito'
            'H - Cheque'
            'P - Parcelado'
            'V - A Vista'
            'A - Adiantado'
            'T - Ticket'
            'B - Boleto'
            'E - Dep'#243'sito Banc'#225'rio'
            'F - Fiado')
        end
      end
      object Pan_Vlr_Troco: TPanel
        Left = 24
        Top = 152
        Width = 455
        Height = 72
        BevelInner = bvRaised
        BevelOuter = bvNone
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 3
        object lbl_Vlr_Troco: TLabel
          Left = 10
          Top = 16
          Width = 215
          Height = 41
          Align = alCustom
          AutoSize = False
          Caption = 'TROCO  R$'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -37
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Final_Vlr_Troco: TEdit
          Left = 229
          Top = 5
          Width = 220
          Height = 60
          AutoSize = False
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -48
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          Text = '0,00'
          OnKeyPress = Final_Vlr_TrocoKeyPress
        end
      end
    end
    object Titulo_Final_Compra: TPanel
      Left = 0
      Top = 0
      Width = 520
      Height = 25
      Alignment = taLeftJustify
      BevelInner = bvRaised
      BevelOuter = bvNone
      BevelWidth = 2
      BorderStyle = bsSingle
      Caption = '  Finaliza'#231#227'o da Compra'
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object BT_Finalizar_Venda: TBitBtn
      Left = 392
      Top = 287
      Width = 121
      Height = 33
      Hint = 'Finalizar Venda|Finalizar Venda'
      Caption = '&Finalizar Venda'
      TabOrder = 2
      OnClick = BT_Finalizar_VendaClick
      OnKeyPress = BT_Finalizar_VendaKeyPress
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
  object Valida_Gaveta: TTimer
    Enabled = False
    Interval = 1250
    OnTimer = Valida_GavetaTimer
    Left = 7
    Top = 289
  end
end
