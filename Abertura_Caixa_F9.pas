unit Abertura_Caixa_F9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TAbertura_CaixaF9 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Login_Mensagem: TLabel;
    Login_Senha: TEdit;
    Login_Nome: TEdit;
    Login_OK: TButton;
    procedure Login_NomeKeyPress(Sender: TObject; var Key: Char);
    procedure Login_SenhaKeyPress(Sender: TObject; var Key: Char);
    procedure Login_OKKeyPress(Sender: TObject; var Key: Char);
    procedure Login_OKClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    Procedure Verifica_Senha();

  public
    { Public declarations }
    
  end;

var
  Abertura_CaixaF9: TAbertura_CaixaF9;
  Contador        : Integer;

implementation

uses Conexao_BD, Conexao_00, Rotinas_Gerais;

{$R *.dfm}

Procedure TAbertura_CaixaF9.Verifica_Senha();
Var
   ValorSenha : String;
   Fiscal     : String;

Begin
     //*** Verifica se o Usuário Existe ***
     ConexaoBD.SQl_Usuarios.Close;
     ConexaoBD.SQl_Usuarios.SQL.Clear;
     ConexaoBD.SQl_Usuarios.SQL.Add('Select * from Usuarios Where Usuario_Nome="'+Trim(Login_Nome.Text)+'"');
     ConexaoBD.SQl_Usuarios.Open;

     If ConexaoBD.SQl_Usuarios.RecordCount <= 0 Then
        Begin

        Login_Mensagem.Caption:='Login Recusado, Usuário Desconhecido...';

        Contador := Contador + 1;

        If Contador = 4 Then
           Begin
           Abertura_CaixaF9.Close;
        End;

        Login_Nome.SetFocus;
        Exit;

        End
     Else
        Begin

        ValorSenha := ConexaoBD.SQl_UsuariosUsuario_Senha.AsString;
        Fiscal     := ConexaoBD.SQl_UsuariosUsuario_Fiscal.AsString;

        If ValorSenha <> Login_Senha.Text Then
           Begin

           Login_Mensagem.Caption:='Login Recusado, Senha Inválida...';

           Contador := Contador + 1;

           If Contador = 4 Then
            Begin
              Abertura_CaixaF9.Close;
           End;

           Login_Senha.SetFocus;
           Exit;

        End;

        Movto_Registro_Caixa('F9-Abertura');

     End;
     Abertura_CaixaF9.Close;

End;

procedure TAbertura_CaixaF9.Login_NomeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #27 Then
        Begin
        Abertura_CaixaF9.Close;
     End;

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAbertura_CaixaF9.Login_SenhaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #27 Then
        Begin
        Abertura_CaixaF9.Close;
     End;

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TAbertura_CaixaF9.Login_OKKeyPress(Sender: TObject;
  var Key: Char);
begin
    Verifica_Senha();
end;

procedure TAbertura_CaixaF9.Login_OKClick(Sender: TObject);
begin
    Verifica_Senha();
end;

procedure TAbertura_CaixaF9.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #27 Then
        Begin
        Abertura_CaixaF9.Close;
     End;
end;

end.
