unit Registra_PDVTEX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TRegistraPDVTEX = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    Label9: TLabel;
    BT_Registrar: TBitBtn;
    Registro: TEdit;
    Licenca_1: TEdit;
    procedure Licenca_1KeyPress(Sender: TObject; var Key: Char);
    procedure BT_RegistrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegistraPDVTEX: TRegistraPDVTEX;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TRegistraPDVTEX.Licenca_1KeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRegistraPDVTEX.BT_RegistrarClick(Sender: TObject);

var
   Registra_Licenca: String;

begin
     Registra_Licenca := Trim(Licenca_1.Text);

{*** Prepara a Conexão com as Tabelas e Querys ***}

     ConexaoBD.Conexao_Principal.Connected := False;
     ConexaoBD.Conexao_Principal.Connected := True;

{*** Carrega a Connexão da Estação Local ***}
     conexaoBD.SQL_Comunitario.Close;
     conexaoBD.SQL_Comunitario.SQL.Clear;
     conexaoBD.SQL_Comunitario.SQL.Add('Insert into Conexao(Conexao_registro) values('+#39+Trim(Registra_Licenca)+#39+')');
     conexaoBD.SQL_Comunitario.ExecSQL;

{*** Fecha as Conexões das Querys com o Access ***}

     ConexaoBD.Conexao_Principal.Connected := False;

     RegistraPDVTEX.Close;
end;

end.
