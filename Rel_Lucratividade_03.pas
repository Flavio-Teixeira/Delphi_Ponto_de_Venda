unit Rel_Lucratividade_03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids;

type
  TRelLucratividade03 = class(TForm)
    pan_Botoes: TPanel;
    BT_Sair: TBitBtn;
    BT_Imprimir: TBitBtn;
    Panel1: TPanel;
    Resultado_Lucratividade: TStringGrid;
    LBL_Rel_Titulo: TLabel;
    LBL_Rel_Periodo: TLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelLucratividade03: TRelLucratividade03;

implementation

uses Rel_Lucratividade_00, Rel_Lucratividade_01, Rel_Lucratividade_02,
  Principal_00;

{$R *.dfm}

procedure TRelLucratividade03.BT_SairClick(Sender: TObject);
begin
     RelLucratividade03.Close;
end;

procedure TRelLucratividade03.BT_ImprimirClick(Sender: TObject);
begin
     BT_Imprimir.Enabled := False;
     BT_Sair.Enabled     := False;

     If RelLucratividade00.Opcao_Grupo.Checked Then
        Begin
        Application.CreateForm(TRelLucratividade02,RelLucratividade02);

        RelLucratividade02.QRL_Periodo.Caption := 'Período: ' + Trim(RelLucratividade00.Rel_Periodo_Inicial.Text) + ' Até ' + Trim(RelLucratividade00.Rel_Periodo_Final.Text) + '          Ordenado por: ' + Trim(RelLucratividade00.CB_Ordenar.Text) + '          Máquina: ' + Trim(RelLucratividade00.Maquinas.Text);

        RelLucratividade02.QR_Lucratividade.PreviewModal;
        RelLucratividade02.QR_Lucratividade.Destroy;
        RelLucratividade02.Destroy;
        End
     Else
        Begin
        Application.CreateForm(TRelLucratividade01,RelLucratividade01);

        RelLucratividade01.QRL_Periodo.Caption := 'Período: ' + Trim(RelLucratividade00.Rel_Periodo_Inicial.Text) + ' Até ' + Trim(RelLucratividade00.Rel_Periodo_Final.Text) + '          Ordenado por: ' + Trim(RelLucratividade00.CB_Ordenar.Text) + '          Máquina: ' + Trim(RelLucratividade00.Maquinas.Text);

        RelLucratividade01.QR_Lucratividade.PreviewModal;
        RelLucratividade01.QR_Lucratividade.Destroy;
        RelLucratividade01.Destroy;
     End;

     BT_Imprimir.Enabled := True;
     BT_Sair.Enabled     := True;
end;

procedure TRelLucratividade03.FormShow(Sender: TObject);
begin
     If (Trim(Principal.Edit_Cor_Grid.Text) <> '') And (Trim(Principal.Edit_Cor_Letra.Text) <> '') Then
        Begin
        Resultado_Lucratividade.Color      := StringToColor(Principal.Edit_Cor_Grid.Text);
        Resultado_Lucratividade.Font.Color := StringToColor(Principal.Edit_Cor_Letra.Text);
     End;

     Resultado_Lucratividade.SetFocus;
end;

end.
