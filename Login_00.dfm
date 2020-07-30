object Login00: TLogin00
  Left = 198
  Top = 126
  BorderStyle = bsNone
  Caption = 'Login do Usu'#225'rio'
  ClientHeight = 144
  ClientWidth = 324
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000110000000000000099
    1000000000000191100000000000008891100000000009991100000000000008
    7911000000000999110000000000000018911000000019991100000000000000
    0089100000001999110000000000000000189100000019991000000000000000
    0008891000009999100000000000000000008891000099991000000000000000
    0000088910019999100000000000000000000088911199911000000000000000
    0000001889999991100000000000000000000000879999910000000000000000
    0000000008799991000000000000000000000000001899910000000000000000
    0000000000199991000000000000000000000000001999910000000000000000
    0000000000199991100000000000000000000000001999991000000000000000
    0000000000199999910000000000000000000000009999999910000000000000
    0000000000999988899100000000000000000000019991017891100000000000
    0000000001991000088911000000000000000000018910000088911000000000
    0000000000891000000889100000000000000000001810000000879100000000
    0000000000000000000008791000000000000000000110000000008791000000
    000000000000000000000008791100000000000000000000000000001891FFFF
    FFFFFFFFCFFFC7FF87FFC1FF83FFE0FF83FFF07F03FFFC7F03FFFC3F07FFFE1F
    07FFFF0F07FFFF8607FFFFC007FFFFC007FFFFF00FFFFFF80FFFFFFC0FFFFFFC
    0FFFFFFC0FFFFFFC07FFFFFC07FFFFFC03FFFFFC01FFFFFC00FFFFF8207FFFF8
    783FFFF87C1FFFFC7E1FFFFC7F0FFFFFFF87FFFE7FC3FFFFFFE0FFFFFFF0}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 3
    Top = 3
    Width = 319
    Height = 139
    TabOrder = 0
    object Nro_Licenca: TLabel
      Left = 91
      Top = 4
      Width = 3
      Height = 13
      Color = clBtnFace
      ParentColor = False
    end
    object Registro_ConsulTEX: TLabel
      Left = 8
      Top = 4
      Width = 76
      Height = 13
      Caption = 'Nro.Registro:'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 23
      Width = 301
      Height = 109
      Caption = '  Acesso - PdvTex  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Login_Sair: TLabel
        Left = 230
        Top = 91
        Width = 45
        Height = 13
        Cursor = crHandPoint
        Hint = 'Sair do Sistema|Sair do Sistema'
        Caption = '< Sair >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = Login_SairClick
      end
      object Label2: TLabel
        Left = 27
        Top = 49
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
        Top = 25
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
        Top = 69
        Width = 246
        Height = 15
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 28
        Top = 91
        Width = 113
        Height = 13
        Cursor = crHandPoint
        Caption = '< Alterar Conex'#227'o >'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Visible = False
        OnClick = Label3Click
      end
      object Login_Senha: TEdit
        Left = 64
        Top = 47
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
        Top = 23
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
        Top = 47
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
      object PdvTex_Caminho: TEdit
        Left = 152
        Top = 71
        Width = 25
        Height = 24
        Enabled = False
        TabOrder = 3
        Visible = False
      end
      object Posicao_1: TEdit
        Left = 179
        Top = 72
        Width = 9
        Height = 22
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 4
        Visible = False
      end
    end
  end
end
