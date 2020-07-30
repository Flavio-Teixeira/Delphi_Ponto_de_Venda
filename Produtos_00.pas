unit Produtos_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TProdutos00 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    BT_Buscar: TBitBtn;
    ComboLocalBusca: TComboBox;
    EditBusca: TMaskEdit;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    BT_Incluir: TBitBtn;
    BT_Sair: TBitBtn;
    GridProdutos: TDBGrid;
    Edit_Tipo: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridProdutosCellClick(Column: TColumn);
    procedure ComboLocalBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure EditBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure ComboLocalBuscaChange(Sender: TObject);
    procedure BT_BuscarClick(Sender: TObject);
    procedure BT_IncluirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EditBuscaChange(Sender: TObject);
  private
    { Private declarations }
    procedure Procura_Produto();

  public
    { Public declarations }
  end;

var
  Produtos00: TProdutos00;

implementation

uses Conexao_BD, Produtos_02, Produtos_01, Rotinas_Gerais, Principal_00,
  Trocas_01, Trocas_02;

{$R *.dfm}

procedure TProdutos00.BT_SairClick(Sender: TObject);
begin
  Produtos00.Close;
end;

procedure TProdutos00.FormShow(Sender: TObject);
begin
    Ampulheta();

    //*** Mostra a Barra de Rolagem no Grid ***
    ShowScrollBar(GridProdutos.Handle,SB_VERT,True);

    If (Trim(Principal.Edit_Cor_Grid.Text) <> '') And (Trim(Principal.Edit_Cor_Letra.Text) <> '') Then
       Begin
       GridProdutos.Color      := StringToColor(Principal.Edit_Cor_Grid.Text);
       GridProdutos.Font.Color := StringToColor(Principal.Edit_Cor_Letra.Text);
    End;

    If Trim(Edit_Tipo.Text) = 'Perdas' Then
       Begin
       ComboLocalBusca.ItemIndex := 6;
       BT_Incluir.Visible        := False;
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
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where (Produto_Codigo = ' + Trim(EditBusca.Text) + ') Or (Produto_Cod_Barra = "' + Trim(EditBusca.Text) + '")');
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

procedure TProdutos00.GridProdutosCellClick(Column: TColumn);

var
   Comando_SQL, Itens_Perdidos, Itens_Qtde: String;
   Nro_Itens_Perdidos, Erro_Itens, Ind: Integer;
   
