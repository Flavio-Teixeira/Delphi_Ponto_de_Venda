object Mvto_Compra00: TMvto_Compra00
  Left = 248
  Top = 188
  BorderStyle = bsDialog
  ClientHeight = 204
  ClientWidth = 436
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Compra: TPanel
    Left = 4
    Top = 3
    Width = 429
    Height = 198
    TabOrder = 0
    object Label1: TLabel
      Left = 264
      Top = 96
      Width = 73
      Height = 16
      AutoSize = False
      Caption = ' Quantidade'
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbl_Descricao: TLabel
      Left = 80
      Top = 48
      Width = 177
      Height = 16
      AutoSize = False
      Caption = ' Descri'#231#227'o'
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbl_Codigo: TLabel
      Left = 8
      Top = 48
      Width = 65
      Height = 16
      AutoSize = False
      Caption = ' C'#243'digo'
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbl_Vlt_Unit: TLabel
      Left = 264
      Top = 48
      Width = 73
      Height = 16
      AutoSize = False
      Caption = ' Vlr. Unit'#225'rio'
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbl_Vlr_Total: TLabel
      Left = 344
      Top = 48
      Width = 73
      Height = 16
      AutoSize = False
      Caption = ' Valor Total'
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbl_Operacao: TLabel
      Left = 8
      Top = 104
      Width = 249
      Height = 89
      Alignment = taCenter
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -80
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Titulo_Lista_Compras: TPanel
      Left = 0
      Top = 0
      Width = 428
      Height = 25
      Alignment = taLeftJustify
      BevelInner = bvRaised
      BevelOuter = bvNone
      BevelWidth = 2
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
    object txt_Codigo: TEdit
      Left = 8
      Top = 64
      Width = 65
      Height = 21
      AutoSize = False
      Ctl3D = False
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object txt_Descricao: TEdit
      Left = 80
      Top = 64
      Width = 177
      Height = 21
      AutoSize = False
      Ctl3D = False
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
    object txt_Vlt_Unit: TEdit
      Left = 264
      Top = 64
      Width = 73
      Height = 21
      AutoSize = False
      Ctl3D = False
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
    end
    object txt_Vlr_Total: TEdit
      Left = 344
      Top = 64
      Width = 73
      Height = 21
      AutoSize = False
      Ctl3D = False
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
    end
    object txt_Qtde: TEdit
      Left = 264
      Top = 112
      Width = 153
      Height = 73
      AutoSize = False
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -67
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
      OnKeyPress = txt_QtdeKeyPress
    end
  end
end
