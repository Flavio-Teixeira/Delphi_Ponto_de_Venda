unit Entrada_Produtos_NF_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, Mask;

type
  TEntradaProdutosNF00 = class(TForm)
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Cod_Fornecedores: TEdit;
    CBFornecedor: TComboBox;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    BT_Sair: TBitBtn;
    BT_Alterar: TBitBtn;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Valor_IPI: TEdit;
    Total_Nota: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Valor_Desconto: TEdit;
    Label4: TLabel;
    Numero_Nota: TEdit;
    Entrada_Produtos: TStringGrid;
    Panel4: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Produto_Codigo: TEdit;
    Produto_Qtde: TEdit;
    Produto_Vlr_Unitario: TEdit;
    Produto_Vlr_Total: TEdit;
    Produto_Descricao: TEdit;
    Panel5: TPanel;
    BT_Localizar: TBitBtn;
    Label25: TLabel;
    Data_Emissao: TMaskEdit;
    BT_Adicionar: TBitBtn;
    Label6: TLabel;
    Cond_Pagto: TEdit;
    BitBtn2: TBitBtn;
    Ajusta_Estoque: TCheckBox;
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Cod_FornecedoresKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure CBFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure Numero_NotaKeyPress(Sender: TObject; var Key: Char);
    procedure Data_EmissaoKeyPress(Sender: TObject; var Key: Char);
    procedure Cond_PagtoKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_QtdeKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_Vlr_UnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure Produto_Vlr_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure Valor_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure Valor_DescontoKeyPress(Sender: TObject; var Key: Char);
    procedure Total_NotaKeyPress(Sender: TObject; var Key: Char);
    procedure BT_LocalizarClick(Sender: TObject);
    procedure Produto_Vlr_UnitarioExit(Sender: TObject);
    procedure BT_AdicionarClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EntradaProdutosNF00: TEntradaProdutosNF00;

implementation

uses Principal_00, Conexao_BD, Rotinas_Gerais, Fornecedores_01,
  Produtos_00;

{$R *.dfm}

procedure TEntradaProdutosNF00.BT_SairClick(Sender: TObject);
begin
     EntradaProdutosNF00.Close;
end;

procedure TEntradaProdutosNF00.FormShow(Sender: TObject);
begin
      If (Trim(Principal.Edit_Cor_Grid.Text) <> '') And (Trim(Principal.Edit_Cor_Letra.Text) <> '') Then
         Begin
         Entrada_Produtos.Color      := StringToColor(Principal.Edit_Cor_Grid.Text);
         Entrada_Produtos.Font.Color := StringToColor(Principal.Edit_Cor_Letra.Text);
      End;

      //*** Código do Produto ***
      Entrada_Produtos.Cells[0,0]        := 'Código';
      Entrada_Produtos.ColWidths[0]      := 100;

      //*** Descrição do Produto ***
      Entrada_Produtos.Cells[1,0]        := 'Descrição';
      Entrada_Produtos.ColWidths[1]      := 345;

      //*** Quantidade ***
      Entrada_Produtos.Cells[2,0]        := 'Qtde';
      Entrada_Produtos.ColWidths[2]      := 50;

      //*** Valor Unitário ***
      Entrada_Produtos.Cells[3,0]        := 'Vlr.Unit';
      Entrada_Produtos.ColWidths[3]      := 80;

      //*** Valor Total ***
      Entrada_Produtos.Cells[4,0]        := 'Vlr.Total';
      Entrada_Produtos.ColWidths[4]      := 80;

      Entrada_Produtos.RowCount          := 2;
      Entrada_Produtos.FixedRows         := 1;

      Carrega_Fornecedores('EntradaProdutosNF00');
end;

procedure TEntradaProdutosNF00.Cod_FornecedoresKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Procura_Fornecedores('EntradaProdutosNF00',Cod_Fornecedores.Text);

      if (CBFornecedor.ItemIndex > 0) or (Trim(Cod_Fornecedores.Text) = '') Then Perform(WM_NEXTDLGCTL, 0, 0)
      Else Cod_Fornecedores.SelectAll;
    End;
end;

