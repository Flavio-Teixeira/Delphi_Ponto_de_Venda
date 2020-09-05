object RelCupomFiscal00: TRelCupomFiscal00
  Left = 230
  Top = 123
  BorderStyle = bsDialog
  Caption = 'Relat'#243'rio - Registro de Caixa'
  ClientHeight = 696
  ClientWidth = 778
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QR_CupomFiscal: TQuickRep
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = ConexaoBD.SQL_Compras_Clientes_Rel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRSTRINGSBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 1
    PrinterSettings.LastPage = 1
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object Cabecalho: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 177
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        468.312500000000000000
        1899.708333333333000000)
      BandType = rbPageHeader
      object QR_CFe_Nome_Fantasia: TQRLabel
        Left = 201
        Top = 10
        Width = 315
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          531.812500000000000000
          26.458333333333330000
          833.437500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QR_CFe_Nome_Fantasia'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_Razao_Social: TQRLabel
        Left = 201
        Top = 40
        Width = 315
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          531.812500000000000000
          105.833333333333300000
          833.437500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QR_CFe_Razao_Social'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_Logradouro: TQRLabel
        Left = 201
        Top = 57
        Width = 315
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          531.812500000000000000
          150.812500000000000000
          833.437500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QR_CFe_Logradouro'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_Cidade: TQRLabel
        Left = 201
        Top = 73
        Width = 315
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          531.812500000000000000
          193.145833333333300000
          833.437500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QR_CFe_Cidade'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_CNPJ: TQRLabel
        Left = 235
        Top = 89
        Width = 72
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          621.770833333333300000
          235.479166666666700000
          190.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QR_CFe_CNPJ'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_IE: TQRLabel
        Left = 444
        Top = 89
        Width = 55
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1174.750000000000000000
          235.479166666666700000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QR_CFe_IE'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_LBL_CNPJ: TQRLabel
        Left = 201
        Top = 89
        Width = 32
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          531.812500000000000000
          235.479166666666700000
          84.666666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CNPJ:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_LBL_IE: TQRLabel
        Left = 423
        Top = 89
        Width = 19
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1119.187500000000000000
          235.479166666666700000
          50.270833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'I.E.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_Cupom: TQRLabel
        Left = 202
        Top = 112
        Width = 313
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          534.458333333333300000
          296.333333333333300000
          828.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CUPOM FISCAL ELETR'#212'NICO - CFe SAT'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QR_CFe_Extrato: TQRLabel
        Left = 207
        Top = 140
        Width = 67
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          547.687500000000000000
          370.416666666666700000
          177.270833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Extrato Nro.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_Nro_Cupom: TQRLabel
        Left = 277
        Top = 140
        Width = 43
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          732.895833333333300000
          370.416666666666700000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '9999999'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_Consumidor: TQRLabel
        Left = 333
        Top = 140
        Width = 76
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          881.062500000000000000
          370.416666666666700000
          201.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CONSUMIDOR:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_Consumidor_CNPJ_CPF: TQRLabel
        Left = 412
        Top = 140
        Width = 160
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1090.083333333333000000
          370.416666666666700000
          423.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QR_CFe_Consumidor_CNPJ_CPF'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_Item: TQRLabel
        Left = 7
        Top = 159
        Width = 7
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          420.687500000000000000
          18.520833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '#'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_Codigo: TQRLabel
        Left = 41
        Top = 159
        Width = 40
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          420.687500000000000000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C'#243'digo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_Descricao: TQRLabel
        Left = 141
        Top = 159
        Width = 55
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          420.687500000000000000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Descri'#231#227'o'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_Qtde: TQRLabel
        Left = 453
        Top = 159
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          420.687500000000000000
          79.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Qtde.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_Unidade: TQRLabel
        Left = 493
        Top = 159
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          420.687500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Und.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_Vlr_Unitario: TQRLabel
        Left = 529
        Top = 159
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          420.687500000000000000
          158.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Vlr.Unit. R$'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_Tributos: TQRLabel
        Left = 599
        Top = 159
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          420.687500000000000000
          111.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Trib. R$'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_Vlr_Item: TQRLabel
        Left = 650
        Top = 159
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          420.687500000000000000
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Vlr.Item R$'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_Logo: TQRImage
        Left = 24
        Top = 40
        Width = 145
        Height = 45
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          119.062500000000000000
          63.500000000000000000
          105.833333333333300000
          383.645833333333300000)
        Picture.Data = {
          0A544A504547496D6167653B110000FFD8FFE000104A46494600010200006400
          640000FFEC00114475636B7900010004000000640000FFEE002641646F626500
          64C0000000010300150403060A0D000003B100000B7C00000E7300001139FFDB
          0084000101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101020202020202020202020203030303030303
          0303030101010101010102010102020201020203030303030303030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          03030303FFC2001108002D009103011100021101031101FFC400C10000020300
          0301000000000000000000000007050608030409020101000000000000000000
          0000000000000010000202010303040300000000000000000506030402000107
          121314306015161020261100020201020503020403030D000000000102030405
          1112002131131441220651156171322310308120526391A1D14262723343A344
          9425071201000000000000000000000000000000601301010002020200050403
          0000000000000111002131415161103060F07181C1D1F120A1E1FFDA000C0301
          0002110311000001F7F0EA09318E431F0738C52805E8E5000000000100449DA2
          B0770EC16D152394A71A00930000003E04A8BC2708515C280D7474C9F1344D1B
          70A399F0760CF0032E1044596421CCBA268D2C2A4601502DE234DAA250A79762
          04F580CE05586B0B1384409E8318A0CF231C7C1643009AA0E0160488A43D802C
          E528BD94F39CB480000000000001FFDA0008010100010502D4D3C55A291FC6F5
          8D383CB551CCB5C85A999ABC577064AB991D143F08B9F0CB6CF0F49BFAC81294
          A1BDAE631C749EB0DF6145C1C595C2F065FD31863B385ABD66F5A98A9D928451
          B119AF9D3B51DDABFBE59638ECD74A6B7177041AB02EDAB2FD8373D2BB72FBB6
          2A3B89E49B389A211CA38A5896E1EBCCB424AD69D1DA5AD0718BC9238434CA5F
          700052792A7375975C01B4EFF9BBBFD8CAE71D507A30036BAE58D8195E4B5B52
          AF5395F3C646CCAC5E6CB7C84DE506489ACCD030C7233030557367A2C144024D
          D3EAC22DB632DDBA159190A71923E59E09C8B5196D1B676C676C64A2D6E28C67
          C9874436C968BC32A60D95606DE9AC8E9A1150CDE25DA9CA0BC6EC332F09A634
          6727A214DCB0146653D6DE564F48E5CC828A12C42AADA2FC576959A07DD00887
          042471D2B969C52E8DE40593ECEA8CCA8CC486BE9FBFD9975276FA29FD6FC8D1
          7F83ED8AF87EC7ADFFDA0008010200010502F797FFDA0008010300010502F797
          FFDA0008010202063F0265FFDA0008010302063F0265FFDA0008010101063F02
          E249E7912286252F248E76AAA8F524F07C6A592B90A1D1ECC500118FC40660DA
          7E7B7892D5190CA2104CB095D93C642960AD19F56D391E8788AA8AD3C2D32B94
          77688AEA89DCDA763920950786A4B56C4A56CAD5EE218B6990BAC67682FB8ED7
          3A71E008A6D0CC6B2D9F66C69C314D366BBC2171A06FE0B03D79A626113968CC
          60052CEBA7BD8127F6CF08E3A3AAB0D7E8C35FE5E0701BCC75EF4ED3DA23ABA4
          2468BFD1777F5D38C8D2F8DD4A71D1C018616A5D9DF3DB2CDB088C0E7E879F2E
          435278A8B49445F70C7BC993AB191B124EDCAFCC2F207746A7F3E7EBC6B21DA9
          4AFB063FE01665D7FF001E4E2B337A492DE97F35D641FF005E45E376D8F43959
          A3EDECF62FEE4A9DD51AF29796BAFD7892A50DB1881FB524C6312C92CDD0A428
          7550AAC74E8496E256BFBFBB1C0B1A1920F1D8C7FB8DCD3626BA3B1E7A715AA5
          4D9E478B0C92CCE372C08C9ED01396E91F6FAF203EBC234E7BA8C37F6AC56EC7
          763FAC522C719D3F1F70E21B516BB264DC01EAA7A3237FB48C34FE4166215475
          2C7403F3278A599C4159EEE1A6EF0589849DC87DAD228DA4EE2BB3A7AA93C1CB
          6373CDF1CCA4D181760958468EC000C752F12BF4F4275FA03C4F3D8CE7DCF276
          3DB3DD2934FA0EA551A259800C7AFB89E5C35CA9621B356E449EE46E92C63B52
          C7229D1A37D8AA79E9AF07C5AA97B2B761515E399DE3AB5AA2C8DDDB53BA02F2
          77665D888BA6A51B5234E2BDECC57A4681C81B16E6A027596AABBB34922C6F2D
          813A425FDCBC9B6F4D4F2E3CC4DAD14967EE14A73EFAF32CAC65DBB86835D5C8
          EBAE9A11C0D235EFCA8902C70EE290C40B7BE463D14172493A7D381674635A78
          618FBBA7B639608C45B643D177A28235EBCF8A064AB5E5B27C84AB1C723A23BE
          D88CB24EDEF31C11A0D741A92741C4980B7571F1C1531B66EA4B57BE26DE2EC0
          3648B2CB22EC22D9FA1E5FC32B995AE6D363EA496120D4A891C68177B004A441
          8EAEDE8BA9E3E41633D56BD48B05523C8CB731F1D97AFE2B89CBC6F1334F2F90
          82BEAA149DEBE834E76D70F3CD2B511035859AA58AA556CF7842477E34DE18C0
          DD3A69FD8CBFDC2D4B5FE3DF1EDC258A16D0CD2C7BC331E5CD8946F4E43403AE
          BC6173D806B95ABE42D2D6971D709D6CC2CDCDC2EE6D519472EBCC8238931953
          4863B5DBB729006902B47DCB2C17A6A58721F56E2C52C07C513350D1F65CBD30
          594C8C3F56D778A52DD0F4EBE834E29FCB705078D08B22B6531927BE1FD5A326
          C3AAE84FD3FBC08D389DA3E511C262CC4072D91B4765D4281C87EAE28C74E855
          FB859C6E3F1D56862E22AACB5AB08927B1CDCEA036B2CADA2AA01F4E22F88E36
          F4B5A9E0B198FA7939EA6AB62FDDF0E06ED89C0EF475E3859392685998EA7969
          C52A9889ADE40D9B5B4E11AC3D98B2300606C4918B5A3D3658B56EEFB3669ABF
          2E5C666AD2CE65E9D783ED620AF52E4A90A6FC7D399956B0260732CAE75D54EA
          4F1F1D8FE489692EC999F90CD02DC9A29EC0A4D4B0DDBDCD1492ED1DF1268A4E
          A38CAFCA4D7B0D82FB458871293DA88D3B397B198AD56BEDAEB3BD98D16C194B
          9D8BEDD7EA383667CEE5DED46EAE5E2BF6A8C30770336B5A0AC62A8889B7F48E
          7CC75E7C7C9EF648CDBAB63ED8C4E73F6E393235FB2CACC047A6F92AC8A50CDB
          42C9AFD431E3FF00A6D45622B47824B0907FCB49AC419713CAA3FBF288975FF7
          7885BE3DE7AC35EF619F34D56EA5583C1F399B4B71BD88BCA8FB4937B42B9D35
          FAF1630B84B3752AF9D631D8CC763AC1A4D6FC4322CD66DD9592066EE78EF27B
          9C46918E9AEA48A594B57A44A7241F72C3E46E7DC226A7301217AB65A4B2627E
          CB6E8DA37DBB868C3A8E3F57F98FFA38C9CD6EB496BE3DF200DE5344BA9AF2BE
          EDE1BA687576D398D54F2E6388AF4577239696BFBA863E4590A4327541EF8635
          F6B7E3D79E878BDF22CB47D8B7925EDD783986AF5797556F72121140D79E83F1
          E325F1ACADDB384B3E77955B270065EEAFB34264039C6C13F23AFD78ABF11F8D
          BCB7925B5E4E4722E8447FA8333EBB468A0FE1A7B401AEBC4ED8EC2E5AF56FB3
          E3E0867A742CD988B4314F194EE431B2875E5A8E31FD9C6D4A36BEDD4A3B5D9A
          90D798C8B5E3EE2CCD1A2B33071CF5F5E27F91E1A9CD90AD7C44D91AD515A6B7
          5ADC51257F212B28324D5A68224DDB3565704E9A1E556B458EBB46285BF732F7
          A9CB8E5AAAD2032D859648E19EDDF03F404E9B40F62F16CD3C3E6F2157FF0043
          1C3796A5AB8B616B50A15DE59AE2A323C81E23DC663D75D78F8DB6371B7F202B
          CD94EFF83566B461EF454FB5DC5855D943F6CE87F0E2A7C72EC72E32FC90D892
          216E17492ADA8F2F62F5269E13A48A8C42EE1D76371E2CF82CB7931F71156BE3
          A6C85698B0DA26AD3C30CD5E6DBD51BFD53CC80C397CB65B515A5BB97C3CB051
          F8F5790CDDB5085FBB3568CB44D94B0C74D1756551A6A49207CE71B7E85FC4FD
          E315528559B214E7AA1A568F2CA59566456916133A16D07AF104357199AA62C6
          431B5B286BD01731B6AA477177B1B6609EBF8EB14D21122B23053CF4E26CC612
          B5E92B35FB191C5E431B59AE9A86CB3BCB52DD748A629B7C878FDE8639233D75
          D40BF93CAE0B3B6EC5C4AF1D69D70734024AF157EDA0EDC15A35882CA5BF5007
          D7A71FF0CF0DDDD9DBD0EFEE69B36FAEEDDCB4E0F81F66F2B5FF00B6F0FBDAFE
          1DBF77F93F827DEBC0EDEBFB7E6F6B5D7D7B5BFDFF009E9C1FB3F85D8D7DDE17
          6B4DDFE276F9EEFCFF009FFFDA0008010103013F21C2AE91F96693F970A6E414
          A77223C7157F99141BA1D65EA79C45726BA56831B5D67089306E0E1F964C962D
          C23365C681B7A9BF81A7A83E6ECC9E32E9815C801B2EE3F2F79AA1800313811E
          EBAC348AE83759AAAD32C166224DE06F130CE9EAC450B87B029EA45CFD733ED2
          CF6E681D7B725E41BE85A85C4C636C0439DC2A3A013674D884438460B478C10E
          D1D41BF024EDA4CAC13251059A9276D4D79326B8FA9B1EB293EA9F2019CD10DE
          5001891735D686B1067609B9924BDC0ADBF4EC302D98E2E3D9C40C205DD06826
          3DAA534E16FC20A0EB8C5D1C28DCC742BA607BD16819130262932C1450E7527C
          A68E203D4B2F08244B5B6C2E9C02CA64E499FC2190E14630BFAD4F11A22550E6
          8CF20B2F13CE0868FC0701C601664D00CE1ACD8C5F61337E582D260DF7955907
          40DDAB6E4FF06DEA0E28044EEBA46056360B5E9017E482C2438C8490BEE3E7A4
          7513EB1D516E2D8584B2D34E96047106709C3C73A1190E6A52CB30D108B61DB9
          CF37915489A96E981B3A26031BB8266D6D64370F1CD894A5AB98B564A825C030
          21FA5B81C5E7EE03EC8D9FC0219B3D9453C3404A887004F0BB579770408B7308
          4665B2361840044AE181813E888837DC78C79E85EDE97E7A609A5A50F8D47566
          80EDB646E242851226D68ADD187569652475083DE72569C7D58A742C05B14DA7
          21311C5466BDE8087B371ABD2620E905D2C26504C9481350A394415EC24B36CE
          BFF506DEC225303512013AB61B63A6707C1CA7BD140F477C2C3C6946ACC458EC
          817109567A02945C1958230873D91B39A12E0C9676493F433966AE3C096A39C7
          E0ED568662583B25EF7389CDC31B34881DF2551A11CE552A3C46D4580EECD16C
          3F53B5448216C4166C28422D815F36B0E7F767F39FB19ADFA2F9BACF7C5F9ADF
          9B79F83DD67E21F60F9CFB0C91E83F3F9FFFDA0008010203013F21FACBFFDA00
          08010303013F21FACBFFDA000C03010002110311000010100020800000000804
          9208000000048208048000001009000041009048040209008000200040000000
          0003FFDA0008010103013F10C284E2EFAE80741B500150C6C8D248DC502EE4EB
          2369662966361156B2000A0A49B50C5458EF10C782C4B534AA0A6194B6F68705
          292D44D433E1971F0519EF280209BDE85A2CC0274A011B14BF2DA06F5D80D420
          AEBB8389D483958198C1032F27E59D63EB0D90201B5B9C51F2C8CAAFE0B8642D
          D27310D0532F87D621D00F25DC4765B492AA3E06EC15809049040E4D3AC09EAE
          943099C91C9F91A863BCA2C8E8840A244FD227D680CC8A0E06C4B60E00747B6B
          8A47E422141D9F211BCA8620D6863AA57DB4C0A0BEDDC97AD0E629A679AB1B4E
          BDE351EA0635423BA18EA22EB422831DD0809BE5E575659A27958B4B085700CD
          B6A16A52E0A9645A28377E3349CD92E0A50C6FA8873E082290E3ED2318FAF1EC
          5C4D5478DC801CAAD40A613C95982493190B5FF6671699025A914E318C37C460
          3DCCFC73A9397A2367C50C31CBF5457108BC401CBE105C1D88EDDD497FB84078
          14A05D61CC60F62518FB45B664DED99DED1610D5A8FABF292D0B7C0EA00262BF
          A297845BA8720F610669AD879E15018494D05FE9777012106CCCC89B621E4ADD
          DA3C26C378D3FBF3B0EE609D99ECE685C34B82D87D9468816BCD08D19919E94E
          5140D052F34307C2408804B93AF8591AAE1CC95F574062960A5B4BB2147805CA
          0C09D684E9F1D823234C1EC6211260499401610159B3BBCE5A08DB968011F046
          6C9E2123ABD830C581021AEB2399B35897522458BC81C2110855984D69C5E74D
          2A82A4459F6695C78BD8DB2EF79C8C7D4F31E74AA0327C0041A3CB8EF31BA078
          1E15F0539E686E165768E014311342D82EE4BFFF000CCB4D1E1861153AC91F25
          239D8162B2684199C8108E275240B13471902175418E812E535A034E18DCCE88
          5F6477F301C22959C4FD4097538E8F9AFF0070905FF2E5CE7E5A1E65FDEA73F0
          FB78F97371E998F55FE90FFA1BAFD7CFFFDA0008010203013F10FACBFFDA0008
          010303013F10FACBFFD9}
      end
    end
    object Detalhe: TQRBand
      Left = 38
      Top = 215
      Width = 718
      Height = 654
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1730.375000000000000000
        1899.708333333333000000)
      BandType = rbDetail
      object Item1: TQRLabel
        Left = 7
        Top = 3
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          7.937500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item1'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo1: TQRLabel
        Left = 41
        Top = 3
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          7.937500000000000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo1'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao1: TQRLabel
        Left = 141
        Top = 3
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          7.937500000000000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao1'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde1: TQRLabel
        Left = 453
        Top = 3
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          7.937500000000000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde1'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und1: TQRLabel
        Left = 493
        Top = 3
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          7.937500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und1'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit1: TQRLabel
        Left = 529
        Top = 3
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          7.937500000000000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit1'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib1: TQRLabel
        Left = 599
        Top = 3
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          7.937500000000000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib1'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem1: TQRLabel
        Left = 650
        Top = 3
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          7.937500000000000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem1'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item2: TQRLabel
        Left = 7
        Top = 21
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          55.562500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item2'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo2: TQRLabel
        Left = 41
        Top = 21
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          55.562500000000000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo2'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao2: TQRLabel
        Left = 141
        Top = 21
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          55.562500000000000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao2'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde2: TQRLabel
        Left = 453
        Top = 21
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          55.562500000000000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde2'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und2: TQRLabel
        Left = 493
        Top = 21
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          55.562500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und2'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit2: TQRLabel
        Left = 529
        Top = 21
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          55.562500000000000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit2'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib2: TQRLabel
        Left = 599
        Top = 21
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          55.562500000000000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib2'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem2: TQRLabel
        Left = 650
        Top = 21
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          55.562500000000000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem2'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item3: TQRLabel
        Left = 7
        Top = 39
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          103.187500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item3'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo3: TQRLabel
        Left = 41
        Top = 39
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          103.187500000000000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo3'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao3: TQRLabel
        Left = 141
        Top = 39
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          103.187500000000000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao3'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde3: TQRLabel
        Left = 453
        Top = 39
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          103.187500000000000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde3'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und3: TQRLabel
        Left = 493
        Top = 39
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          103.187500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und3'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit3: TQRLabel
        Left = 529
        Top = 39
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          103.187500000000000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit3'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib3: TQRLabel
        Left = 599
        Top = 39
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          103.187500000000000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib3'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem3: TQRLabel
        Left = 650
        Top = 39
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          103.187500000000000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem3'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item4: TQRLabel
        Left = 7
        Top = 57
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          150.812500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item4'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo4: TQRLabel
        Left = 41
        Top = 57
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          150.812500000000000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo4'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao4: TQRLabel
        Left = 141
        Top = 57
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          150.812500000000000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao4'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde4: TQRLabel
        Left = 453
        Top = 57
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          150.812500000000000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde4'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und4: TQRLabel
        Left = 493
        Top = 57
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          150.812500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und4'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit4: TQRLabel
        Left = 529
        Top = 57
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          150.812500000000000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit4'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib4: TQRLabel
        Left = 599
        Top = 57
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          150.812500000000000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib4'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem4: TQRLabel
        Left = 650
        Top = 57
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          150.812500000000000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem4'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item5: TQRLabel
        Left = 7
        Top = 74
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          195.791666666666700000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item5'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo5: TQRLabel
        Left = 41
        Top = 74
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          195.791666666666700000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo5'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao5: TQRLabel
        Left = 141
        Top = 74
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          195.791666666666700000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao5'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde5: TQRLabel
        Left = 453
        Top = 74
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          195.791666666666700000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde5'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und5: TQRLabel
        Left = 493
        Top = 74
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          195.791666666666700000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und5'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit5: TQRLabel
        Left = 529
        Top = 74
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          195.791666666666700000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit5'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib5: TQRLabel
        Left = 599
        Top = 74
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          195.791666666666700000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib5'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem5: TQRLabel
        Left = 650
        Top = 74
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          195.791666666666700000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem5'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item6: TQRLabel
        Left = 7
        Top = 91
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          240.770833333333300000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item6'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo6: TQRLabel
        Left = 41
        Top = 91
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          240.770833333333300000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo6'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao6: TQRLabel
        Left = 141
        Top = 91
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          240.770833333333300000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao6'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde6: TQRLabel
        Left = 453
        Top = 91
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          240.770833333333300000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde6'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und6: TQRLabel
        Left = 493
        Top = 91
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          240.770833333333300000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und6'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit6: TQRLabel
        Left = 529
        Top = 91
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          240.770833333333300000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit6'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib6: TQRLabel
        Left = 599
        Top = 91
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          240.770833333333300000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib6'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem6: TQRLabel
        Left = 650
        Top = 91
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          240.770833333333300000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem6'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item7: TQRLabel
        Left = 7
        Top = 107
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          283.104166666666700000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item7'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo7: TQRLabel
        Left = 41
        Top = 107
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          283.104166666666700000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo7'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao7: TQRLabel
        Left = 141
        Top = 107
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          283.104166666666700000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao7'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde7: TQRLabel
        Left = 453
        Top = 107
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          283.104166666666700000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde7'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und7: TQRLabel
        Left = 493
        Top = 107
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          283.104166666666700000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und7'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit7: TQRLabel
        Left = 529
        Top = 107
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          283.104166666666700000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit7'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib7: TQRLabel
        Left = 599
        Top = 107
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          283.104166666666700000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib7'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem7: TQRLabel
        Left = 650
        Top = 107
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          283.104166666666700000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem7'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item8: TQRLabel
        Left = 7
        Top = 123
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          325.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item8'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo8: TQRLabel
        Left = 41
        Top = 123
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          325.437500000000000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo8'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao8: TQRLabel
        Left = 141
        Top = 123
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          325.437500000000000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao8'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde8: TQRLabel
        Left = 453
        Top = 123
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          325.437500000000000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde8'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und8: TQRLabel
        Left = 493
        Top = 123
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          325.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und8'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit8: TQRLabel
        Left = 529
        Top = 123
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          325.437500000000000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit8'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib8: TQRLabel
        Left = 599
        Top = 123
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          325.437500000000000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib8'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem8: TQRLabel
        Left = 650
        Top = 123
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          325.437500000000000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem8'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item9: TQRLabel
        Left = 7
        Top = 139
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          367.770833333333300000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item9'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo9: TQRLabel
        Left = 41
        Top = 139
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          367.770833333333300000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo9'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao9: TQRLabel
        Left = 141
        Top = 139
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          367.770833333333300000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao9'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde9: TQRLabel
        Left = 453
        Top = 139
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          367.770833333333300000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde9'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und9: TQRLabel
        Left = 493
        Top = 139
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          367.770833333333300000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und9'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit9: TQRLabel
        Left = 529
        Top = 139
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          367.770833333333300000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit9'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib9: TQRLabel
        Left = 599
        Top = 139
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          367.770833333333300000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib9'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem9: TQRLabel
        Left = 650
        Top = 139
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          367.770833333333300000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem9'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item10: TQRLabel
        Left = 7
        Top = 155
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          410.104166666666700000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item10'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo10: TQRLabel
        Left = 41
        Top = 155
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          410.104166666666700000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo10'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao10: TQRLabel
        Left = 141
        Top = 155
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          410.104166666666700000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao10'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde10: TQRLabel
        Left = 453
        Top = 155
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          410.104166666666700000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde10'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und10: TQRLabel
        Left = 493
        Top = 155
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          410.104166666666700000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und10'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit10: TQRLabel
        Left = 529
        Top = 155
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          410.104166666666700000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit10'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib10: TQRLabel
        Left = 599
        Top = 155
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          410.104166666666700000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib10'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem10: TQRLabel
        Left = 650
        Top = 155
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          410.104166666666700000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem10'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item11: TQRLabel
        Left = 7
        Top = 171
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          452.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item11'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo11: TQRLabel
        Left = 41
        Top = 171
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          452.437500000000000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo11'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao11: TQRLabel
        Left = 141
        Top = 171
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          452.437500000000000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao11'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde11: TQRLabel
        Left = 453
        Top = 171
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          452.437500000000000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde11'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und11: TQRLabel
        Left = 493
        Top = 171
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          452.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und11'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit11: TQRLabel
        Left = 529
        Top = 171
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          452.437500000000000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit11'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib11: TQRLabel
        Left = 599
        Top = 171
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          452.437500000000000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib11'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem11: TQRLabel
        Left = 650
        Top = 171
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          452.437500000000000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem11'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item12: TQRLabel
        Left = 7
        Top = 187
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          494.770833333333300000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item12'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo12: TQRLabel
        Left = 41
        Top = 187
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          494.770833333333300000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo12'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao12: TQRLabel
        Left = 141
        Top = 187
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          494.770833333333300000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao12'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde12: TQRLabel
        Left = 453
        Top = 187
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          494.770833333333300000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde12'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und12: TQRLabel
        Left = 493
        Top = 187
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          494.770833333333300000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und12'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit12: TQRLabel
        Left = 529
        Top = 187
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          494.770833333333300000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit12'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib12: TQRLabel
        Left = 599
        Top = 187
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          494.770833333333300000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib12'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem12: TQRLabel
        Left = 650
        Top = 187
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          494.770833333333300000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem12'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item13: TQRLabel
        Left = 7
        Top = 203
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          537.104166666666700000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item13'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo13: TQRLabel
        Left = 41
        Top = 203
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          537.104166666666700000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo13'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao13: TQRLabel
        Left = 141
        Top = 203
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          537.104166666666700000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao13'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde13: TQRLabel
        Left = 453
        Top = 203
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          537.104166666666700000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde13'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und13: TQRLabel
        Left = 493
        Top = 203
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          537.104166666666700000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und13'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit13: TQRLabel
        Left = 529
        Top = 203
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          537.104166666666700000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit13'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib13: TQRLabel
        Left = 599
        Top = 203
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          537.104166666666700000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib13'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem13: TQRLabel
        Left = 650
        Top = 203
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          537.104166666666700000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem13'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item14: TQRLabel
        Left = 7
        Top = 219
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          579.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item14'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo14: TQRLabel
        Left = 41
        Top = 219
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          579.437500000000000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo14'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao14: TQRLabel
        Left = 141
        Top = 219
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          579.437500000000000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao14'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde14: TQRLabel
        Left = 453
        Top = 219
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          579.437500000000000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde14'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und14: TQRLabel
        Left = 493
        Top = 219
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          579.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und14'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit14: TQRLabel
        Left = 529
        Top = 219
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          579.437500000000000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit14'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib14: TQRLabel
        Left = 599
        Top = 219
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          579.437500000000000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib14'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem14: TQRLabel
        Left = 650
        Top = 219
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          579.437500000000000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem14'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item15: TQRLabel
        Left = 7
        Top = 235
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          621.770833333333300000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item15'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo15: TQRLabel
        Left = 41
        Top = 235
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          621.770833333333300000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo15'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao15: TQRLabel
        Left = 141
        Top = 235
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          621.770833333333300000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao15'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde15: TQRLabel
        Left = 453
        Top = 235
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          621.770833333333300000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde15'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und15: TQRLabel
        Left = 493
        Top = 235
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          621.770833333333300000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und15'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit15: TQRLabel
        Left = 529
        Top = 235
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          621.770833333333300000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit15'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib15: TQRLabel
        Left = 599
        Top = 235
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          621.770833333333300000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib15'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem15: TQRLabel
        Left = 650
        Top = 235
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          621.770833333333300000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem15'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item16: TQRLabel
        Left = 7
        Top = 251
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          664.104166666666700000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item16'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo16: TQRLabel
        Left = 41
        Top = 251
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          664.104166666666700000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo16'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao16: TQRLabel
        Left = 141
        Top = 251
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          664.104166666666700000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao16'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde16: TQRLabel
        Left = 453
        Top = 251
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          664.104166666666700000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde16'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und16: TQRLabel
        Left = 493
        Top = 251
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          664.104166666666700000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und16'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit16: TQRLabel
        Left = 529
        Top = 251
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          664.104166666666700000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit16'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib16: TQRLabel
        Left = 599
        Top = 251
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          664.104166666666700000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib16'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem16: TQRLabel
        Left = 650
        Top = 251
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          664.104166666666700000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem16'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item17: TQRLabel
        Left = 7
        Top = 267
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          706.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item17'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo17: TQRLabel
        Left = 41
        Top = 267
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          706.437500000000000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo17'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao17: TQRLabel
        Left = 141
        Top = 267
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          706.437500000000000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao17'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde17: TQRLabel
        Left = 453
        Top = 267
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          706.437500000000000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde17'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und17: TQRLabel
        Left = 493
        Top = 267
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          706.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und17'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit17: TQRLabel
        Left = 529
        Top = 267
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          706.437500000000000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit17'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib17: TQRLabel
        Left = 599
        Top = 267
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          706.437500000000000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib17'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem17: TQRLabel
        Left = 650
        Top = 267
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          706.437500000000000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem17'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item18: TQRLabel
        Left = 7
        Top = 283
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          748.770833333333300000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item18'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo18: TQRLabel
        Left = 41
        Top = 283
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          748.770833333333300000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo18'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao18: TQRLabel
        Left = 141
        Top = 283
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          748.770833333333300000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao18'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde18: TQRLabel
        Left = 453
        Top = 283
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          748.770833333333300000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde18'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und18: TQRLabel
        Left = 493
        Top = 283
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          748.770833333333300000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und18'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit18: TQRLabel
        Left = 529
        Top = 283
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          748.770833333333300000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit18'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib18: TQRLabel
        Left = 599
        Top = 283
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          748.770833333333300000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib18'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem18: TQRLabel
        Left = 650
        Top = 283
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          748.770833333333300000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem18'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item19: TQRLabel
        Left = 7
        Top = 299
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          791.104166666666700000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item19'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo19: TQRLabel
        Left = 41
        Top = 299
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          791.104166666666700000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo19'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao19: TQRLabel
        Left = 141
        Top = 299
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          791.104166666666700000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao19'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde19: TQRLabel
        Left = 453
        Top = 299
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          791.104166666666700000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde19'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und19: TQRLabel
        Left = 493
        Top = 299
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          791.104166666666700000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und19'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit19: TQRLabel
        Left = 529
        Top = 299
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          791.104166666666700000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit19'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib19: TQRLabel
        Left = 599
        Top = 299
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          791.104166666666700000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib19'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem19: TQRLabel
        Left = 650
        Top = 299
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          791.104166666666700000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem19'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item20: TQRLabel
        Left = 7
        Top = 315
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          833.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item20'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo20: TQRLabel
        Left = 41
        Top = 315
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          833.437500000000000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo20'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao20: TQRLabel
        Left = 141
        Top = 315
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          833.437500000000000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao20'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde20: TQRLabel
        Left = 453
        Top = 315
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          833.437500000000000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde20'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und20: TQRLabel
        Left = 493
        Top = 315
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          833.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und20'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit20: TQRLabel
        Left = 529
        Top = 315
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          833.437500000000000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit20'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib20: TQRLabel
        Left = 599
        Top = 315
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          833.437500000000000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib20'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem20: TQRLabel
        Left = 650
        Top = 315
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          833.437500000000000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem20'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item21: TQRLabel
        Left = 7
        Top = 331
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          875.770833333333300000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item21'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo21: TQRLabel
        Left = 41
        Top = 331
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          875.770833333333300000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo21'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao21: TQRLabel
        Left = 141
        Top = 331
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          875.770833333333300000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao21'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde21: TQRLabel
        Left = 453
        Top = 331
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          875.770833333333300000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde21'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und21: TQRLabel
        Left = 493
        Top = 331
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          875.770833333333300000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und21'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit21: TQRLabel
        Left = 529
        Top = 331
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          875.770833333333300000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit21'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib21: TQRLabel
        Left = 599
        Top = 331
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          875.770833333333300000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib21'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem21: TQRLabel
        Left = 650
        Top = 331
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          875.770833333333300000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem21'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item22: TQRLabel
        Left = 7
        Top = 347
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          918.104166666666700000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item22'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo22: TQRLabel
        Left = 41
        Top = 347
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          918.104166666666700000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo22'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao22: TQRLabel
        Left = 141
        Top = 347
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          918.104166666666700000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao22'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde22: TQRLabel
        Left = 453
        Top = 347
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          918.104166666666700000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde22'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und22: TQRLabel
        Left = 493
        Top = 347
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          918.104166666666700000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und22'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit22: TQRLabel
        Left = 529
        Top = 347
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          918.104166666666700000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit22'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib22: TQRLabel
        Left = 599
        Top = 347
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          918.104166666666700000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib22'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem22: TQRLabel
        Left = 650
        Top = 347
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          918.104166666666700000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem22'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item23: TQRLabel
        Left = 7
        Top = 363
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          960.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item23'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo23: TQRLabel
        Left = 41
        Top = 363
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          960.437500000000000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo23'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao23: TQRLabel
        Left = 141
        Top = 363
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          960.437500000000000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao23'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde23: TQRLabel
        Left = 453
        Top = 363
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          960.437500000000000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde23'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und23: TQRLabel
        Left = 493
        Top = 363
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          960.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und23'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit23: TQRLabel
        Left = 529
        Top = 363
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          960.437500000000000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit23'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib23: TQRLabel
        Left = 599
        Top = 363
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          960.437500000000000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib23'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem23: TQRLabel
        Left = 650
        Top = 363
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          960.437500000000000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem23'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item24: TQRLabel
        Left = 7
        Top = 379
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          1002.770833333333000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item24'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo24: TQRLabel
        Left = 41
        Top = 379
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          1002.770833333333000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo24'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao24: TQRLabel
        Left = 141
        Top = 379
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          1002.770833333333000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao24'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde24: TQRLabel
        Left = 453
        Top = 379
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          1002.770833333333000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde24'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und24: TQRLabel
        Left = 493
        Top = 379
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          1002.770833333333000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und24'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit24: TQRLabel
        Left = 529
        Top = 379
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          1002.770833333333000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit24'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib24: TQRLabel
        Left = 599
        Top = 379
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          1002.770833333333000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib24'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem24: TQRLabel
        Left = 650
        Top = 379
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          1002.770833333333000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem24'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item25: TQRLabel
        Left = 7
        Top = 395
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          1045.104166666667000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item25'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo25: TQRLabel
        Left = 41
        Top = 395
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          1045.104166666667000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo25'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao25: TQRLabel
        Left = 141
        Top = 395
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          1045.104166666667000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao25'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde25: TQRLabel
        Left = 453
        Top = 395
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          1045.104166666667000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde25'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und25: TQRLabel
        Left = 493
        Top = 395
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          1045.104166666667000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und25'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit25: TQRLabel
        Left = 529
        Top = 395
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          1045.104166666667000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit25'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib25: TQRLabel
        Left = 599
        Top = 395
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          1045.104166666667000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib25'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem25: TQRLabel
        Left = 650
        Top = 395
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          1045.104166666667000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem25'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item26: TQRLabel
        Left = 7
        Top = 411
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          1087.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item26'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo26: TQRLabel
        Left = 41
        Top = 411
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          1087.437500000000000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo26'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao26: TQRLabel
        Left = 141
        Top = 411
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          1087.437500000000000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao26'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde26: TQRLabel
        Left = 453
        Top = 411
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          1087.437500000000000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde26'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und26: TQRLabel
        Left = 493
        Top = 411
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          1087.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und26'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit26: TQRLabel
        Left = 529
        Top = 411
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          1087.437500000000000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit26'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib26: TQRLabel
        Left = 599
        Top = 411
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          1087.437500000000000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib26'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem26: TQRLabel
        Left = 650
        Top = 411
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          1087.437500000000000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem26'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item27: TQRLabel
        Left = 7
        Top = 427
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          1129.770833333333000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item27'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo27: TQRLabel
        Left = 41
        Top = 427
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          1129.770833333333000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo27'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao27: TQRLabel
        Left = 141
        Top = 427
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          1129.770833333333000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao27'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde27: TQRLabel
        Left = 453
        Top = 427
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          1129.770833333333000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde27'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und27: TQRLabel
        Left = 493
        Top = 427
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          1129.770833333333000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und27'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit27: TQRLabel
        Left = 529
        Top = 427
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          1129.770833333333000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit27'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib27: TQRLabel
        Left = 599
        Top = 427
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          1129.770833333333000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib27'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem27: TQRLabel
        Left = 650
        Top = 427
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          1129.770833333333000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem27'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item28: TQRLabel
        Left = 7
        Top = 443
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          1172.104166666667000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item28'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo28: TQRLabel
        Left = 41
        Top = 443
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          1172.104166666667000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo28'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao28: TQRLabel
        Left = 141
        Top = 443
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          1172.104166666667000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao28'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde28: TQRLabel
        Left = 453
        Top = 443
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          1172.104166666667000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde28'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und28: TQRLabel
        Left = 493
        Top = 443
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          1172.104166666667000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und28'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit28: TQRLabel
        Left = 529
        Top = 443
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          1172.104166666667000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit28'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib28: TQRLabel
        Left = 599
        Top = 443
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          1172.104166666667000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib28'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem28: TQRLabel
        Left = 650
        Top = 443
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          1172.104166666667000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem28'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item29: TQRLabel
        Left = 7
        Top = 459
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          1214.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item29'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo29: TQRLabel
        Left = 41
        Top = 459
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          1214.437500000000000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo29'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao29: TQRLabel
        Left = 141
        Top = 459
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          1214.437500000000000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao29'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde29: TQRLabel
        Left = 453
        Top = 459
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          1214.437500000000000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde29'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und29: TQRLabel
        Left = 493
        Top = 459
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          1214.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und29'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit29: TQRLabel
        Left = 529
        Top = 459
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          1214.437500000000000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit29'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib29: TQRLabel
        Left = 599
        Top = 459
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          1214.437500000000000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib29'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem29: TQRLabel
        Left = 650
        Top = 459
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          1214.437500000000000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem29'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item30: TQRLabel
        Left = 7
        Top = 475
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          1256.770833333333000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item30'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo30: TQRLabel
        Left = 41
        Top = 475
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          1256.770833333333000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo30'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao30: TQRLabel
        Left = 141
        Top = 475
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          1256.770833333333000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao30'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde30: TQRLabel
        Left = 453
        Top = 475
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          1256.770833333333000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde30'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und30: TQRLabel
        Left = 493
        Top = 475
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          1256.770833333333000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und30'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit30: TQRLabel
        Left = 529
        Top = 475
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          1256.770833333333000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit30'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib30: TQRLabel
        Left = 599
        Top = 475
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          1256.770833333333000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib30'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem30: TQRLabel
        Left = 650
        Top = 475
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          1256.770833333333000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem30'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item31: TQRLabel
        Left = 7
        Top = 491
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          1299.104166666667000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item31'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo31: TQRLabel
        Left = 41
        Top = 491
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          1299.104166666667000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo31'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao31: TQRLabel
        Left = 141
        Top = 491
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          1299.104166666667000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao31'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde31: TQRLabel
        Left = 453
        Top = 491
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          1299.104166666667000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde31'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und31: TQRLabel
        Left = 493
        Top = 491
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          1299.104166666667000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und31'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit31: TQRLabel
        Left = 529
        Top = 491
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          1299.104166666667000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit31'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib31: TQRLabel
        Left = 599
        Top = 491
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          1299.104166666667000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib31'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem31: TQRLabel
        Left = 650
        Top = 491
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          1299.104166666667000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem31'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item32: TQRLabel
        Left = 7
        Top = 507
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          1341.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item32'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo32: TQRLabel
        Left = 41
        Top = 507
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          1341.437500000000000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo32'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao32: TQRLabel
        Left = 141
        Top = 507
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          1341.437500000000000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao32'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde32: TQRLabel
        Left = 453
        Top = 507
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          1341.437500000000000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde32'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und32: TQRLabel
        Left = 493
        Top = 507
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          1341.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und32'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit32: TQRLabel
        Left = 529
        Top = 507
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          1341.437500000000000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit32'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib32: TQRLabel
        Left = 599
        Top = 507
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          1341.437500000000000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib32'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem32: TQRLabel
        Left = 650
        Top = 507
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          1341.437500000000000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem32'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item33: TQRLabel
        Left = 7
        Top = 523
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          1383.770833333333000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item33'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo33: TQRLabel
        Left = 41
        Top = 523
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          1383.770833333333000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo33'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao33: TQRLabel
        Left = 141
        Top = 523
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          1383.770833333333000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao33'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde33: TQRLabel
        Left = 453
        Top = 523
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          1383.770833333333000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde33'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und33: TQRLabel
        Left = 493
        Top = 523
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          1383.770833333333000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und33'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit33: TQRLabel
        Left = 529
        Top = 523
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          1383.770833333333000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit33'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib33: TQRLabel
        Left = 599
        Top = 523
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          1383.770833333333000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib33'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem33: TQRLabel
        Left = 650
        Top = 523
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          1383.770833333333000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem33'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item34: TQRLabel
        Left = 7
        Top = 539
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          1426.104166666667000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item34'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo34: TQRLabel
        Left = 41
        Top = 539
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          1426.104166666667000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo34'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao34: TQRLabel
        Left = 141
        Top = 539
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          1426.104166666667000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao34'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde34: TQRLabel
        Left = 453
        Top = 539
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          1426.104166666667000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde34'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und34: TQRLabel
        Left = 493
        Top = 539
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          1426.104166666667000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und34'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit34: TQRLabel
        Left = 529
        Top = 539
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          1426.104166666667000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit34'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib34: TQRLabel
        Left = 599
        Top = 539
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          1426.104166666667000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib34'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem34: TQRLabel
        Left = 650
        Top = 539
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          1426.104166666667000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem34'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item35: TQRLabel
        Left = 7
        Top = 555
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          1468.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item35'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo35: TQRLabel
        Left = 41
        Top = 555
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          1468.437500000000000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo35'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao35: TQRLabel
        Left = 141
        Top = 555
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          1468.437500000000000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao35'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde35: TQRLabel
        Left = 453
        Top = 555
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          1468.437500000000000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde35'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und35: TQRLabel
        Left = 493
        Top = 555
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          1468.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und35'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit35: TQRLabel
        Left = 529
        Top = 555
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          1468.437500000000000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit35'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib35: TQRLabel
        Left = 599
        Top = 555
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          1468.437500000000000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib35'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem35: TQRLabel
        Left = 650
        Top = 555
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          1468.437500000000000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem35'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item36: TQRLabel
        Left = 7
        Top = 571
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          1510.770833333333000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item36'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo36: TQRLabel
        Left = 41
        Top = 571
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          1510.770833333333000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo36'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao36: TQRLabel
        Left = 141
        Top = 571
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          1510.770833333333000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao36'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde36: TQRLabel
        Left = 453
        Top = 571
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          1510.770833333333000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde36'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und36: TQRLabel
        Left = 493
        Top = 571
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          1510.770833333333000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und36'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit36: TQRLabel
        Left = 529
        Top = 571
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          1510.770833333333000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit36'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib36: TQRLabel
        Left = 599
        Top = 571
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          1510.770833333333000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib36'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem36: TQRLabel
        Left = 650
        Top = 571
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          1510.770833333333000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem36'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item37: TQRLabel
        Left = 7
        Top = 587
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          1553.104166666667000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item37'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo37: TQRLabel
        Left = 41
        Top = 587
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          1553.104166666667000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo37'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao37: TQRLabel
        Left = 141
        Top = 587
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          1553.104166666667000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao37'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde37: TQRLabel
        Left = 453
        Top = 587
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          1553.104166666667000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde37'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und37: TQRLabel
        Left = 493
        Top = 587
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          1553.104166666667000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und37'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit37: TQRLabel
        Left = 529
        Top = 587
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          1553.104166666667000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit37'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib37: TQRLabel
        Left = 599
        Top = 587
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          1553.104166666667000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib37'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem37: TQRLabel
        Left = 650
        Top = 587
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          1553.104166666667000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem37'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item38: TQRLabel
        Left = 7
        Top = 603
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          1595.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item38'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo38: TQRLabel
        Left = 41
        Top = 603
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          1595.437500000000000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo38'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao38: TQRLabel
        Left = 141
        Top = 603
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          1595.437500000000000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao38'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde38: TQRLabel
        Left = 453
        Top = 603
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          1595.437500000000000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde38'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und38: TQRLabel
        Left = 493
        Top = 603
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          1595.437500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und38'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit38: TQRLabel
        Left = 529
        Top = 603
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          1595.437500000000000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit38'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib38: TQRLabel
        Left = 599
        Top = 603
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          1595.437500000000000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib38'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem38: TQRLabel
        Left = 650
        Top = 603
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          1595.437500000000000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem38'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item39: TQRLabel
        Left = 7
        Top = 619
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          1637.770833333333000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item39'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo39: TQRLabel
        Left = 41
        Top = 619
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          1637.770833333333000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo39'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao39: TQRLabel
        Left = 141
        Top = 619
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          1637.770833333333000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao39'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde39: TQRLabel
        Left = 453
        Top = 619
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          1637.770833333333000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde39'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und39: TQRLabel
        Left = 493
        Top = 619
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          1637.770833333333000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und39'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit39: TQRLabel
        Left = 529
        Top = 619
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          1637.770833333333000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit39'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib39: TQRLabel
        Left = 599
        Top = 619
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          1637.770833333333000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib39'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem39: TQRLabel
        Left = 650
        Top = 619
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          1637.770833333333000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem39'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Item40: TQRLabel
        Left = 7
        Top = 635
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          1680.104166666667000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Item40'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Codigo40: TQRLabel
        Left = 41
        Top = 635
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          108.479166666666700000
          1680.104166666667000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Codigo40'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Descricao40: TQRLabel
        Left = 141
        Top = 635
        Width = 308
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          373.062500000000000000
          1680.104166666667000000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Descricao40'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Qtde40: TQRLabel
        Left = 453
        Top = 635
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1198.562500000000000000
          1680.104166666667000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtde40'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Und40: TQRLabel
        Left = 493
        Top = 635
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1304.395833333333000000
          1680.104166666667000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Und40'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VUnit40: TQRLabel
        Left = 529
        Top = 635
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          1680.104166666667000000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VUnit40'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VTrib40: TQRLabel
        Left = 599
        Top = 635
        Width = 42
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1584.854166666667000000
          1680.104166666667000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VTrib40'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object VItem40: TQRLabel
        Left = 650
        Top = 635
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1719.791666666667000000
          1680.104166666667000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VItem40'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object Rodape: TQRBand
      Left = 38
      Top = 869
      Width = 718
      Height = 216
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        571.500000000000000000
        1899.708333333333000000)
      BandType = rbPageFooter
      object QR_LBL_CFe_vMP: TQRLabel
        Left = 583
        Top = 3
        Width = 55
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1542.520833333333000000
          7.937500000000000000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total (R$):'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_LBL_CFe_cMP: TQRLabel
        Left = 282
        Top = 3
        Width = 90
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          746.125000000000000000
          7.937500000000000000
          238.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Forma de Pagto:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_vMP: TQRLabel
        Left = 641
        Top = 3
        Width = 72
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1695.979166666667000000
          7.937500000000000000
          190.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QR_CFe_vMP'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_cMP: TQRLabel
        Left = 375
        Top = 3
        Width = 202
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          992.187500000000000000
          7.937500000000000000
          534.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QR_CFe_cMP'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_infCpl: TQRLabel
        Left = 2
        Top = 36
        Width = 710
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          95.250000000000000000
          1878.541666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QR_CFe_infCpl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QR_LBL_CFe_infCpl: TQRLabel
        Left = 2
        Top = 19
        Width = 166
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          50.270833333333330000
          439.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Observa'#231#245'es do Contribuinte:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_LBL_CFe_nserieSAT: TQRLabel
        Left = 2
        Top = 3
        Width = 51
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          7.937500000000000000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SAT Nro.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_nserieSAT: TQRLabel
        Left = 56
        Top = 3
        Width = 60
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          148.166666666666700000
          7.937500000000000000
          158.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QR_CFe_nserieSAT'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_dEmi: TQRLabel
        Left = 145
        Top = 3
        Width = 58
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          383.645833333333300000
          7.937500000000000000
          153.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QR_CFe_dEmi'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_hEmi: TQRLabel
        Left = 206
        Top = 3
        Width = 47
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          545.041666666666700000
          7.937500000000000000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QR_CFe_hEmi'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_LBL_CFe_Chave_Acesso: TQRLabel
        Left = 153
        Top = 51
        Width = 141
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          404.812500000000000000
          134.937500000000000000
          373.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Chave de Acesso do CFe:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_Chave_Acesso: TQRLabel
        Left = 297
        Top = 51
        Width = 268
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          785.812500000000000000
          134.937500000000000000
          709.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QR_CFe_Chave_Acesso'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_Codigo_Barras: TQRLabel
        Left = 103
        Top = 66
        Width = 512
        Height = 36
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          95.250000000000000000
          272.520833333333300000
          174.625000000000000000
          1354.666666666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QR_CFe_Codigo_Barras'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -35
        Font.Name = 'Code 128'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 26
      end
      object QR_CFe_App: TQRLabel
        Left = 199
        Top = 197
        Width = 319
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          526.520833333333300000
          521.229166666666700000
          844.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Consulte o QRCode deste extrato atrav'#233's do App: DeOlhoNaNota'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QR_CFe_QRCode: TQRImage
        Left = 314
        Top = 105
        Width = 90
        Height = 90
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          238.125000000000000000
          830.791666666666700000
          277.812500000000000000
          238.125000000000000000)
        Stretch = True
      end
    end
  end
end
