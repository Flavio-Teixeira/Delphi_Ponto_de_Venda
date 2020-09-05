unit Rel_Perda_Produtos_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, Grids, DBGrids, Gauges;
  
type
  TRelPerdaProdutos00 = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Rel_Periodo_Inicial: TMaskEdit;
    Rel_Periodo_Final: TMaskEdit;
    pan_Botoes: TPanel;
    BT_Sair: TBitBtn;
    LBL_Registro: TLabel;
    BT_Procurar: TBitBtn;
    Panel2: TPanel;
    Label6: TLabel;
    ValorTotalPerdas: TLabel;
    GroupBox3: TGroupBox;
    BT_Localiza_Produto: TBitBtn;
    Label1: TLabel;
    DBGrid_Selecao: TDBGrid;
    QtdeTotalPerdas: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Rel_Periodo_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Rel_Periodo_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure BT_SairClick(Sender: TObject);
    procedure MaquinasKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure BT_Localiza_ProdutoClick(Sender: TObject);
    procedure DBGrid_SelecaoDblClick(Sender: TObject);
  private
    { Private declarations }
    function completa_zeros(texto: String; tamanho: Integer): String;
    function retira_acentos(texto:String; tamanho:Integer): String;    

  public
    { Public declarations }
  end;

var
  RelPerdaProdutos00: TRelPerdaProdutos00;

implementation

uses Rotinas_Gerais, Conexao_BD, Login_00, Produtos_00;

{$R *.dfm}

//***************
//*** Funções ***
//***************

function TRelPerdaProdutos00.completa_zeros(texto: String; tamanho: Integer): String;

var
   complementa_zeros_str, resulta_codigo: String;
   ind: Integer;

begin
         complementa_zeros_str := ' ';
         
         For ind := 1 To (tamanho - Length(trim(texto))) Do
             Begin
             complementa_zeros_str := complementa_zeros_str + '0';
         End;

         resulta_codigo := trim(complementa_zeros_str) + trim(texto);
         resulta_codigo := trim(resulta_codigo);
         resulta_codigo := Copy(resulta_codigo, (Length(resulta_codigo) - tamanho), tamanho);

         completa_zeros := resulta_codigo;
end;

function TRelPerdaProdutos00.retira_acentos(texto:String; tamanho:Integer): String;

var
   resulta_codigo: String;
   
