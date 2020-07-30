unit Rel_ComprasClientes_03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TRel_ComprasClientes03 = class(TForm)
    QR_RegistroCaixa: TQuickRep;
    Cabecalho: TQRBand;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    Titulo_Rel_Produtos: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    PageFooterBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel4: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel5: TQRLabel;
    QRExpr6: TQRExpr;
    QRLabel6: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRLabel7: TQRLabel;
    QRExpr12: TQRExpr;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRLabel21: TQRLabel;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRLabel27: TQRLabel;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rel_ComprasClientes03: TRel_ComprasClientes03;

implementation

uses Conexao_BD, Rel_ComprasClientes_00;

{$R *.dfm}

end.
