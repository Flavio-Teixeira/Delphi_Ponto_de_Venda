unit Rel_RegistroCaixa_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TRel_RegistroCaixa01 = class(TForm)
    QR_RegistroCaixa: TQuickRep;
    Cabecalho: TQRBand;
    QRSysData3: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel14: TQRLabel;
    QRL_DataFinal: TQRLabel;
    QRL_DataInicial: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText2: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rel_RegistroCaixa01: TRel_RegistroCaixa01;

implementation

uses Conexao_BD, Rel_RegistroCaixa_00;

{$R *.dfm}

procedure TRel_RegistroCaixa01.FormCreate(Sender: TObject);
begin
    QRL_DataInicial.Caption := Rel_RegistroCaixa00.Rel_Periodo_Inicial.Text;
    QRL_DataFinal.Caption   := Rel_RegistroCaixa00.Rel_Periodo_Final.Text;
end;

end.
