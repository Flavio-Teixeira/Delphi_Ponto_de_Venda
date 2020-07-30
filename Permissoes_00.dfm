object Permissoes00: TPermissoes00
  Left = 186
  Top = 10
  BorderStyle = bsDialog
  Caption = 'Permiss'#245'es de Usu'#225'rio'
  ClientHeight = 467
  ClientWidth = 467
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
  object Panel3: TPanel
    Left = 5
    Top = 421
    Width = 457
    Height = 41
    TabOrder = 1
    object BT_Sair: TBitBtn
      Left = 373
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
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
    object BT_Alterar: TBitBtn
      Left = 191
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Alterar'
      TabOrder = 0
      OnClick = BT_AlterarClick
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
    object Padrao: TEdit
      Left = 8
      Top = 8
      Width = 9
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 5
    Width = 457
    Height = 409
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 441
      Height = 393
      Caption = '  Permiss'#245'es  '
      TabOrder = 0
      object Label2: TLabel
        Left = 256
        Top = 21
        Width = 90
        Height = 13
        Caption = 'Usu'#225'rio - FISCAL ?'
      end
      object Label1: TLabel
        Left = 12
        Top = 22
        Width = 36
        Height = 13
        Caption = 'Usu'#225'rio'
      end
      object Grid_Permissoes: TStringGrid
        Left = 8
        Top = 43
        Width = 425
        Height = 341
        ColCount = 4
        Ctl3D = False
        DefaultRowHeight = 19
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        ParentCtl3D = False
        ScrollBars = ssVertical
        TabOrder = 0
        OnDblClick = Grid_PermissoesDblClick
        ColWidths = (
          64
          64
          64
          64)
      end
      object RB_NT_S: TRadioButton
        Left = 350
        Top = 21
        Width = 41
        Height = 14
        Caption = 'Sim'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
      object RB_NT_N: TRadioButton
        Left = 390
        Top = 21
        Width = 41
        Height = 14
        Caption = 'N'#227'o'
        TabOrder = 2
      end
      object CB_Usuarios: TComboBox
        Left = 52
        Top = 18
        Width = 185
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 3
        OnChange = CB_UsuariosChange
      end
    end
  end
end