begin
    If Trim(GridProdutos.Fields[0].Text) <> '' Then
      Begin

      If Trim(Edit_Tipo.Text)='Frente_Loja' Then
        Begin

          If Confirma('Deseja adicionar o Produto ' + Trim(GridProdutos.Fields[1].Text) + ' ao Cupom ?')=6 Then
            Begin

            Itens_Qtde := InputBox('Quantidade a ser Adicionada', 'Por favor, informe qual a quantidade de itens a ser adicionada:', Itens_Qtde);

            If Trim(Itens_Qtde) <> '' Then
               Begin

               If Trim(Itens_Qtde) = '0' Then
                  Begin
                  Itens_Qtde := '';
               End;
            End;

            If Trim(Itens_Qtde) <> '' Then
               Begin
               Movto_Lista(Trim(Itens_Qtde) + '*' + Trim(GridProdutos.Fields[7].Text),'Código_Barras','+',1);
               End
            Else
               Begin
               Movto_Lista(Trim(GridProdutos.Fields[7].Text),'Código_Barras','+',1);
            End;

            Produtos00.Close;
          End;

        End
      Else If Trim(Edit_Tipo.Text)='Perdas' Then
        Begin

          If Confirma('Deseja adicionar o Produto ' + Trim(GridProdutos.Fields[1].Text) + ' às Perdas?')=6 Then
            Begin

            Itens_Perdidos := InputBox('Quantidade de Itens', 'Por favor, informe qual a quantidade de itens perdidos, no momento, para este produto:', Itens_Perdidos);

            If Trim(Itens_Perdidos) = '' Then
               Begin
               Itens_Perdidos := '0';
            End;

            val(Itens_Perdidos, Nro_Itens_Perdidos, Erro_Itens);

            If Erro_Itens <> 0 Then
               Begin
               Nro_Itens_Perdidos := 1;
            End;

            For ind := 1 To Nro_Itens_Perdidos Do
                Begin
                Comando_SQL := 'INSERT INTO perdas(';
                Comando_SQL := Comando_SQL + 'perda_data, ';
                Comando_SQL := Comando_SQL + 'perda_produto_codigo_barras, ';
                Comando_SQL := Comando_SQL + 'perda_produto_descricao, ';
                Comando_SQL := Comando_SQL + 'perda_produto_custo) ';
                Comando_SQL := Comando_SQL + 'VALUES(';
                Comando_SQL := Comando_SQL + #39+ Inverte_Data_Plus(Trim(DateToStr(Date())),'amd','-') +#39+ ', ';
                Comando_SQL := Comando_SQL + #39+ Trim(GridProdutos.Fields[7].Text) +#39+ ', ';
                Comando_SQL := Comando_SQL + #39+ Trim(GridProdutos.Fields[1].Text) +#39+ ', ';
                Comando_SQL := Comando_SQL + #39+ Virgula_Ponto(Trim(GridProdutos.Fields[10].Text)) +#39+ ') ';

                //*** Insere o Registro ***
                ConexaoBD.SQL_Comunitario.SQL.Clear;
                ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Comunitario.ExecSQL;

                //*** Retira o Produto do Estoque ***
                Comando_SQL := 'UPDATE Produtos SET ';
                Comando_SQL := Comando_SQL + 'Produto_Estoque_Atual = (Produto_Estoque_Atual - 1), ';
                Comando_SQL := Comando_SQL + 'Produto_Pedido_Qtde_Perdas = (Produto_Pedido_Qtde_Perdas + 1) ';
                Comando_SQL := Comando_SQL + 'WHERE Produto_Cod_Barra = ' + #39+ Trim(GridProdutos.Fields[7].Text) + #39;

                ConexaoBD.SQL_Comunitario.SQL.Clear;
                ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                ConexaoBD.SQL_Comunitario.ExecSQL;
            End;

            //*** Fecha a Tela de Produtos ***
            Produtos00.Close;
          End;

        End
      Else If Trim(Edit_Tipo.Text)='Troca' Then
        Begin

          If Confirma('Deseja adicionar o Produto ' + Trim(GridProdutos.Fields[1].Text) + ' a Troca?')=6 Then
            Begin
            Trocas01.Troca_Codigo.Text    := Trim(GridProdutos.Fields[0].Text);
            Trocas01.Troca_Descricao.Text := Trim(GridProdutos.Fields[1].Text);

            Produtos00.Close;
          End;

        End
      Else If Trim(Edit_Tipo.Text)='Troca_Alteracao' Then
        Begin

          If Confirma('Deseja adicionar o Produto ' + Trim(GridProdutos.Fields[1].Text) + ' a Troca?')=6 Then
            Begin
            Trocas02.Troca_Codigo.Text    := Trim(GridProdutos.Fields[0].Text);
            Trocas02.Troca_Descricao.Text := Trim(GridProdutos.Fields[1].Text);

            Produtos00.Close;
          End;

        End
      Else
        Begin
        Application.CreateForm(TProdutos02,Produtos02);

        Ampulheta();
          Produtos02.lblCodigo.Caption    := Trim(GridProdutos.Fields[0].Text);
          Produtos02.EditGrupo_Ant.Text   := Trim(GridProdutos.Fields[4].Text);
          Produtos02.EditFor_Cod_Ant.Text := Trim(GridProdutos.Fields[5].Text);
          Produtos02.EditFor_Desc_Ant.Text:= Trim(GridProdutos.Fields[6].Text);
        Seta();

        Produtos00.Visible  := False;
        Produtos02.ShowModal;
        Produtos02.Destroy;
        Produtos00.Visible  := True;
      End;

    End;
