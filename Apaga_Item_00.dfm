object ApagaItem00: TApagaItem00
  Left = 281
  Top = 183
  BorderStyle = bsDialog
  Caption = 'Apaga o Item da Compra'
  ClientHeight = 261
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 5
    Width = 198
    Height = 16
    Caption = 'Selecione o Item a Ser Apagado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Lista_Itens: TStringGrid
    Left = 8
    Top = 24
    Width = 576
    Height = 227
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
    OnKeyDown = Lista_ItensKeyDown
    OnKeyPress = Lista_ItensKeyPress
  end
  object Campo_Retorno: TEdit
    Left = 208
    Top = 2
    Width = 9
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    Visible = False
  end
end
