unit Rel_Estoque_Minimo_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, OleCtrls, ComObj;

type
  TRelEstoqueMinimo00 = class(TForm)
    pan_Botoes: TPanel;
    BT_Sair: TBitBtn;
    BT_Imprimir: TBitBtn;
    Panel1: TPanel;
    LBL_Rel_Titulo: TLabel;
    GridProdutos: TDBGrid;
    CBGrupo: TComboBox;
    CBFornecedor: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    BT_Planilha: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBGrupoChange(Sender: TObject);
    procedure CBFornecedorChange(Sender: TObject);
    procedure BT_PlanilhaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridProdutosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelEstoqueMinimo00: TRelEstoqueMinimo00;

implementation

uses Principal_00, Conexao_BD, Rotinas_Gerais, Rel_Estoque_Minimo_01;

{$R *.dfm}

procedure TRelEstoqueMinimo00.BT_SairClick(Sender: TObject);
begin
     RelEstoqueMinimo00.Close;
end;

procedure TRelEstoqueMinimo00.BT_ImprimirClick(Sender: TObject);
begin
     BT_Imprimir.Enabled := False;
     BT_Sair.Enabled     := False;

     Ampulheta();

     Application.CreateForm(TRelEstoqueMinimo01,RelEstoqueMinimo01);

     Seta();
     
     RelEstoqueMinimo01.QR_Estoque.PreviewModal;
     RelEstoqueMinimo01.QR_Estoque.Destroy;
     RelEstoqueMinimo01.Destroy;

     BT_Imprimir.Enabled := True;
     BT_Sair.Enabled     := True;
end;

procedure TRelEstoqueMinimo00.FormShow(Sender: TObject);
var
   Comando_SQL: String;

begin
   Comando_SQL := 'SELECT * FROM Produtos ';
   Comando_SQL := Comando_SQL + 'WHERE Produto_Estoque_Atual < Produto_Estoque_Minimo ';
   Comando_SQL := Comando_SQL + 'ORDER BY Produto_Descricao ASC, Produto_Codigo ASC';

   Ampulheta();
   //ConexaoBD.SQL_Estoque_Minimo.Close;
   //ConexaoBD.SQL_Estoque_Minimo.SQL.Clear;
   //ConexaoBD.SQL_Estoque_Minimo.SQL.Add(Comando_SQL);
   //ConexaoBD.SQL_Estoque_Minimo.Open;

   Carrega_Grupos('RelEstoqueMinimo00');
   Carrega_Fornecedores('RelEstoqueMinimo00');

   Seta();
end;

procedure TRelEstoqueMinimo00.CBGrupoChange(Sender: TObject);
var
   Comando_SQL: String;

begin
   Ampulheta();

   CBFornecedor.ItemIndex := 0;

   If Trim(Obtem_Nro_Antes_Traco(CBGrupo.Text)) <> '' Then
      Begin
      Comando_SQL := 'SELECT * FROM Produtos ';
      Comando_SQL := Comando_SQL + 'WHERE Produto_Estoque_Atual < Produto_Estoque_Minimo ';
      Comando_SQL := Comando_SQL + 'AND Produto_Grupo = ' + Trim(Obtem_Nro_Antes_Traco(CBGrupo.Text)) + ' ';
      Comando_SQL := Comando_SQL + 'ORDER BY Produto_Descricao ASC, Produto_Codigo ASC';

      ConexaoBD.SQL_Estoque_Minimo.Close;
      ConexaoBD.SQL_Estoque_Minimo.SQL.Clear;
      ConexaoBD.SQL_Estoque_Minimo.SQL.Add(Comando_SQL);
      ConexaoBD.SQL_Estoque_Minimo.Open;
      End
   Else
      Begin
      Comando_SQL := 'SELECT * FROM Produtos ';
      Comando_SQL := Comando_SQL + 'WHERE Produto_Estoque_Atual < Produto_Estoque_Minimo ';
      Comando_SQL := Comando_SQL + 'ORDER BY Produto_Descricao ASC, Produto_Codigo ASC';

      ConexaoBD.SQL_Estoque_Minimo.Close;
      ConexaoBD.SQL_Estoque_Minimo.SQL.Clear;
      ConexaoBD.SQL_Estoque_Minimo.SQL.Add(Comando_SQL);
      ConexaoBD.SQL_Estoque_Minimo.Open;
   End;

   Seta();
