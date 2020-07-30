unit Informacao_Maquinas_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TInformacao_Maquinas01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel4: TPanel;
    Dados_Cadatrais: TGroupBox;
    lbldescricao: TLabel;
    EditDescricao: TEdit;
    EditHD: TEdit;
    lblHD: TLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure EditHDKeyPress(Sender: TObject; var Key: Char);
    procedure EditDescricaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Informacao_Maquinas01: TInformacao_Maquinas01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TInformacao_Maquinas01.BT_SairClick(Sender: TObject);
begin
    Informacao_Maquinas01.Close;
end;

procedure TInformacao_Maquinas01.BT_IncluirClick(Sender: TObject);
begin

  Ampulheta();

    If Trim(EditHD.Text)='' then
      Begin
      MSG_Erro('Antes de prosseguir preencha o campo Nro. HD ...');
      EditHD.SetFocus;
      End
    Else If Trim(EditDescricao.Text)='' then
      Begin
      MSG_Erro('Antes de prosseguir preencha o campo Descrição...');
      EditDescricao.SetFocus;
      End
    Else
      Begin
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Insert into Informacao_Maquinas(Informacao_Maquina_HD,Informacao_Maquina_Descricao) Values("' + Texto_Grava(EditHD.Text) + '","' + Texto_Grava(EditDescricao.Text) + '")');
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão efetuada com sucesso...');

        If Confirma('Deseja incluir outra Máquina?') = 6 Then
          Begin
            EditHD.Text         := '';
            EditDescricao.Text  := '';
            EditHD.SetFocus;
          End
        Else
          Begin
            Informacao_Maquinas01.Close;
        End;
    End;

  Seta();

end;

procedure TInformacao_Maquinas01.EditHDKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TInformacao_Maquinas01.EditDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

end.
