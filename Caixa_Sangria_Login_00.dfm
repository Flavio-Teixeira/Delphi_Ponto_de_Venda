object Caixa_Sangria_Login00: TCaixa_Sangria_Login00
  Left = 272
  Top = 335
  BorderStyle = bsDialog
  Caption = 'Cancelamento de Cupons'
  ClientHeight = 144
  ClientWidth = 324
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 3
    Top = 3
    Width = 319
    Height = 139
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 301
      Height = 121
      Caption = '  Retirada / Sangria - Altera'#231#227'o  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 27
        Top = 66
        Width = 35
        Height = 13
        AutoSize = False
        Caption = 'Senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 27
        Top = 42
        Width = 35
        Height = 13
        AutoSize = False
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Login_Mensagem: TLabel
        Left = 27
        Top = 96
        Width = 246
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Login_Senha: TEdit
        Left = 64
        Top = 64
        Width = 177
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 50
        ParentCtl3D = False
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 1
        OnKeyPress = Login_SenhaKeyPress
      end
      object Login_Nome: TEdit
        Left = 64
        Top = 40
        Width = 209
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 50
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnKeyPress = Login_NomeKeyPress
      end
      object Login_OK: TButton
        Left = 246
        Top = 64
        Width = 27
        Height = 19
        Hint = 'Permite Logar-se no Sistema|Permite Logar-se no Sistema'
        Caption = 'OK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = Login_OKClick
      end
      object Tipo_Cancelamento: TEdit
        Left = 277
        Top = 88
        Width = 17
        Height = 22
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 3
        Visible = False
      end
    end
  end
end