end;

procedure TRelEstoqueMinimo00.CBFornecedorChange(Sender: TObject);
var
   Comando_SQL: String;

begin
   Ampulheta();

   CBGrupo.ItemIndex := 0;

   If Trim(Obtem_Nro_Antes_Traco(CBFornecedor.Text)) <> '' Then
      Begin
      Comando_SQL := 'SELECT * FROM Produtos ';
      Comando_SQL := Comando_SQL + 'WHERE Produto_Estoque_Atual < Produto_Estoque_Minimo ';
      Comando_SQL := Comando_SQL + 'AND Produto_Fornecedor_Cod = ' + Trim(Obtem_Nro_Antes_Traco(CBFornecedor.Text)) + ' ';
      Comando_SQL := Comando_SQL + 'ORDER BY Produto_Descricao ASC, Produto_Codigo ASC';

      ConexaoBD.SQL_Estoque_Minimo.Close;
      ConexaoBD.SQL_Estoque_Minimo.SQL.Clear;
      ConexaoBD.SQL_Estoque_Minimo.SQL.Add(Comando_SQL);
      ConexaoBD.SQL_Estoque_Minimo.Open;
      End
   Else
      Begin
      Comando_SQL := 'SELECT * FROM Produtos ';
      Comando_SQL := Comando_SQL + 'WHERE Produto_Estoque_Atual < Produto_Estoque_Minimo ';
      Comando_SQL := Comando_SQL + 'ORDER BY Produto_Descricao ASC, Produto_Codigo ASC';

      ConexaoBD.SQL_Estoque_Minimo.Close;
      ConexaoBD.SQL_Estoque_Minimo.SQL.Clear;
      ConexaoBD.SQL_Estoque_Minimo.SQL.Add(Comando_SQL);
      ConexaoBD.SQL_Estoque_Minimo.Open;
   End;

   Seta();
end;

procedure TRelEstoqueMinimo00.BT_PlanilhaClick(Sender: TObject);

var
   coluna, linha: integer;
   excel: variant;
   valor, formula_total, data_str, CorCelula: string;