End;

procedure TProdutos00.ComboLocalBuscaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #27 Then
        Begin
        Produtos00.Close;
     End;

    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TProdutos00.EditBuscaKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #27 Then
        Begin
        Produtos00.Close;
     End;

    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
      End
    Else
      Begin
      If (Trim(ComboLocalBusca.Text) = 'Código') Or (Trim(ComboLocalBusca.Text) = 'Grupo') Or
      (Trim(ComboLocalBusca.Text) = 'Preço') Or (Trim(ComboLocalBusca.Text) = 'Código de Barra') Or
      (Trim(ComboLocalBusca.Text) = 'Estoque') Then
        Begin
        //So_Valor(Sender,Key);        
      End;
    End;
end;

procedure TProdutos00.ComboLocalBuscaChange(Sender: TObject);
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

procedure TProdutos00.Procura_Produto();
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
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where (Produto_Codigo = ' + Trim(EditBusca.Text) + ') Or (Produto_Cod_Barra = "' + Trim(EditBusca.Text) + '")');
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
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Cod_Barra = "' + Trim(EditBusca.Text) + '"');
          End

        Else

          Begin
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Estoque_Atual Like "%' + Trim(EditBusca.Text) + '%"');

        End;

    End;
    ConexaoBD.SQL_Produtos.Open;

    If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
       Begin

       If (Trim(Edit_Tipo.Text) <> 'Frente_Loja') And (Trim(Edit_Tipo.Text) <> 'Perdas') Then
          Begin

          If ConexaoBD.SQL_Produtos.RecordCount <= 1 Then
             Begin
             Ampulheta();

             Application.CreateForm(TProdutos02,Produtos02);

             Produtos02.lblCodigo.Caption    := Trim(GridProdutos.Fields[0].Text);
             Produtos02.EditGrupo_Ant.Text   := Trim(GridProdutos.Fields[4].Text);
             Produtos02.EditFor_Cod_Ant.Text := Trim(GridProdutos.Fields[5].Text);
             Produtos02.EditFor_Desc_Ant.Text:= Trim(GridProdutos.Fields[6].Text);

             Seta();

             Produtos00.Visible := False;
             Produtos02.ShowModal;
             Produtos02.Destroy;
             Produtos00.Visible := True;
          End;
       End;

       End
    Else
       Begin
       If Confirma('Produto NÃo cadastrado... Deseja incluir?')= 6 Then
          Begin

          Application.CreateForm(TProdutos01,Produtos01);

          If Trim(ComboLocalBusca.Text) = 'Código de Barra' Then
             Begin
             Ampulheta();
             Produtos01.Cod_Fornecedores.Text    := Copy(Trim(EditBusca.Text),4,4);
             Produtos01.EditCod_Barra.Text       := Trim(EditBusca.Text);
             Seta();
          End;

          Produtos00.Visible := False;
          Produtos01.ShowModal;
          Produtos01.Destroy;
          Produtos00.Visible := True;

       End;
    End;

    GridProdutos.Refresh;

    EditBusca.Text := '';
    EditBusca.SetFocus;
end;


procedure TProdutos00.BT_BuscarClick(Sender: TObject);
begin
     Procura_Produto();
end;

procedure TProdutos00.BT_IncluirClick(Sender: TObject);
begin
    Application.CreateForm(TProdutos01,Produtos01);
    Produtos00.Visible  := False;
    Produtos01.ShowModal;
    Produtos01.Destroy;
    Produtos00.Visible  := True;
end;

procedure TProdutos00.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #27 Then
        Begin
        Produtos00.Close;
     End;
end;

procedure TProdutos00.EditBuscaChange(Sender: TObject);
begin
      If Trim(ComboLocalBusca.Text) = 'Código de Barra' Then
         Begin

         If (Length(EditBusca.Text)>12) Then
            Begin
            BT_Buscar.SetFocus;            
         End;

      End;
end;

end.


