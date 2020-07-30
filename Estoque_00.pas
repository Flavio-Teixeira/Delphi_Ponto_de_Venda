unit Estoque_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TEstoque00 = class(TForm)
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
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboLocalBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure EditBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure GridProdutosCellClick(Column: TColumn);
    procedure ComboLocalBuscaChange(Sender: TObject);
    procedure BT_BuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Estoque00: TEstoque00;

implementation

uses Conexao_BD, Rotinas_Gerais, Estoque_01, Principal_00;

{$R *.dfm}

procedure TEstoque00.BT_SairClick(Sender: TObject);
begin
    Estoque00.Close;
end;

procedure TEstoque00.FormShow(Sender: TObject);
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
    ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Order By Produto_Codigo');
    ConexaoBD.SQL_Produtos.Open;
    GridProdutos.Refresh;

    Seta();
end;

procedure TEstoque00.ComboLocalBuscaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TEstoque00.EditBuscaKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TEstoque00.GridProdutosCellClick(Column: TColumn);
begin
    If Trim(GridProdutos.Fields[0].Text) <> '' Then
      Begin

        Application.CreateForm(TEstoque01,Estoque01);

        Ampulheta();
          Estoque01.lblCodigo.Caption     := Trim(GridProdutos.Fields[0].Text);
          Estoque01.lblDescricao.Caption  := Trim(GridProdutos.Fields[1].Text);
          Estoque01.Qtd_Atual.Text        := Trim(GridProdutos.Fields[2].Text);
        Seta();

        Estoque00.Visible  := False;
        Estoque01.ShowModal;
        Estoque01.Destroy;
        Estoque00.Visible  := True;

    End;
end;

procedure TEstoque00.ComboLocalBuscaChange(Sender: TObject);
begin
    If Trim(ComboLocalBusca.Text) = 'Descrição' Then
      Begin
      EditBusca.Text      := '';
      EditBusca.EditMask  := '';
      EditBusca.MaxLength :=100;
      End
    Else If Trim(ComboLocalBusca.Text) = 'Unidade' Then
      Begin
      EditBusca.Text      := '';
      EditBusca.EditMask  := '';
      EditBusca.MaxLength := 05;
      End
    Else If (Trim(ComboLocalBusca.Text) = 'Fornecedor') Or (Trim(ComboLocalBusca.Text) = 'Código de Barra') Then
      Begin
      EditBusca.Text      := '';
      EditBusca.EditMask  := '';
      EditBusca.MaxLength := 50;
      End
    Else
      Begin
      EditBusca.Text      := '';
      EditBusca.EditMask  := '';
      EditBusca.MaxLength := 10;
    End;
end;

procedure TEstoque00.BT_BuscarClick(Sender: TObject);
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
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Codigo Like "%' + Trim(EditBusca.Text) + '%"');
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
end;

end.