begin
     Ampulheta();

     try
        excel:=CreateOleObject('Excel.Application');
        excel.WorkBooks.Add(1);
        excel.WorkBooks[1].WorkSheets[1].Name := 'Pedido';
     except
        Application.MessageBox ('Versão do Ms-Excel Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
     end;

     try
        linha  := 2;
        coluna := 1;

        //*** Prepara o Título da Planilha ***

        //*** Primeira Linha ***
        linha  := linha + 1;
        coluna := 1;
        valor := 'Planilha de Pedido';
        excel.cells[linha,coluna] := valor;

        Data_Str := DateToStr(Date());

        coluna := coluna + 2;
        valor := 'Data: ' + DateToStr(Date());
        excel.cells[linha,coluna] := valor;

        coluna := coluna + 2;
        valor := 'Hora: ' + TimeToStr(Time());;
        excel.cells[linha,coluna] := valor;

        //*** Segunda Linha ***
        linha  := linha + 2;
        coluna := 1;

        If Trim(Obtem_Nro_Antes_Traco(CBGrupo.Text)) <> '' Then
           Begin
           //*** Nome da Planilha ***
           valor := 'P' + Copy(Data_Str,9,2) + Copy(Data_Str,4,2) + Copy(Data_Str,1,2) + 'G' + Trim(Obtem_Nro_Antes_Traco(CBGrupo.Text)) + Trim(Obtem_Depois_Traco(CBGrupo.Text)) + '.xls';
           excel.cells[1,1] := valor;

           //*** Define o Grupo ***
           valor := 'Grupo:';
           excel.cells[linha,coluna] := valor;

           coluna := coluna + 1;
           valor := Trim(CBGrupo.Text);
           excel.cells[linha,coluna] := valor;

           linha  := linha + 1;
           coluna := 1;
        End;

        If Trim(Obtem_Nro_Antes_Traco(CBFornecedor.Text)) <> '' Then
           Begin
           //*** Nome da Planilha ***
           valor := 'P' + Copy(Data_Str,9,2) + Copy(Data_Str,4,2) + Copy(Data_Str,1,2) + 'F' + Trim(Obtem_Nro_Antes_Traco(CBFornecedor.Text)) + Trim(Obtem_Depois_Traco(CBFornecedor.Text)) + '.xls';
           excel.cells[1,1] := valor;

           //*** Define o Fornecedor ***
           valor := 'Fornecedor:';
           excel.cells[linha,coluna] := valor;

           coluna := coluna + 1;
           valor := Trim(CBFornecedor.Text);
           excel.cells[linha,coluna] := valor;

           linha  := linha + 1;
           coluna := 1;
        End;

        //*** Terceira Linha ***
        linha  := linha + 1;
        coluna := 1;

        valor := 'Cód.Fornecedor';
        excel.cells[linha,coluna] := valor;
        excel.cells[linha,coluna].Font.Bold := True;
        coluna := coluna + 1;

        valor := 'Código';
        excel.cells[linha,coluna] := valor;
        excel.cells[linha,coluna].Font.Bold := True;
        coluna := coluna + 1;

        valor := 'Cód.Barras';
        excel.cells[linha,coluna] := valor;
        excel.cells[linha,coluna].Font.Bold := True;
        coluna := coluna + 1;

        valor := 'Descrição';
        excel.cells[linha,coluna] := valor;
        excel.cells[linha,coluna].Font.Bold := True;
        coluna := coluna + 1;

        valor := 'Qtde.Estoque Mínimo';
        excel.cells[linha,coluna] := valor;
        excel.cells[linha,coluna].Font.Bold := True;
        coluna := coluna + 1;

        valor := 'Qtde.Estoque Atual';
        excel.cells[linha,coluna] := valor;
        excel.cells[linha,coluna].Font.Bold := True;
        coluna := coluna + 1;

        valor := 'Vlr.Última Compra (R$)';
        excel.cells[linha,coluna] := valor;
        excel.cells[linha,coluna].Font.Bold := True;
        coluna := coluna + 1;

        valor := '          ';
        excel.cells[linha,coluna] := valor;
        excel.cells[linha,coluna].Font.Bold := True;
        coluna := coluna + 1;

        valor := 'Qtde.Solicitada';
        excel.cells[linha,coluna] := valor;
        excel.cells[linha,coluna].Font.Bold := True;
        coluna := coluna + 1;

        valor := 'Vlr.Unitário da Compra (R$)';
        excel.cells[linha,coluna] := valor;
        excel.cells[linha,coluna].Font.Bold := True;
        coluna := coluna + 1;

        valor := 'Vlr.Total (R$)';
        excel.cells[linha,coluna] := valor;
        excel.cells[linha,coluna].Font.Bold := True;
        coluna := coluna + 1;

        valor := '          ';
        excel.cells[linha,coluna] := valor;
        excel.cells[linha,coluna].Font.Bold := True;
        coluna := coluna + 1;

        valor := 'DT.Última Venda';
        excel.cells[linha,coluna] := valor;
        excel.cells[linha,coluna].Font.Bold := True;
        coluna := coluna + 1;

        valor := 'Qtde.Perdas';
        excel.cells[linha,coluna] := valor;
        excel.cells[linha,coluna].Font.Bold := True;
        coluna := coluna + 1;

        valor := 'Margem de Lucro(%)';
        excel.cells[linha,coluna] := valor;
        excel.cells[linha,coluna].Font.Bold := True;
        coluna := coluna + 1;

        //*** Linha dos Produtos ***
        ConexaoBD.SQL_Estoque_Minimo.First;

        formula_total := '=(';

        While Not ConexaoBD.SQL_Estoque_Minimo.Eof Do
              Begin

              //*** Verifica as Perdas e a Porcentagem para trocar a cor da linha ***
              If ( (StrToInt(ConexaoBD.SQL_Estoque_Minimo.FieldByName('Produto_Pedido_Qtde_Perdas').Text) > 0) Or (StrToFloat(ConexaoBD.SQL_Estoque_Minimo.FieldByName('Produto_Margem_Lucro').Text) < 10) ) Then
                 Begin
                 CorCelula := 'clRed';
                 End
              Else
                 Begin
                 CorCelula := 'clWhite';
              End;

              //*** Gera a Linha do Produto a ser pedido ***
              linha  := linha + 1;
              coluna := 1;

              formula_total := formula_total + 'K' + Trim(IntToStr(linha));

              valor := '_' + ConexaoBD.SQL_Estoque_Minimo.FieldByName('Produto_Pedido_Codigo_Fornecedor').Text + '_';
              excel.cells[linha,coluna] := valor;
              excel.cells[linha,coluna].Interior.Color := StringToColor(CorCelula);
              excel.cells[linha,coluna].Borders.Color  := clBlack;
              coluna := coluna + 1;

              valor := '_' + ConexaoBD.SQL_Estoque_Minimo.FieldByName('Produto_Codigo').Text + '_';
              excel.cells[linha,coluna] := valor;
              excel.cells[linha,coluna].Interior.Color := StringToColor(CorCelula);
              excel.cells[linha,coluna].Borders.Color  := clBlack;
              coluna := coluna + 1;

              valor := '_' + ConexaoBD.SQL_Estoque_Minimo.FieldByName('Produto_Cod_Barra').Text + '_';
              excel.cells[linha,coluna] := valor;
              excel.cells[linha,coluna].Interior.Color := StringToColor(CorCelula);
              excel.cells[linha,coluna].Borders.Color  := clBlack;
              coluna := coluna + 1;

              valor := ConexaoBD.SQL_Estoque_Minimo.FieldByName('Produto_Descricao').Text;
              excel.cells[linha,coluna] := valor;
              excel.cells[linha,coluna].Interior.Color := StringToColor(CorCelula);
              excel.cells[linha,coluna].Borders.Color  := clBlack;
              coluna := coluna + 1;

              valor := ConexaoBD.SQL_Estoque_Minimo.FieldByName('Produto_Estoque_Minimo').Text;
              excel.cells[linha,coluna] := valor;
              excel.cells[linha,coluna].Interior.Color := StringToColor(CorCelula);
              excel.cells[linha,coluna].Borders.Color  := clBlack;
              coluna := coluna + 1;

              valor := ConexaoBD.SQL_Estoque_Minimo.FieldByName('Produto_Estoque_Atual').Text;
              excel.cells[linha,coluna] := valor;
              excel.cells[linha,coluna].Interior.Color := StringToColor(CorCelula);
              excel.cells[linha,coluna].Borders.Color  := clBlack;
              coluna := coluna + 1;

              valor := ConexaoBD.SQL_Estoque_Minimo.FieldByName('Produto_Custo').Text;
              excel.cells[linha,coluna].HorizontalAlignment := -4152; //Alinha a Direita
              excel.cells[linha,coluna].NumberFormat := '0,00';
              excel.cells[linha,coluna] := valor;
              excel.cells[linha,coluna].Interior.Color := StringToColor(CorCelula);
              excel.cells[linha,coluna].Borders.Color  := clBlack;
              coluna := coluna + 1;

              valor := '          ';
              excel.cells[linha,coluna] := valor;
              excel.cells[linha,coluna].Interior.Color := StringToColor(CorCelula);
              excel.cells[linha,coluna].Borders.Color  := clBlack;
              coluna := coluna + 1;

              valor := '0';
              excel.cells[linha,coluna] := valor;
              excel.cells[linha,coluna].Interior.Color := StringToColor(CorCelula);
              excel.cells[linha,coluna].Borders.Color  := clBlack;
              coluna := coluna + 1;

              valor := ConexaoBD.SQL_Estoque_Minimo.FieldByName('Produto_Custo').Text;
              excel.cells[linha,coluna].HorizontalAlignment := -4152; //Alinha a Direita
              excel.cells[linha,coluna].NumberFormat := '0,00';
              excel.cells[linha,coluna] := valor;
              excel.cells[linha,coluna].Interior.Color := StringToColor(CorCelula);
              excel.cells[linha,coluna].Borders.Color  := clBlack;
              coluna := coluna + 1;

              valor := '=(I' + Trim(IntToStr(linha)) + '*J' + Trim(IntToStr(linha)) + ')';
              excel.cells[linha,coluna].HorizontalAlignment := -4152; //Alinha a Direita
              excel.cells[linha,coluna].NumberFormat := '0,00';
              excel.cells[linha,coluna] := valor;
              excel.cells[linha,coluna].Interior.Color := StringToColor(CorCelula);
              excel.cells[linha,coluna].Borders.Color  := clBlack;
              coluna := coluna + 1;

              valor := '          ';
              excel.cells[linha,coluna] := valor;
              excel.cells[linha,coluna].Interior.Color := StringToColor(CorCelula);
              excel.cells[linha,coluna].Borders.Color  := clBlack;
              coluna := coluna + 1;

              valor := ConexaoBD.SQL_Estoque_Minimo.FieldByName('Produto_Ultima_Venda').Text;
              excel.cells[linha,coluna].HorizontalAlignment := -4108; //Alinha ao Centro
              excel.cells[linha,coluna].NumberFormat := '@';
              excel.cells[linha,coluna] := valor;
              excel.cells[linha,coluna].Interior.Color := StringToColor(CorCelula);
              excel.cells[linha,coluna].Borders.Color  := clBlack;
              coluna := coluna + 1;

              valor := ConexaoBD.SQL_Estoque_Minimo.FieldByName('Produto_Pedido_Qtde_Perdas').Text;
              excel.cells[linha,coluna] := valor;
              excel.cells[linha,coluna].Interior.Color := StringToColor(CorCelula);
              excel.cells[linha,coluna].Borders.Color  := clBlack;
              coluna := coluna + 1;

              valor := ConexaoBD.SQL_Estoque_Minimo.FieldByName('Produto_Margem_Lucro').Text;
              excel.cells[linha,coluna].HorizontalAlignment := -4152; //Alinha a Direita
              excel.cells[linha,coluna].NumberFormat := '0,00';
              excel.cells[linha,coluna] := valor;
              excel.cells[linha,coluna].Interior.Color := StringToColor(CorCelula);
              excel.cells[linha,coluna].Borders.Color  := clBlack;
              coluna := coluna + 1;

              ConexaoBD.SQL_Estoque_Minimo.Next;

              If ConexaoBD.SQL_Estoque_Minimo.Eof Then
                 Begin
                 formula_total := formula_total + ')';
                 End
              Else
                 Begin
                 formula_total := formula_total + '+';
              End;
        End;

        //*** Total do Pedido ***
        linha  := linha + 2;
        coluna := 10;

        valor := 'Total Geral do Pedido (R$):';
        excel.cells[linha,coluna] := valor;
        coluna := coluna + 1;

        valor := formula_total;
        excel.cells[linha,coluna] := valor;
        coluna := coluna + 1;

        Seta();

        excel.columns.AutoFit;
        excel.visible:=true;
     except
        Seta();
        Application.MessageBox ('Aconteceu um erro desconhecido durante a conversão da tabela para o Ms-Excel','Erro',MB_OK+MB_ICONEXCLAMATION);
     end;
end;

procedure TRelEstoqueMinimo00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TRelEstoqueMinimo00.GridProdutosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     If ((StrToInt(GridProdutos.Fields[6].Text) > 0) Or (StrToFloat(GridProdutos.Fields[7].Text) < 10)) Then
        Begin
        GridProdutos.Canvas.Brush.Color := clRed;
     End;

     GridProdutos.DefaultDrawDataCell(Rect, GridProdutos.columns[datacol].field, State);
end;

end.
