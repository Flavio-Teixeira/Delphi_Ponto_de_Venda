object Cancela_Cupons00: TCancela_Cupons00
  Left = 248
  Top = 153
  BorderStyle = bsDialog
  Caption = 'Cancelamento de Cupons Impressos'
  ClientHeight = 425
  ClientWidth = 633
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
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 617
    Height = 361
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 8
      Top = 8
      Width = 601
      Height = 345
      TabOrder = 0
      object GridCupons: TDBGrid
        Left = 7
        Top = 16
        Width = 586
        Height = 321
        Color = clWhite
        Ctl3D = False
        DataSource = ConexaoBD.DS_Cabeca_Cupons
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = GridCuponsDrawColumnCell
        OnKeyPress = GridCuponsKeyPress
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Cabeca_Cupom_Numero'
            Font.Charset = ANSI_CHARSET
            Font.Color = clGreen
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Title.Caption = 'Cupom'
            Width = 70
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Cabeca_Cupom_Forma_Pgto'
            Title.Alignment = taCenter
            Title.Caption = 'Forma Pgto.'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cabeca_Cupom_Vlr_Total'
            Title.Alignment = taCenter
            Title.Caption = 'Vlr. Total'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cabeca_Cupom_Vlr_Pago'
            Title.Alignment = taCenter
            Title.Caption = 'Vlr. Pago'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cabeca_Cupom_Vlr_Troco'
            Title.Alignment = taCenter
            Title.Caption = 'Vlr. Troco'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cabeca_Cupom_Qtd_Itens'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd Itens'
            Width = 90
            Visible = True
          end>
      end
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 376
    Width = 617
    Height = 41
    TabOrder = 1
    object BT_Sair: TBitBtn
      Left = 534
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 0
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
    object BT_Cancelar: TBitBtn
      Left = 432
      Top = 8
      Width = 89
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = BT_CancelarClick
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888800008888888888888888888800008888888888887788888800008877
        7777777077778888000080000000007000777888000080FFFFFFF07000007788
        000080F44F44F07000000778000080FFFFFFF07887000077000080F44444F078
        88870077000080FFFFFFF07888887007000080F44444F07888788007000080FF
        FFFFF07880788007000080F44FFFF07800770078000080FFFF00008000000788
        000080F44F0F088000078888000080FFFF008888007888880000800000088888
        8088888800008888888888888888888800008888888888888888888800008888
        88888888888888880000}
    end
  end
end
