unit Rel_Lucratividade_D03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids;

type
  TRelLucratividadeD03 = class(TForm)
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
  RelLucratividadeD03: TRelLucratividadeD03;

implementation

uses Rel_Lucratividade_D00, Rel_Lucratividade_D01, Rel_Lucratividade_D02,
  Principal_00;

{$R *.dfm}

procedure TRelLucratividadeD03.BT_SairClick(Sender: TObject);
begin
     RelLucratividadeD03.Close;
end;

procedure TRelLucratividadeD03.BT_ImprimirClick(Sender: TObject);
begin
     BT_Imprimir.Enabled := False;
     BT_Sair.Enabled     := False;

     If RelLucratividadeD00.Opcao_Grupo.Checked Then
        Begin
        Application.CreateForm(TRelLucratividadeD02,RelLucratividadeD02);

        RelLucratividadeD02.QRL_Periodo.Caption := 'Período: ' + Trim(RelLucratividadeD00.Rel_Periodo_Inicial.Text) + ' Até ' + Trim(RelLucratividadeD00.Rel_Periodo_Final.Text) + '          Ordenado por: ' + Trim(RelLucratividadeD00.CB_Ordenar.Text) + '          Máquina: ' + Trim(RelLucratividadeD00.Maquinas.Text);

        RelLucratividadeD02.QR_Lucratividade.PreviewModal;
        RelLucratividadeD02.QR_Lucratividade.Destroy;
        RelLucratividadeD02.Destroy;
        End
     Else
        Begin
        Application.CreateForm(TRelLucratividadeD01,RelLucratividadeD01);

        RelLucratividadeD01.QRL_Periodo.Caption := 'Período: ' + Trim(RelLucratividadeD00.Rel_Periodo_Inicial.Text) + ' Até ' + Trim(RelLucratividadeD00.Rel_Periodo_Final.Text) + '          Ordenado por: ' + Trim(RelLucratividadeD00.CB_Ordenar.Text) + '          Máquina: ' + Trim(RelLucratividadeD00.Maquinas.Text);

        RelLucratividadeD01.QR_Lucratividade.PreviewModal;
        RelLucratividadeD01.QR_Lucratividade.Destroy;
        RelLucratividadeD01.Destroy;
     End;

     BT_Imprimir.Enabled := True;
     BT_Sair.Enabled     := True;
end;

procedure TRelLucratividadeD03.FormShow(Sender: TObject);
begin
     If (Trim(Principal.Edit_Cor_Grid.Text) <> '') And (Trim(Principal.Edit_Cor_Letra.Text) <> '') Then
        Begin
        Resultado_Lucratividade.Color      := StringToColor(Principal.Edit_Cor_Grid.Text);
        Resultado_Lucratividade.Font.Color := StringToColor(Principal.Edit_Cor_Letra.Text);
     End;

     Resultado_Lucratividade.SetFocus;
end;

end.