procedure TEntradaProdutosNF00.BitBtn2Click(Sender: TObject);
begin
    Application.CreateForm(TFornecedores01,Fornecedores01);
    Fornecedores01.ShowModal;
    Fornecedores01.Destroy;

    Carrega_Fornecedores('EntradaProdutosNF00');
end;

procedure TEntradaProdutosNF00.CBFornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TEntradaProdutosNF00.Numero_NotaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TEntradaProdutosNF00.Data_EmissaoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TEntradaProdutosNF00.Cond_PagtoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TEntradaProdutosNF00.Produto_CodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin

      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);

      If Trim(Produto_Codigo.Text) <> '' Then
         Begin

         ConexaoBD.SQL_Produtos.Close;
         ConexaoBD.SQL_Produtos.SQL.Clear;
         ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Codigo = ' + Trim(Produto_Codigo.Text));
         ConexaoBD.SQL_Produtos.Open;

         If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
            Begin
            Produto_Descricao.Text    := ConexaoBD.SQL_ProdutosProduto_Descricao.Text;
            Produto_Qtde.Text         := '';
            Produto_Vlr_Total.Text    := '';
            Produto_Vlr_Unitario.Text := '';
            End
         Else
            Begin
            MSG_Erro('Produto Não Encontrado');

            Produto_Descricao.Text    := '';
            Produto_Qtde.Text         := '';
            Produto_Vlr_Total.Text    := '';
            Produto_Vlr_Unitario.Text := '';

            Produto_Codigo.SetFocus;
         End;
      End;
    End;
end;

procedure TEntradaProdutosNF00.Produto_DescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TEntradaProdutosNF00.Produto_QtdeKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
      End
    Else
      Begin
      So_Numero(Sender,Key);
    End;
end;

