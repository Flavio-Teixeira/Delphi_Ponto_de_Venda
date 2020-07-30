unit Inventario_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Mask, Buttons, ExtCtrls;

type
  TInventario00 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    BT_Buscar: TBitBtn;
    ComboLocalBusca: TComboBox;
    EditBusca: TMaskEdit;
    GroupBox2: TGroupBox;
    GridProdutos: TDBGrid;
    Panel2: TPanel;
    BT_Sair: TBitBtn;
    Edit_Tipo: TEdit;
    BT_Imprimir: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure BT_BuscarClick(Sender: TObject);
    procedure ComboLocalBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure EditBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Inventario00: TInventario00;

implementation

uses Conexao_BD, Rotinas_Gerais, Inventario_01, Principal_00;

{$R *.dfm}

procedure TInventario00.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #27 Then
        Begin
        Inventario00.Close;
     End;
end;

procedure TInventario00.FormShow(Sender: TObject);
begin
    Ampulheta();

    //*** Mostra a Barra de Rolagem no Grid ***
    ShowScrollBar(GridProdutos.Handle,SB_VERT,True);

    If (Trim(Principal.Edit_Cor_Grid.Text) <> '') And (Trim(Principal.Edit_Cor_Letra.Text) <> '') Then
       Begin
       GridProdutos.Color      := StringToColor(Principal.Edit_Cor_Grid.Text);
       GridProdutos.Font.Color := StringToColor(Principal.Edit_Cor_Letra.Text);
    End;

    ConexaoBD.SQL_Produtos.Close;
    ConexaoBD.SQL_Produtos.SQL.Clear;
    If Trim(EditBusca.Text) = '' Then
      Begin

        If Trim(ComboLocalBusca.Text)= 'Código' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Order By Produto_Codigo');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Descrição' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Order By Produto_Descricao');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Unidade' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Order By Produto_Unidade');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Fornecedor' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Order By Produto_Fornecedor_Desc');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Preço' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Order By Produto_Preco_Varejo');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Código de Barra' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Order By Produto_Cod_Barra');
          End

        Else

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Order By Produto_Estoque_Atual');

        End;

      End
    Else
      Begin

        If Trim(ComboLocalBusca.Text)= 'Código' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where (Produto_Codigo = ' + Trim(EditBusca.Text) + ') Or (Produto_Cod_Barra = "' + Trim(EditBusca.Text) + '") ');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Descrição' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where (Produto_Descricao Like "%' + Trim(EditBusca.Text) + '%")Or(Produto_Descricao_Curta Like "%' + Trim(EditBusca.Text) + '%")');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Unidade' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Unidade Like "%' + Trim(EditBusca.Text) + '%"');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Grupo' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Grupo Like "%' + Trim(EditBusca.Text) + '%"');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Fornecedor' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Fornecedor_Desc Like "%' + Trim(EditBusca.Text) + '%"');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Preço' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Preco_Varejo Like "%' + Trim(EditBusca.Text) + '%"');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Código de Barra' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Cod_Barra Like "%' + Trim(EditBusca.Text) + '%"');
          End

        Else

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Estoque_Atual Like "%' + Trim(EditBusca.Text) + '%"');

        End;

    End;
    ConexaoBD.SQL_Produtos.Open;

    GridProdutos.Refresh;

    EditBusca.SetFocus;

    Seta();
end;

procedure TInventario00.BT_SairClick(Sender: TObject);
begin
     Inventario00.Close;
end;

procedure TInventario00.BT_BuscarClick(Sender: TObject);
begin
    ConexaoBD.SQL_Produtos.Close;
    ConexaoBD.SQL_Produtos.SQL.Clear;
    If Trim(EditBusca.Text) = '' Then
      Begin

        If Trim(ComboLocalBusca.Text)= 'Código' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Order By Produto_Codigo');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Descrição' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Order By Produto_Descricao');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Unidade' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Order By Produto_Unidade');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Fornecedor' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Order By Produto_Fornecedor_Desc');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Preço' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Order By Produto_Preco_Varejo');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Código de Barra' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Order By Produto_Cod_Barra');
          End

        Else

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Order By Produto_Estoque_Atual');

        End;

      End
    Else
      Begin

        If Trim(ComboLocalBusca.Text)= 'Código' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where (Produto_Codigo = ' + Trim(EditBusca.Text) + ') Or (Produto_Cod_Barra = "' + Trim(EditBusca.Text) + '") ');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Descrição' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where (Produto_Descricao Like "%' + Trim(EditBusca.Text) + '%")Or(Produto_Descricao_Curta Like "%' + Trim(EditBusca.Text) + '%")');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Unidade' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Unidade Like "%' + Trim(EditBusca.Text) + '%"');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Grupo' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Grupo Like "%' + Trim(EditBusca.Text) + '%"');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Fornecedor' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Fornecedor_Desc Like "%' + Trim(EditBusca.Text) + '%"');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Preço' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Preco_Varejo Like "%' + Trim(EditBusca.Text) + '%"');
          End

        Else If Trim(ComboLocalBusca.Text)= 'Código de Barra' Then

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Cod_Barra Like "%' + Trim(EditBusca.Text) + '%"');
          End

        Else

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Estoque_Atual Like "%' + Trim(EditBusca.Text) + '%"');

        End;

    End;
    ConexaoBD.SQL_Produtos.Open;

    If ConexaoBD.SQL_Produtos.RecordCount <= 0 Then
       Begin
       MSG_Erro('Produto NÃo cadastrado...');
    End;

    GridProdutos.Refresh;

    EditBusca.SetFocus;
end;

procedure TInventario00.ComboLocalBuscaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #27 Then
        Begin
        Inventario00.Close;
     End;

    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TInventario00.EditBuscaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #27 Then
        Begin
        Inventario00.Close;
     End;

    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TInventario00.BT_ImprimirClick(Sender: TObject);
begin
     Application.CreateForm(TInventario01,Inventario01);
     Inventario01.QR_Posicao_Estoque.PreviewModal;
     Inventario01.QR_Posicao_Estoque.Destroy;
     Inventario01.Destroy;
end;

end.
