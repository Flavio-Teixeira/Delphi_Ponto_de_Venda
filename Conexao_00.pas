unit Conexao_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TConexao00 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    conexao_caminho: TEdit;
    BT_Gravar: TButton;
    BT_Cancelar: TButton;
    procedure BT_CancelarClick(Sender: TObject);
    procedure BT_GravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Conexao00: TConexao00;

implementation

uses Rotinas_Gerais, Conexao_BD;

{$R *.dfm}

procedure TConexao00.BT_CancelarClick(Sender: TObject);
begin
    Conexao00.Close;
end;

procedure TConexao00.BT_GravarClick(Sender: TObject);
begin
     If Trim(conexao_caminho.Text) <> '' Then
        Begin
        Fecha_Tudo();

        ConexaoBD.Conexao_Principal.Connected := False;
        ConexaoBD.Conexao_Principal.Connected := True;

        conexaoBD.SQL_Conexao.Close;
        conexaoBD.SQL_Conexao.SQL.Clear;
        conexaoBD.SQL_Conexao.SQL.Add('update Conexao Set Conexao_caminho = "'+Trim(conexao_caminho.Text)+'"');
        conexaoBD.SQL_Conexao.ExecSQL;

        Conexao00.Close;
     End;
end;

end.
