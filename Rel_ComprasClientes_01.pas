unit Rel_ComprasClientes_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TRel_ComprasClientes01 = class(TForm)
    QR_RegistroCaixa: TQuickRep;
    Cabecalho: TQRBand;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel14: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText4: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText2: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel27: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel28: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rel_ComprasClientes01: TRel_ComprasClientes01;

implementation

uses Conexao_BD, Rel_ComprasClientes_00;

{$R *.dfm}

end.