procedure TEntradaProdutosNF00.Produto_Vlr_UnitarioKeyPress(
  Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
      End
    Else
      Begin
      So_Valor(Sender,Key);
    End;
end;

procedure TEntradaProdutosNF00.Produto_Vlr_TotalKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TEntradaProdutosNF00.Valor_IPIKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
      End
    Else
      Begin
      So_Valor(Sender,Key);
    End;
end;

procedure TEntradaProdutosNF00.Valor_DescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
      End
    Else
      Begin
      So_Valor(Sender,Key);
    End;
end;

procedure TEntradaProdutosNF00.Total_NotaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
      End
    Else
      Begin
      So_Valor(Sender,Key);
    End;
end;

procedure TEntradaProdutosNF00.BT_LocalizarClick(Sender: TObject);
begin
     Application.CreateForm(TProdutos00,Produtos00);
     Produtos00.Edit_Tipo.Text:= 'EntradaProdutosNF00';
     Produtos00.ShowModal;
     Produtos00.Destroy;
end;

procedure TEntradaProdutosNF00.Produto_Vlr_UnitarioExit(Sender: TObject);

var
   Valor_Total: Real;

begin
     Valor_Total := 0;
     Valor_Total := StrToInt(Produto_Qtde.Text) * StrToFloat(Produto_Vlr_Unitario.Text);

     Produto_Vlr_Total.Text := FormatFloat('0.00', Valor_Total);
end;

procedure TEntradaProdutosNF00.BT_AdicionarClick(Sender: TObject);

var
   Posicao, Ind: Integer;
   Valor_Total: Real;

begin
     If Trim(Produto_Descricao.Text) <> '' Then
        Begin

        Posicao := Entrada_Produtos.RowCount + 1;

        Entrada_Produtos.RowCount := Posicao;

        //*** Código do Produto ***
        Entrada_Produtos.Cells[0,(Posicao - 2)] := Produto_Codigo.Text;

        //*** Descrição do Produto ***
        Entrada_Produtos.Cells[1,(Posicao - 2)] := Produto_Descricao.Text;

        //*** Quantidade ***
        Entrada_Produtos.Cells[2,(Posicao - 2)] := Produto_Qtde.Text;

        //*** Valor Unitário ***
        Entrada_Produtos.Cells[3,(Posicao - 2)] := Produto_Vlr_Unitario.Text;

        //*** Valor Total ***
        Entrada_Produtos.Cells[4,(Posicao - 2)] := Produto_Vlr_Total.Text;

        //*** Totaliza e Volta para Digitar Outro Produto ***

        Valor_Total := 0;

        For Ind := 1 To (Posicao - 1) Do
            Begin

            If Trim(Entrada_Produtos.Cells[4,Ind]) <> '' Then
               Begin
               Valor_Total := Valor_Total + StrToFloat(Entrada_Produtos.Cells[4,Ind]);
            End;
        End;

        Total_Nota.Text := FormatFloat('0.00', Valor_Total);

        Produto_Codigo.Text       := '';
        Produto_Descricao.Text    := '';
        Produto_Qtde.Text         := '';
        Produto_Vlr_Total.Text    := '';
        Produto_Vlr_Unitario.Text := '';

        Produto_Codigo.SetFocus;
     End;
end;

procedure TEntradaProdutosNF00.BT_AlterarClick(Sender: TObject);

var
   ComandoSQL, Nro_Cabeca: String;
   Ind: Integer;

begin

    Ampulheta();

    If Trim(CBFornecedor.Text) = '--- Nenhum ---' Then
      Begin
      Seta();
      MSG_Erro('O Fornecedor Não foi informado...');
      CBFornecedor.SetFocus;
      End
    Else If Trim(Numero_Nota.Text) = '' Then
      Begin
      Seta();
      MSG_Erro('O Número da Nota Não foi informado...');
      Numero_Nota.SetFocus;
      End
    Else If Trim(Data_Emissao.Text) = '/  /' Then
      Begin
      Seta();
      MSG_Erro('A Data de Emissão Não foi informada...');
      Data_Emissao.SetFocus;
      End
    Else If Trim(Total_Nota.Text) = '' Then
      Begin
      Seta();
      MSG_Erro('O Total da Nota Não foi Informado...');
      Total_Nota.SetFocus;
      End
    Else
      Begin

      //*** Inclui a Cabeça ***

      If Trim(Valor_IPI.Text) = '' Then
         Begin
         Valor_IPI.Text := '0,00';
      End;

      If Trim(Valor_Desconto.Text) = '' Then
         Begin
         Valor_Desconto.Text := '0,00';
      End;

      If Trim(Total_Nota.Text) = '' Then
         Begin
         Total_Nota.Text := '0,00';
      End;

      ComandoSQL := 'Insert into Entrada_Nota_Cabeca(';
      ComandoSQL := ComandoSQL + 'Entrada_Nota_Cabeca_Lacto, ';
      ComandoSQL := ComandoSQL + 'Entrada_Nota_Cabeca_Fornecedor_Cod, ';
      ComandoSQL := ComandoSQL + 'Entrada_Nota_Cabeca_Fornecedor_Desc, ';
      ComandoSQL := ComandoSQL + 'Entrada_Nota_Cabeca_Nota, ';
      ComandoSQL := ComandoSQL + 'Entrada_Nota_Cabeca_Emissao, ';
      ComandoSQL := ComandoSQL + 'Entrada_Nota_Cabeca_Cond_Pgto, ';
      ComandoSQL := ComandoSQL + 'Entrada_Nota_Cabeca_IPI, ';
      ComandoSQL := ComandoSQL + 'Entrada_Nota_Cabeca_Desconto, ';
      ComandoSQL := ComandoSQL + 'Entrada_Nota_Cabeca_Total, ';
      ComandoSQL := ComandoSQL + 'Entrada_Nota_Cabeca_Ajusta) ';
      ComandoSQL := ComandoSQL + 'Values(';
      ComandoSQL := ComandoSQL + #39 + Inverte_Data_Plus(DateToStr(Date),'amd','-') + #39 + ',';
      ComandoSQL := ComandoSQL +       Obtem_Nro_Antes_Traco(CBFornecedor.Text) +       ',';
      ComandoSQL := ComandoSQL + #39 + Obtem_Depois_Traco(CBFornecedor.Text)    + #39 + ',';
      ComandoSQL := ComandoSQL + #39 + Trim(Numero_Nota.Text)                   + #39 + ',';
      ComandoSQL := ComandoSQL + #39 + Inverte_Data_Plus(Data_Emissao.Text,'amd','-') + #39 + ',';
      ComandoSQL := ComandoSQL + #39 + Trim(Cond_Pagto.Text)                    + #39 + ',';
      ComandoSQL := ComandoSQL +       Virgula_Ponto(Trim(Valor_IPI.Text))      +       ',';
      ComandoSQL := ComandoSQL +       Virgula_Ponto(Trim(Valor_Desconto.Text)) +       ',';
      ComandoSQL := ComandoSQL +       Virgula_Ponto(Trim(Total_Nota.Text))     +       ',';

      If Ajusta_Estoque.Checked Then
         Begin
         ComandoSQL := ComandoSQL + #39 + 'S' + #39 + ')';
         End
      Else
         Begin
         ComandoSQL := ComandoSQL + #39 + 'N' + #39 + ')';
      End;

      ConexaoBD.SQL_Comunitario.Close;
      ConexaoBD.SQL_Comunitario.SQL.Clear;
      ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
      ConexaoBD.SQL_Comunitario.ExecSQL;

      //*** Incluir Produto ***

      ConexaoBD.SQL_Entrada_Nota_Cabeca.Close;
      ConexaoBD.SQL_Entrada_Nota_Cabeca.SQL.Clear;
      ConexaoBD.SQL_Entrada_Nota_Cabeca.SQL.Add('Select * from Entrada_Nota_Cabeca Order By Entrada_Nota_Cabeca_Numero Desc');
      ConexaoBD.SQL_Entrada_Nota_Cabeca.Open;

      Nro_Cabeca := ConexaoBD.SQL_Entrada_Nota_CabecaEntrada_Nota_Cabeca_Numero.Text;

      For Ind := 1 To (Entrada_Produtos.RowCount - 1) Do
          Begin

          If Trim(Entrada_Produtos.Cells[0,Ind]) <> '' Then
             Begin
             ComandoSQL := 'Insert into Entrada_Nota_Produto(';
             ComandoSQL := ComandoSQL + 'Entrada_Nota_Produto_Cabeca, ';
             ComandoSQL := ComandoSQL + 'Entrada_Nota_Produto_Cod, ';
             ComandoSQL := ComandoSQL + 'Entrada_Nota_Produto_Desc, ';
             ComandoSQL := ComandoSQL + 'Entrada_Nota_Produto_Qtde, ';
             ComandoSQL := ComandoSQL + 'Entrada_Nota_Produto_Unit, ';
             ComandoSQL := ComandoSQL + 'Entrada_Nota_Produto_Total) ';
             ComandoSQL := ComandoSQL + 'Values(';
             ComandoSQL := ComandoSQL + #39 + Nro_Cabeca + #39 + ',';
             ComandoSQL := ComandoSQL + Entrada_Produtos.Cells[0,Ind] + ',';
             ComandoSQL := ComandoSQL + #39 + Entrada_Produtos.Cells[1,Ind] + #39 + ',';
             ComandoSQL := ComandoSQL + Entrada_Produtos.Cells[2,Ind] + ',';
             ComandoSQL := ComandoSQL + Virgula_Ponto(Entrada_Produtos.Cells[3,Ind]) + ',';
             ComandoSQL := ComandoSQL + Virgula_Ponto(Entrada_Produtos.Cells[4,Ind]) + ')';

             ConexaoBD.SQL_Comunitario.Close;
             ConexaoBD.SQL_Comunitario.SQL.Clear;
             ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
             ConexaoBD.SQL_Comunitario.ExecSQL;
          End;
      End;

      If Ajusta_Estoque.Checked Then
         Begin

         For Ind := 1 To (Entrada_Produtos.RowCount - 1) Do
             Begin

             If Trim(Entrada_Produtos.Cells[0,Ind]) <> '' Then
                Begin
                ComandoSQL := 'Update Produtos Set ';
                ComandoSQL := ComandoSQL + ' Produto_Estoque_Atual = Produto_Estoque_Atual + ' + Trim(Entrada_Produtos.Cells[2,Ind]);
                ComandoSQL := ComandoSQL + ' Where  Produto_Codigo = ' + Trim(Entrada_Produtos.Cells[0,Ind]);

                ConexaoBD.SQL_Comunitario.SQL.Clear;
                ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
                ConexaoBD.SQL_Comunitario.ExecSQL;
             End;
         End;

      End;

      Seta();
      MSG_Erro('Inclusão efetuada com sucesso...');

      EntradaProdutosNF00.Close;
    End;
end;

end.
