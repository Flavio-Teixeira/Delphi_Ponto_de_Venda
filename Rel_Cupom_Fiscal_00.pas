unit Rel_Cupom_Fiscal_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, jpeg;

type
  TRelCupomFiscal00 = class(TForm)
    QR_CupomFiscal: TQuickRep;
    Cabecalho: TQRBand;
    Detalhe: TQRBand;
    Rodape: TQRBand;
    QR_CFe_Nome_Fantasia: TQRLabel;
    QR_CFe_Razao_Social: TQRLabel;
    QR_CFe_Logradouro: TQRLabel;
    QR_CFe_Cidade: TQRLabel;
    QR_CFe_CNPJ: TQRLabel;
    QR_CFe_IE: TQRLabel;
    QR_CFe_LBL_CNPJ: TQRLabel;
    QR_CFe_LBL_IE: TQRLabel;
    QR_CFe_Cupom: TQRLabel;
    QR_CFe_Extrato: TQRLabel;
    QR_CFe_Nro_Cupom: TQRLabel;
    QR_CFe_Consumidor: TQRLabel;
    QR_CFe_Consumidor_CNPJ_CPF: TQRLabel;
    QR_CFe_Item: TQRLabel;
    QR_CFe_Codigo: TQRLabel;
    QR_CFe_Descricao: TQRLabel;
    QR_CFe_Qtde: TQRLabel;
    QR_CFe_Unidade: TQRLabel;
    QR_CFe_Vlr_Unitario: TQRLabel;
    QR_CFe_Tributos: TQRLabel;
    QR_CFe_Vlr_Item: TQRLabel;
    Item1: TQRLabel;
    Codigo1: TQRLabel;
    Descricao1: TQRLabel;
    Qtde1: TQRLabel;
    Und1: TQRLabel;
    VUnit1: TQRLabel;
    VTrib1: TQRLabel;
    VItem1: TQRLabel;
    Item2: TQRLabel;
    Codigo2: TQRLabel;
    Descricao2: TQRLabel;
    Qtde2: TQRLabel;
    Und2: TQRLabel;
    VUnit2: TQRLabel;
    VTrib2: TQRLabel;
    VItem2: TQRLabel;
    Item3: TQRLabel;
    Codigo3: TQRLabel;
    Descricao3: TQRLabel;
    Qtde3: TQRLabel;
    Und3: TQRLabel;
    VUnit3: TQRLabel;
    VTrib3: TQRLabel;
    VItem3: TQRLabel;
    Item4: TQRLabel;
    Codigo4: TQRLabel;
    Descricao4: TQRLabel;
    Qtde4: TQRLabel;
    Und4: TQRLabel;
    VUnit4: TQRLabel;
    VTrib4: TQRLabel;
    VItem4: TQRLabel;
    Item5: TQRLabel;
    Codigo5: TQRLabel;
    Descricao5: TQRLabel;
    Qtde5: TQRLabel;
    Und5: TQRLabel;
    VUnit5: TQRLabel;
    VTrib5: TQRLabel;
    VItem5: TQRLabel;
    Item6: TQRLabel;
    Codigo6: TQRLabel;
    Descricao6: TQRLabel;
    Qtde6: TQRLabel;
    Und6: TQRLabel;
    VUnit6: TQRLabel;
    VTrib6: TQRLabel;
    VItem6: TQRLabel;
    Item7: TQRLabel;
    Codigo7: TQRLabel;
    Descricao7: TQRLabel;
    Qtde7: TQRLabel;
    Und7: TQRLabel;
    VUnit7: TQRLabel;
    VTrib7: TQRLabel;
    VItem7: TQRLabel;
    Item8: TQRLabel;
    Codigo8: TQRLabel;
    Descricao8: TQRLabel;
    Qtde8: TQRLabel;
    Und8: TQRLabel;
    VUnit8: TQRLabel;
    VTrib8: TQRLabel;
    VItem8: TQRLabel;
    Item9: TQRLabel;
    Codigo9: TQRLabel;
    Descricao9: TQRLabel;
    Qtde9: TQRLabel;
    Und9: TQRLabel;
    VUnit9: TQRLabel;
    VTrib9: TQRLabel;
    VItem9: TQRLabel;
    Item10: TQRLabel;
    Codigo10: TQRLabel;
    Descricao10: TQRLabel;
    Qtde10: TQRLabel;
    Und10: TQRLabel;
    VUnit10: TQRLabel;
    VTrib10: TQRLabel;
    VItem10: TQRLabel;
    Item11: TQRLabel;
    Codigo11: TQRLabel;
    Descricao11: TQRLabel;
    Qtde11: TQRLabel;
    Und11: TQRLabel;
    VUnit11: TQRLabel;
    VTrib11: TQRLabel;
    VItem11: TQRLabel;
    Item12: TQRLabel;
    Codigo12: TQRLabel;
    Descricao12: TQRLabel;
    Qtde12: TQRLabel;
    Und12: TQRLabel;
    VUnit12: TQRLabel;
    VTrib12: TQRLabel;
    VItem12: TQRLabel;
    Item13: TQRLabel;
    Codigo13: TQRLabel;
    Descricao13: TQRLabel;
    Qtde13: TQRLabel;
    Und13: TQRLabel;
    VUnit13: TQRLabel;
    VTrib13: TQRLabel;
    VItem13: TQRLabel;
    Item14: TQRLabel;
    Codigo14: TQRLabel;
    Descricao14: TQRLabel;
    Qtde14: TQRLabel;
    Und14: TQRLabel;
    VUnit14: TQRLabel;
    VTrib14: TQRLabel;
    VItem14: TQRLabel;
    Item15: TQRLabel;
    Codigo15: TQRLabel;
    Descricao15: TQRLabel;
    Qtde15: TQRLabel;
    Und15: TQRLabel;
    VUnit15: TQRLabel;
    VTrib15: TQRLabel;
    VItem15: TQRLabel;
    Item16: TQRLabel;
    Codigo16: TQRLabel;
    Descricao16: TQRLabel;
    Qtde16: TQRLabel;
    Und16: TQRLabel;
    VUnit16: TQRLabel;
    VTrib16: TQRLabel;
    VItem16: TQRLabel;
    Item17: TQRLabel;
    Codigo17: TQRLabel;
    Descricao17: TQRLabel;
    Qtde17: TQRLabel;
    Und17: TQRLabel;
    VUnit17: TQRLabel;
    VTrib17: TQRLabel;
    VItem17: TQRLabel;
    Item18: TQRLabel;
    Codigo18: TQRLabel;
    Descricao18: TQRLabel;
    Qtde18: TQRLabel;
    Und18: TQRLabel;
    VUnit18: TQRLabel;
    VTrib18: TQRLabel;
    VItem18: TQRLabel;
    Item19: TQRLabel;
    Codigo19: TQRLabel;
    Descricao19: TQRLabel;
    Qtde19: TQRLabel;
    Und19: TQRLabel;
    VUnit19: TQRLabel;
    VTrib19: TQRLabel;
    VItem19: TQRLabel;
    Item20: TQRLabel;
    Codigo20: TQRLabel;
    Descricao20: TQRLabel;
    Qtde20: TQRLabel;
    Und20: TQRLabel;
    VUnit20: TQRLabel;
    VTrib20: TQRLabel;
    VItem20: TQRLabel;
    Item21: TQRLabel;
    Codigo21: TQRLabel;
    Descricao21: TQRLabel;
    Qtde21: TQRLabel;
    Und21: TQRLabel;
    VUnit21: TQRLabel;
    VTrib21: TQRLabel;
    VItem21: TQRLabel;
    Item22: TQRLabel;
    Codigo22: TQRLabel;
    Descricao22: TQRLabel;
    Qtde22: TQRLabel;
    Und22: TQRLabel;
    VUnit22: TQRLabel;
    VTrib22: TQRLabel;
    VItem22: TQRLabel;
    Item23: TQRLabel;
    Codigo23: TQRLabel;
    Descricao23: TQRLabel;
    Qtde23: TQRLabel;
    Und23: TQRLabel;
    VUnit23: TQRLabel;
    VTrib23: TQRLabel;
    VItem23: TQRLabel;
    Item24: TQRLabel;
    Codigo24: TQRLabel;
    Descricao24: TQRLabel;
    Qtde24: TQRLabel;
    Und24: TQRLabel;
    VUnit24: TQRLabel;
    VTrib24: TQRLabel;
    VItem24: TQRLabel;
    Item25: TQRLabel;
    Codigo25: TQRLabel;
    Descricao25: TQRLabel;
    Qtde25: TQRLabel;
    Und25: TQRLabel;
    VUnit25: TQRLabel;
    VTrib25: TQRLabel;
    VItem25: TQRLabel;
    Item26: TQRLabel;
    Codigo26: TQRLabel;
    Descricao26: TQRLabel;
    Qtde26: TQRLabel;
    Und26: TQRLabel;
    VUnit26: TQRLabel;
    VTrib26: TQRLabel;
    VItem26: TQRLabel;
    Item27: TQRLabel;
    Codigo27: TQRLabel;
    Descricao27: TQRLabel;
    Qtde27: TQRLabel;
    Und27: TQRLabel;
    VUnit27: TQRLabel;
    VTrib27: TQRLabel;
    VItem27: TQRLabel;
    Item28: TQRLabel;
    Codigo28: TQRLabel;
    Descricao28: TQRLabel;
    Qtde28: TQRLabel;
    Und28: TQRLabel;
    VUnit28: TQRLabel;
    VTrib28: TQRLabel;
    VItem28: TQRLabel;
    Item29: TQRLabel;
    Codigo29: TQRLabel;
    Descricao29: TQRLabel;
    Qtde29: TQRLabel;
    Und29: TQRLabel;
    VUnit29: TQRLabel;
    VTrib29: TQRLabel;
    VItem29: TQRLabel;
    Item30: TQRLabel;
    Codigo30: TQRLabel;
    Descricao30: TQRLabel;
    Qtde30: TQRLabel;
    Und30: TQRLabel;
    VUnit30: TQRLabel;
    VTrib30: TQRLabel;
    VItem30: TQRLabel;
    Item31: TQRLabel;
    Codigo31: TQRLabel;
    Descricao31: TQRLabel;
    Qtde31: TQRLabel;
    Und31: TQRLabel;
    VUnit31: TQRLabel;
    VTrib31: TQRLabel;
    VItem31: TQRLabel;
    Item32: TQRLabel;
    Codigo32: TQRLabel;
    Descricao32: TQRLabel;
    Qtde32: TQRLabel;
    Und32: TQRLabel;
    VUnit32: TQRLabel;
    VTrib32: TQRLabel;
    VItem32: TQRLabel;
    Item33: TQRLabel;
    Codigo33: TQRLabel;
    Descricao33: TQRLabel;
    Qtde33: TQRLabel;
    Und33: TQRLabel;
    VUnit33: TQRLabel;
    VTrib33: TQRLabel;
    VItem33: TQRLabel;
    Item34: TQRLabel;
    Codigo34: TQRLabel;
    Descricao34: TQRLabel;
    Qtde34: TQRLabel;
    Und34: TQRLabel;
    VUnit34: TQRLabel;
    VTrib34: TQRLabel;
    VItem34: TQRLabel;
    Item35: TQRLabel;
    Codigo35: TQRLabel;
    Descricao35: TQRLabel;
    Qtde35: TQRLabel;
    Und35: TQRLabel;
    VUnit35: TQRLabel;
    VTrib35: TQRLabel;
    VItem35: TQRLabel;
    Item36: TQRLabel;
    Codigo36: TQRLabel;
    Descricao36: TQRLabel;
    Qtde36: TQRLabel;
    Und36: TQRLabel;
    VUnit36: TQRLabel;
    VTrib36: TQRLabel;
    VItem36: TQRLabel;
    Item37: TQRLabel;
    Codigo37: TQRLabel;
    Descricao37: TQRLabel;
    Qtde37: TQRLabel;
    Und37: TQRLabel;
    VUnit37: TQRLabel;
    VTrib37: TQRLabel;
    VItem37: TQRLabel;
    Item38: TQRLabel;
    Codigo38: TQRLabel;
    Descricao38: TQRLabel;
    Qtde38: TQRLabel;
    Und38: TQRLabel;
    VUnit38: TQRLabel;
    VTrib38: TQRLabel;
    VItem38: TQRLabel;
    Item39: TQRLabel;
    Codigo39: TQRLabel;
    Descricao39: TQRLabel;
    Qtde39: TQRLabel;
    Und39: TQRLabel;
    VUnit39: TQRLabel;
    VTrib39: TQRLabel;
    VItem39: TQRLabel;
    Item40: TQRLabel;
    Codigo40: TQRLabel;
    Descricao40: TQRLabel;
    Qtde40: TQRLabel;
    Und40: TQRLabel;
    VUnit40: TQRLabel;
    VTrib40: TQRLabel;
    VItem40: TQRLabel;
    QR_LBL_CFe_vMP: TQRLabel;
    QR_LBL_CFe_cMP: TQRLabel;
    QR_CFe_vMP: TQRLabel;
    QR_CFe_cMP: TQRLabel;
    QR_CFe_infCpl: TQRLabel;
    QR_LBL_CFe_infCpl: TQRLabel;
    QR_LBL_CFe_nserieSAT: TQRLabel;
    QR_CFe_nserieSAT: TQRLabel;
    QR_CFe_dEmi: TQRLabel;
    QR_CFe_hEmi: TQRLabel;
    QR_LBL_CFe_Chave_Acesso: TQRLabel;
    QR_CFe_Chave_Acesso: TQRLabel;
    QR_CFe_Codigo_Barras: TQRLabel;
    QR_CFe_App: TQRLabel;
    QR_CFe_QRCode: TQRImage;
    QR_CFe_Logo: TQRImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelCupomFiscal00: TRelCupomFiscal00;

implementation

uses Conexao_BD;

{$R *.dfm}

end.