unit Usuario_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TUsuario01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    EditNome: TEdit;
    EditSenha: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure EditNomeKeyPress(Sender: TObject; var Key: Char);
    procedure EditSenhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Usuario01: TUsuario01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TUsuario01.BT_SairClick(Sender: TObject);
begin
    Usuario01.Close;
end;

procedure TUsuario01.BT_IncluirClick(Sender: TObject);
begin
  Ampulheta();

    If Trim(EditNome.Text)='' then
      Begin
      MSG_Erro('Antes de prosseguir preencha o campo Nome...');
      EditNome.SetFocus;
      End
    Else If Trim(EditSenha.Text)='' then
      Begin
      MSG_Erro('Antes de prosseguir preencha o campo Senha...');
      EditSenha.SetFocus;
      End
    Else
      Begin

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Insert into Usuarios(Usuario_Nome, Usuario_Senha) Values("' + Trim(EditNome.Text) + '","' + Trim(EditSenha.Text) + '")');
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão efetuada com sucesso...');

        If Confirma('Deseja incluir outro Usuario?') = 6 Then
          Begin
          EditNome.Text   := '';
          EditSenha.Text  := '';
          EditNome.SetFocus;
          End
        Else
          Begin
          Usuario01.Close;
        End;
    End;

  Seta();
end;

procedure TUsuario01.EditNomeKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TUsuario01.EditSenhaKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

end.
