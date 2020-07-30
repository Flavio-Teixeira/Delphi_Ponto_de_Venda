unit Valor_Venda_Diaria_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TValorVendaDiaria00 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    BT_Alterar: TBitBtn;
    BT_Sair: TBitBtn;
    Label4: TLabel;
    Vlr_Venda_Diaria: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure Vlr_Venda_DiariaKeyPress(Sender: TObject; var Key: Char);
    procedure BT_AlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ValorVendaDiaria00: TValorVendaDiaria00;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TValorVendaDiaria00.BT_SairClick(Sender: TObject);
begin
     ValorVendaDiaria00.Close;
end;

procedure TValorVendaDiaria00.Vlr_Venda_DiariaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
      End
    Else
      Begin
      So_Valor(Sender,Key);
    End;
end;

procedure TValorVendaDiaria00.BT_AlterarClick(Sender: TObject);

var
   Str_Valor: String;

begin
     Str_Valor := Vlr_Venda_Diaria.Text;

     If Trim(Str_Valor) = '' Then
        Begin
        Str_Valor := '0';
     End;

     ConexaoBD.SQL_Comunitario.Close;
     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add('Select * From Valor_Venda_Diaria');
     ConexaoBD.SQL_Comunitario.Open;

     If ConexaoBD.SQL_Comunitario.RecordCount > 0 Then
        Begin
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Update Valor_Venda_Diaria Set Valor_Venda_Diaria_Vlr = ' + Virgula_Ponto(Str_Valor) );
        ConexaoBD.SQL_Comunitario.ExecSQL;
        End
     Else
        Begin
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Insert into Valor_Venda_Diaria(Valor_Venda_Diaria_Vlr) Values(' + Virgula_Ponto(Str_Valor) + ')');
        ConexaoBD.SQL_Comunitario.ExecSQL;
     End;

     MSG_Erro('Alteração efetuada com sucesso...');

     ValorVendaDiaria00.Close;
end;

procedure TValorVendaDiaria00.FormShow(Sender: TObject);
begin
     ConexaoBD.SQL_Comunitario.Close;
     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add('Select * From Valor_Venda_Diaria');
     ConexaoBD.SQL_Comunitario.Open;

     If ConexaoBD.SQL_Comunitario.RecordCount > 0 Then
        Begin
        Vlr_Venda_Diaria.Text := FormatFloat('0.00', ConexaoBD.SQL_Comunitario.FieldValues['Valor_Venda_Diaria_Vlr']);
        End
     Else
        Begin
        Vlr_Venda_Diaria.Text := '0,00';
     End;
end;

end.
