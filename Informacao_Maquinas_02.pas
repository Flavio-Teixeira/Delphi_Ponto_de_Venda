unit Informacao_Maquinas_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TInformacao_Maquinas02 = class(TForm)
    Panel1: TPanel;
    BT_Alterar: TBitBtn;
    BT_Excluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel4: TPanel;
    Dados_Cadatrais: TGroupBox;
    lbl_Descricao: TLabel;
    lbl_HD: TLabel;
    EditDescricao: TEdit;
    lblHD: TLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure EditDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_AlterarClick(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Informacao_Maquinas02: TInformacao_Maquinas02;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TInformacao_Maquinas02.BT_SairClick(Sender: TObject);
begin
    Informacao_Maquinas02.Close;
end;

procedure TInformacao_Maquinas02.EditDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TInformacao_Maquinas02.BT_AlterarClick(Sender: TObject);
begin

  Ampulheta();

    If Trim(EditDescricao.Text)='' Then
      Begin
      MSG_Erro('Antes de prosseguir preencha o campo Descrição...');
      EditDescricao.SetFocus;
      End
    Else
      Begin
      ConexaoBD.SQL_Comunitario.Close;
      ConexaoBD.SQL_Comunitario.SQL.Clear;
      ConexaoBD.SQL_Comunitario.SQL.Add('Update Informacao_Maquinas Set Informacao_Maquina_Descricao = "' + Texto_Grava(EditDescricao.Text) + '" Where Informacao_Maquina_HD="' + Texto_Grava(lblHd.Caption) + '"');
      ConexaoBD.SQL_Comunitario.ExecSQL;

      MSG_Erro('Alteração efetuada com sucesso...');
      Informacao_Maquinas02.Close;
    End;

  Seta();

end;

procedure TInformacao_Maquinas02.BT_ExcluirClick(Sender: TObject);
begin
      Ampulheta();

        ConexaoBD.SQL_Informacao_Maquinas.Close;
        ConexaoBD.SQL_Informacao_Maquinas.SQL.Clear;
        ConexaoBD.SQL_Informacao_Maquinas.SQL.Add('Select * From Informacao_Maquinas');
        ConexaoBD.SQL_Informacao_Maquinas.Open;

        If ConexaoBD.SQL_Informacao_Maquinas.RecordCount <= 1 Then
          Begin
            MSG_Erro('Não é possível Excluir esta Máquina !' + #13 + 'Cadastre outro primeiro.');
          End
        Else
          Begin
            If Confirma('Deseja realmente excluir a Máquina '+Trim(lblHD.Caption)+' ?')= 6 Then
              Begin
              ConexaoBD.SQL_Comunitario.Close;
              ConexaoBD.SQL_Comunitario.SQL.Clear;
              ConexaoBD.SQL_Comunitario.SQL.Add('Delete From Informacao_Maquinas Where Informacao_Maquina_HD="' + Trim(lblHD.Caption) + '"');
              ConexaoBD.SQL_Comunitario.ExecSQL;
              MSG_Erro('Exclusão efetuada com sucesso...');
            End;
        End;

        Informacao_Maquinas02.Close;
        
      Seta();
end;

end.