begin
         texto := UpperCase(texto);

         texto := Troca_Caracter(#39, ' ', texto);
         texto := Troca_Caracter('"', ' ', texto);
         texto := Troca_Caracter('&', 'E', texto);

         texto := Troca_Caracter('ç', 'C', texto);

         texto := Troca_Caracter('á', 'A', texto);
         texto := Troca_Caracter('à', 'A', texto);
         texto := Troca_Caracter('ã', 'A', texto);
         texto := Troca_Caracter('â', 'A', texto);
         texto := Troca_Caracter('ä', 'A', texto);

         texto := Troca_Caracter('é', 'E', texto);
         texto := Troca_Caracter('è', 'E', texto);
         texto := Troca_Caracter('ê', 'E', texto);
         texto := Troca_Caracter('ë', 'E', texto);

         texto := Troca_Caracter('í', 'I', texto);
         texto := Troca_Caracter('ì', 'I', texto);
         texto := Troca_Caracter('î', 'I', texto);
         texto := Troca_Caracter('ï', 'I', texto);

         texto := Troca_Caracter('ó', 'O', texto);
         texto := Troca_Caracter('ò', 'O', texto);
         texto := Troca_Caracter('ô', 'O', texto);
         texto := Troca_Caracter('ö', 'O', texto);
         texto := Troca_Caracter('õ', 'O', texto);

         texto := Troca_Caracter('ú', 'U', texto);
         texto := Troca_Caracter('ù', 'U', texto);
         texto := Troca_Caracter('û', 'U', texto);
         texto := Troca_Caracter('ü', 'U', texto);

         texto := Troca_Caracter('Ç', 'C'
         , texto);

         texto := Troca_Caracter('Á', 'A', texto);
         texto := Troca_Caracter('À', 'A', texto);
         texto := Troca_Caracter('Ã', 'A', texto);
         texto := Troca_Caracter('Â', 'A', texto);
         texto := Troca_Caracter('Ä', 'A', texto);

         texto := Troca_Caracter('É', 'E', texto);
         texto := Troca_Caracter('È', 'E', texto);
         texto := Troca_Caracter('Ê', 'E', texto);
         texto := Troca_Caracter('Ë', 'E', texto);

         texto := Troca_Caracter('Í', 'I', texto);
         texto := Troca_Caracter('Ì', 'I', texto);
         texto := Troca_Caracter('Î', 'I', texto);
         texto := Troca_Caracter('Ï', 'I', texto);

         texto := Troca_Caracter('Ó', 'O', texto);
         texto := Troca_Caracter('Ò', 'O', texto);
         texto := Troca_Caracter('Ô', 'O', texto);
         texto := Troca_Caracter('Ö', 'O', texto);
         texto := Troca_Caracter('Õ', 'O', texto);

         texto := Troca_Caracter('Ú', 'U', texto);
         texto := Troca_Caracter('Ù', 'U', texto);
         texto := Troca_Caracter('Û', 'U', texto);
         texto := Troca_Caracter('Ü', 'U', texto);

         resulta_codigo := trim(texto);

         If tamanho > 0 Then
            Begin
            resulta_codigo := Copy(resulta_codigo,1,tamanho);
         End;

         retira_acentos := resulta_codigo;
end;

//******************
//*** Procedures ***
//******************

procedure TRelPerdaProdutos00.FormShow(Sender: TObject);
begin
    Rel_Periodo_Inicial.Text := DateToStr(Date());
    Rel_Periodo_Final.Text   := DateToStr(Date());

    BT_ProcurarClick(Sender);
end;

procedure TRelPerdaProdutos00.Rel_Periodo_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
    So_Numero(Sender, Key);

    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRelPerdaProdutos00.Rel_Periodo_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
    So_Numero(Sender, Key);

    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRelPerdaProdutos00.BT_SairClick(Sender: TObject);
begin
    RelPerdaProdutos00.Close;
end;

procedure TRelPerdaProdutos00.MaquinasKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRelPerdaProdutos00.BT_ProcurarClick(Sender: TObject);

var
   Comando_SQL: String;
   Ind, Vlr_Quantidade, Erro: Integer;
   Vlr_Numero: Real;
   Vlr_Exibicao: String;

begin
     If StrToDate(Rel_Periodo_Inicial.Text)<=StrToDate(Rel_Periodo_Final.Text) Then
        Begin
        Ampulheta();

        //*** Atualiza o Grid de Perdas ***
        Comando_SQL := 'SELECT ';
        Comando_SQL := Comando_SQL + 'SUM(perda_produto_custo) AS perda_total_produto_custo ';
        Comando_SQL := Comando_SQL + 'FROM perdas ';
        Comando_SQL := Comando_SQL + 'WHERE ';
        Comando_SQL := Comando_SQL + 'perda_data >= ' +#39+ Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-') +#39+ ' ';
        Comando_SQL := Comando_SQL + 'AND ';
        Comando_SQL := Comando_SQL + 'perda_data <= ' +#39+ Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-') +#39;

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.Open;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Comunitario.FieldByName('perda_total_produto_custo').Text));
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        ValorTotalPerdas.Caption := Vlr_Exibicao;

        If Trim(ValorTotalPerdas.Caption) = '' Then
           Begin
           ValorTotalPerdas.Caption := '0,00';
        End;

        //*** Atualiza a Quantidade de Perdas ***
        Comando_SQL := 'SELECT ';
        Comando_SQL := Comando_SQL + 'COUNT(perda_sequencial) AS perda_quantidade ';
        Comando_SQL := Comando_SQL + 'FROM perdas ';
        Comando_SQL := Comando_SQL + 'WHERE ';
        Comando_SQL := Comando_SQL + 'perda_data >= ' +#39+ Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-') +#39+ ' ';
        Comando_SQL := Comando_SQL + 'AND ';
        Comando_SQL := Comando_SQL + 'perda_data <= ' +#39+ Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-') +#39;

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.Open;

        Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Comunitario.FieldByName('perda_quantidade').Text));
        Val(Vlr_Exibicao,Vlr_Quantidade,Erro);

        If Erro <> 0 Then
           Begin
           Vlr_Exibicao := '0';
        End;

        QtdeTotalPerdas.Caption := Vlr_Exibicao;

        If Trim(QtdeTotalPerdas.Caption) = '' Then
           Begin
           QtdeTotalPerdas.Caption := '0';
        End;

        //*** Atualiza o Grid de Perdas ***
        ConexaoBD.SQL_Perdas.Close;
        ConexaoBD.SQL_Perdas.SQL.Clear;
        ConexaoBD.SQL_Perdas.SQL.Add('SELECT * FROM perdas WHERE perda_data >= ' +#39+ Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-') +#39+ ' AND perda_data <= ' +#39+ Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-') +#39+ ' ORDER BY perda_data ASC, perda_sequencial DESC');
        ConexaoBD.SQL_Perdas.Open;

        Seta();
        End
     Else
        Begin
        MSG_Erro('Data inicial não pode ser maior que a final...');
        Rel_Periodo_Inicial.SetFocus;
     End;
end;

procedure TRelPerdaProdutos00.BT_Localiza_ProdutoClick(Sender: TObject);
begin
     Application.CreateForm(TProdutos00,Produtos00);
     Produtos00.Edit_Tipo.Text:= 'Perdas';
     Produtos00.ShowModal;
     Produtos00.Destroy;

     BT_ProcurarClick(Sender);
end;

procedure TRelPerdaProdutos00.DBGrid_SelecaoDblClick(Sender: TObject);

var
   Comando_SQL: String;

begin
     If Confirma('Deseja excluir o Produto ' + Trim(DBGrid_Selecao.Fields[3].Text) + ' das Perdas?') = 6 Then
        Begin
        Comando_SQL := 'DELETE FROM perdas ';
        Comando_SQL := Comando_SQL + 'WHERE ';
        Comando_SQL := Comando_SQL + 'perda_data = ' +#39+ Inverte_Data_Plus(Trim(DBGrid_Selecao.Fields[0].Text),'amd','-') +#39+ ' ';
        Comando_SQL := Comando_SQL + 'AND ';
        Comando_SQL := Comando_SQL + 'perda_sequencial = ' +#39+ Trim(DBGrid_Selecao.Fields[1].Text) +#39+ ' ';
        Comando_SQL := Comando_SQL + 'AND ';
        Comando_SQL := Comando_SQL + 'perda_produto_codigo_barras = ' +#39+ Trim(DBGrid_Selecao.Fields[2].Text) +#39+ ' ';

        //*** Insere o Registro ***
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        //*** Retira o Produto do Estoque ***
        Comando_SQL := 'UPDATE Produtos SET ';
        Comando_SQL := Comando_SQL + 'Produto_Estoque_Atual = (Produto_Estoque_Atual + 1), ';
        Comando_SQL := Comando_SQL + 'Produto_Pedido_Qtde_Perdas = (Produto_Pedido_Qtde_Perdas - 1) ';
        Comando_SQL := Comando_SQL + 'WHERE Produto_Cod_Barra = ' + #39+ Trim(DBGrid_Selecao.Fields[2].Text) + #39;

        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario.ExecSQL;

        BT_ProcurarClick(Sender);
     End;
end;

end.
