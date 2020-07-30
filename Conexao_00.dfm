object Conexao00: TConexao00
  Left = 207
  Top = 107
  BorderStyle = bsDialog
  ClientHeight = 269
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 16
    Width = 317
    Height = 13
    Caption = 
      'Se sua m'#225'quina for uma esta'#231#227'o de trabalho '#233' necess'#225'rio indicar ' +
      'a'
  end
  object Label2: TLabel
    Left = 10
    Top = 30
    Width = 318
    Height = 13
    Caption = 'localiza'#231#227'o de sua base de dados (Caminho do Servidor) no campo'
  end
  object Label3: TLabel
    Left = 10
    Top = 43
    Width = 34
    Height = 13
    Caption = 'abaixo:'
  end
  object Label4: TLabel
    Left = 10
    Top = 96
    Width = 31
    Height = 13
    Caption = 'Obs.:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 43
    Top = 96
    Width = 282
    Height = 13
    Caption = #201' necess'#225'rio informar uma '#39'\'#39' no final da localiza'#231#227'o de sua '
  end
  object Label6: TLabel
    Left = 10
    Top = 110
    Width = 180
    Height = 13
    Caption = 'base de dados (Caminho do Servidor).'
  end
  object Label7: TLabel
    Left = 10
    Top = 131
    Width = 43
    Height = 13
    Caption = 'Exemplo:'
  end
  object Label8: TLabel
    Left = 64
    Top = 131
    Width = 152
    Height = 13
    Caption = 'C:\PdvTex\BD\                     ou'
  end
  object Label9: TLabel
    Left = 64
    Top = 147
    Width = 152
    Height = 13
    Caption = '\\Servidor\C\PdvTex\BD\    ou'
  end
  object Label10: TLabel
    Left = 64
    Top = 163
    Width = 77
    Height = 13
    Caption = 'E:\PdvTex\BD\'
  end
  object Label11: TLabel
    Left = 10
    Top = 186
    Width = 306
    Height = 13
    Caption = 'Para que sua altera'#231#227'o tenha o efeito desejado, clique no bot'#227'o '
  end
  object Label12: TLabel
    Left = 10
    Top = 200
    Width = 227
    Height = 13
    Caption = #39'Gravar'#39', saia do ConsulTEX e entre novamente.'
  end
  object conexao_caminho: TEdit
    Left = 10
    Top = 64
    Width = 318
    Height = 19
    Color = clWhite
    Ctl3D = False
    MaxLength = 100
    ParentCtl3D = False
    TabOrder = 0
  end
  object BT_Gravar: TButton
    Left = 8
    Top = 238
    Width = 150
    Height = 25
    Caption = '&Gravar'
    TabOrder = 1
    OnClick = BT_GravarClick
  end
  object BT_Cancelar: TButton
    Left = 182
    Top = 238
    Width = 150
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 2
    OnClick = BT_CancelarClick
  end
end
