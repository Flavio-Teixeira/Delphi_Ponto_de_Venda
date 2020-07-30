unit Grupos_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TGrupos01 = class(TForm)
    Panel3: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    EditDescricao: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Grupos01: TGrupos01;

implementation

uses Conexao_BD, Rotinas_Gerais, Grupos_02;

{$R *.dfm}

procedure TGrupos01.BT_SairClick(Sender: TObject);
begin
    Grupos01.Close;
end;


procedure TGrupos01.BT_IncluirClick(Sender: TObject);
begin

  Ampulheta();

    If Trim(EditDescricao.Text)='' then
      Begin
      MSG_Erro('Antes de prosseguir preencha o campo Descrição...');
      EditDescricao.SetFocus;
      End
    Else
      Begin

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add('Insert into Grupos(Grupo_Descricao) Values("' + Texto_Grava(EditDescricao.Text) + '")');
        ConexaoBD.SQL_Comunitario.ExecSQL;

        MSG_Erro('Inclusão efetuada com sucesso...');

        If Confirma('Deseja incluir outro Grupo?') = 6 Then
          Begin
          EditDescricao.Text  := '';
          EditDescricao.SetFocus;
          End
        Else
          Begin
          Grupos01.Close;
        End;
    End;

  Seta();

end;

end.
