unit Cancela_Item_Login_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TCancelaItemLogin00 = class(TForm)
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
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Login_OKClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Verifica_Senha();

  public
    { Public declarations }
  end;

var
  CancelaItemLogin00: TCancelaItemLogin00;
  Contador  : Integer;

implementation

uses Conexao_BD, Rotinas_Gerais, Apaga_Item_00;

{$R *.dfm}

procedure TCancelaItemLogin00.Login_NomeKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #27 Then
        Begin
        CancelaItemLogin00.Close;
     End;

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCancelaItemLogin00.Login_SenhaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #27 Then
        Begin
        CancelaItemLogin00.Close;
     End;

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCancelaItemLogin00.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #27 Then
        Begin
        CancelaItemLogin00.Close;
     End;

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TCancelaItemLogin00.Login_OKClick(Sender: TObject);
begin
     Verifica_Senha();
end;

Procedure TCancelaItemLogin00.Verifica_Senha();
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
           CancelaItemLogin00.Close;
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
              CancelaItemLogin00.Close;
           End;

           Login_Senha.SetFocus;
           Exit;

        End;

        If Trim(Fiscal) <> 'S' Then
          Begin
            Login_Mensagem.Caption:='Opção permitida somente ao Fiscal ...';

            Contador := Contador + 1;

            If Contador = 4 Then
              Begin
                CancelaItemLogin00.Close;
            End;

            Login_Nome.SetFocus;
            Exit;
          End
        Else
          Begin
          ApagaItem00.Campo_Retorno.Text := 'Permitido';
        End;
     End;
     CancelaItemLogin00.Close;
End;

end.
