unit Estoque_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TEstoque01 = class(TForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    BT_Subtrair: TBitBtn;
    BT_Adicionar: TBitBtn;
    Qtd: TEdit;
    Qtd_Atual: TEdit;
    Panel2: TPanel;
    BT_Sair: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure QtdKeyPress(Sender: TObject; var Key: Char);
    procedure BT_AdicionarClick(Sender: TObject);
    procedure BT_SubtrairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Estoque01: TEstoque01;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TEstoque01.BT_SairClick(Sender: TObject);
begin
    Estoque01.Close;
end;

procedure TEstoque01.QtdKeyPress(Sender: TObject; var Key: Char);
begin
    So_Numero(Sender, Key);
end;

procedure TEstoque01.BT_AdicionarClick(Sender: TObject);
var
   Comando_SQL :String;

begin
    Ampulheta();

      If Trim(Qtd.Text) = '' Then Qtd.Text := '0';

      Comando_SQL := 'Update Produtos Set ' ;
      Comando_SQL := Comando_SQL + ' Produto_Estoque_Atual = Produto_Estoque_Atual + ' + Trim(Qtd.Text);
      Comando_SQL := Comando_SQL + ' Where  Produto_Codigo = ' + Trim(lblCodigo.Caption);

      ConexaoBD.SQL_Comunitario.SQL.Clear;
      ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
      ConexaoBD.SQL_Comunitario.ExecSQL;

    Seta();

    Msg_Erro('Alteração de Estoque concluída !');
    Estoque01.Close;

end;

procedure TEstoque01.BT_SubtrairClick(Sender: TObject);
var
   Comando_SQL :String;

begin
    Ampulheta();

      If Trim(Qtd.Text) = '' Then Qtd.Text := '0';

      Comando_SQL := 'Update Produtos Set ' ;
      Comando_SQL := Comando_SQL + ' Produto_Estoque_Atual = Produto_Estoque_Atual - ' + Trim(Qtd.Text);
      Comando_SQL := Comando_SQL + ' Where  Produto_Codigo = ' + Trim(lblCodigo.Caption);

      ConexaoBD.SQL_Comunitario.SQL.Clear;
      ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
      ConexaoBD.SQL_Comunitario.ExecSQL;

    Seta();

    Msg_Erro('Alteração de Estoque concluída !');
    Estoque01.Close;
end;

end.
