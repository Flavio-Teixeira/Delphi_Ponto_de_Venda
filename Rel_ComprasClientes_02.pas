unit Rel_ComprasClientes_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TRel_ComprasClientes02 = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rel_ComprasClientes02: TRel_ComprasClientes02;

implementation

uses Conexao_BD, Rel_ComprasClientes_00;

{$R *.dfm}

end.
