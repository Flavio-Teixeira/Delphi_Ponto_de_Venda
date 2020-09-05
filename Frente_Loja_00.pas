unit Frente_Loja_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, Buttons, Menus, Gauges;

type
  TFrente_Loja00 = class(TForm)
    Panel_Principal: TPanel;
    Dados_Produto: TGroupBox;
    lblCod_Barras: TLabel;
    lblDescricao: TLabel;
    EditCod_Barras: TEdit;
    Compra: TPanel;
    Titulo_Lista_Compras: TPanel;
    Lista_Itens: TStringGrid;
    Panel_Totais: TPanel;
    Panel11: TPanel;
    Label20: TLabel;
    Total_Vlr_Compra: TLabel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label27: TLabel;
    Total_Qtd_Compra: TLabel;
    EditPermissao_Acesso: TEdit;
    EditNro_Linha: TEdit;
    EditFoco_Linha: TEdit;
    EditNro_Cupom: TEdit;
    EditPermissao_Fechamento: TEdit;
    Menu_Loja: TMainMenu;
    mnuLista_Compras: TMenuItem;
    mnuLista_Multiplicacao: TMenuItem;
    mnuLista_Soma: TMenuItem;
    mnuLista_Subtracao: TMenuItem;
    mnuLista_Apaga: TMenuItem;
    mnuTeclas_Atalho: TMenuItem;
    mnuTeclas_F01: TMenuItem;
    mnuTeclas_F02: TMenuItem;
    mnuTeclas_F03: TMenuItem;
    mnuTeclas_F04: TMenuItem;
    mnuTeclas_F05: TMenuItem;
    mnuTeclas_F06: TMenuItem;
    mnuTeclas_F07: TMenuItem;
    mnuTeclas_F09: TMenuItem;
    mnuTeclas_F10: TMenuItem;
    mnuSair: TMenuItem;
    EditQuantidade: TEdit;
    Panel1: TPanel;
    Nome_Loja: TLabel;
    EditDescricao: TLabel;
    mnuTeclas_F11: TMenuItem;
    Label1: TLabel;
    Porcentagem_Venda_Total: TGauge;
    Vezes_Teclado: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    EditCodCliente: TEdit;
    EditNomeCliente: TEdit;
    EditVinculoCliente: TCheckBox;
    Label4: TLabel;
    Nome_Vendedor: TLabel;
    EditDesconto: TEdit;
    BTN_Emite_Nota: TBitBtn;
    NFP_Consumidor: TRadioButton;
    NFP_Produto: TRadioButton;
    NFP_Site: TRadioButton;

    procedure FormShow(Sender: TObject);

    procedure EditCod_BarrasChange(Sender: TObject);
    procedure EditCod_BarrasKeyPress(Sender: TObject; var Key: Char);

    procedure Lista_ItensClick(Sender: TObject);

    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure mnuLista_MultiplicacaoClick(Sender: TObject); // Multiplica a Quantidade
    procedure mnuLista_SomaClick(Sender: TObject);          // Soma a Quantidade
    procedure mnuLista_SubtracaoClick(Sender: TObject);     // Subtari a Quantidade
    procedure mnuLista_ApagaClick(Sender: TObject);         // Apaga o Item

    procedure mnuTeclas_F01Click(Sender: TObject); // Abertura do Caixa
    procedure mnuTeclas_F02Click(Sender: TObject); // Fechamenro do Caixa
    procedure mnuTeclas_F03Click(Sender: TObject); // Depósito / Entrada no Caixa
    procedure mnuTeclas_F04Click(Sender: TObject); // Sangria / Retirada no Caixa
    procedure mnuTeclas_F05Click(Sender: TObject); // Cancela Cupom Atual
    procedure mnuTeclas_F06Click(Sender: TObject); // Cancela Cupom Impresso
    procedure mnuTeclas_F07Click(Sender: TObject); // Busca por Produto
    procedure mnuTeclas_F09Click(Sender: TObject); // Abrir Gaveta
    procedure mnuTeclas_F10Click(Sender: TObject); // Fecha o Cupom

    procedure mnuSairClick(Sender: TObject);
    procedure mnuTeclas_F11Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditCodClienteKeyPress(Sender: TObject; var Key: Char);
    procedure BTN_Emite_NotaClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frente_Loja00: TFrente_Loja00;
  Str_Codigo   : String;
  Str_Descricao: String;
  Str_Qtde     : String;
  Str_Vlr_Unit : String;
  Str_Vlr_Total: String;

implementation

uses Conexao_BD, Rotinas_Gerais,Mvto_Compra_00, Cancela_Cupons_00,
  Caixa_Abertura_00, Caixa_Fechamento_00, Caixa_Deposito_00,
  Caixa_Sangria_00, Produtos_00, Cancela_Cupons_Login_00,
  Abertura_Caixa_F9, Caixa_Sangria_01, Apaga_Item_00,
  Caixa_Sangria_Acesso_00, Caixa_Sangria_02, Caixa_Sangria_Login_00,
  Principal_00, Splash_Screen, Clientes_00, Notas_Fiscais_00, Notas_Fiscais_01,
  Notas_Fiscais_02;

{$R *.dfm}

Procedure TFrente_Loja00.FormShow(Sender: TObject);
Begin
    Ampulheta();

    Application.CreateForm(TSplashScreen,SplashScreen);
    SplashScreen.Show;
    SplashScreen.LBL_Registro.Caption := 'Inciando Caixa...';
    SplashScreen.Refresh;

    If (Trim(Principal.Edit_Cor_Grid.Text) <> '') And (Trim(Principal.Edit_Cor_Letra.Text) <> '') Then Begin
      Lista_Itens.Color      := StringToColor(Principal.Edit_Cor_Grid.Text);
      Lista_Itens.Font.Color := StringToColor(Principal.Edit_Cor_Letra.Text);
    End;

    Prepara_Caixa();

    SplashScreen.Refresh;

    If (EditPermissao_Acesso.Text = 'S') Then Begin
      // Inicializa a Frente de Loja
      Prepara_Tela();
      EditPermissao_Fechamento.Text := 'S';
    End;

    SplashScreen.Close;

    If EditVinculoCliente.Checked Then
       Begin
       EditCodCliente.SetFocus;
    End;

    EditDesconto.Text := '0';

    Seta();
End;

Procedure TFrente_Loja00.EditCod_BarrasChange(Sender: TObject);

var
   Verifica_Tecla: String;
   Ind, Qtde_Posicao: Integer;

Begin
     Verifica_Tecla := Trim(EditCod_Barras.Text);
     Qtde_Posicao   := 0;

     If Length(Trim(EditCod_Barras.Text)) <= 0 Then
        Begin
        Vezes_Teclado.Text := 'N';
     End;

     For Ind := 1 To Length(Trim(EditCod_Barras.Text)) Do
         Begin
         If Verifica_Tecla[Ind] = '*' Then
            Begin
            Qtde_Posicao       := Qtde_Posicao + 1;
            Vezes_Teclado.Text := 'S';
            Break;
         End;

         Qtde_Posicao := Qtde_Posicao + 1;
     End;

     If Trim(Vezes_Teclado.Text) = 'S' Then
        Begin

        If ((Length(EditCod_Barras.Text) - Qtde_Posicao) >12) Then
           Begin
           Ampulheta();
           Movto_Lista(Trim(EditCod_Barras.Text),'Código_Barras','+',StrToInt(EditQuantidade.Text));
           EditQuantidade.Text := '1';
           Seta();
        End;

        End
     Else
        Begin

        If (Length(EditCod_Barras.Text)>12) Then
           Begin
           Ampulheta();
           Movto_Lista(Trim(EditCod_Barras.Text),'Código_Barras','+',StrToInt(EditQuantidade.Text));
           EditQuantidade.Text := '1';
           Seta();
        End;

     End;
End;

Procedure TFrente_Loja00.EditCod_BarrasKeyPress(Sender: TObject; var Key: Char);
Begin
    If Key = #13 Then
      Begin

      If Trim(EditCod_Barras.Text)<>'' Then
         Begin
         Ampulheta();
         Movto_Lista(Trim(EditCod_Barras.Text),'Código_Barras','+',StrToInt(EditQuantidade.Text));
         EditQuantidade.Text := '1';
        Seta();
      End;

      Vezes_Teclado.Text := 'N';
      EditCod_Barras.SetFocus;
    End;
End;

procedure TFrente_Loja00.Lista_ItensClick(Sender: TObject);
begin
    If Trim(Lista_Itens.Cells[0,Lista_Itens.Row])<>'' Then
      Begin
        EditFoco_Linha.Text:= IntToStr(Lista_Itens.Row);
    End;
end;

procedure TFrente_Loja00.FormKeyPress(Sender: TObject; var Key: Char);
begin

    If Key = #27 Then
      Begin

      If Confirma('Deseja realmente sair do Aplicativo ?')=6 Then
         Begin
         If Trim(Frente_Loja00.EditNro_Linha.Text)<>'0' Then
            Begin
            Msg_Erro('Não é possível sair enquanto o Cupom não for Fechado...');
            End
         Else
            Begin
            Deleta_Registro_Vendas(Trim(Numero_HD('C')));
            Frente_Loja00.Close;
         End;
      End;

      End
   { Else If Key = #42 Then
      Begin

        If Trim(EditPermissao_Fechamento.Text) = 'S' Then
          Begin
            Application.CreateForm(TMvto_Compra00,Mvto_Compra00);

            Ampulheta();
              Mvto_Compra00.Titulo_Lista_Compras.Caption  := '  Lista de Compras >> Multiplicação';
              Mvto_Compra00.lbl_Codigo.Visible     := False;
              Mvto_Compra00.txt_Codigo.Visible     := False;
              Mvto_Compra00.lbl_Descricao.Visible  := False;
              Mvto_Compra00.txt_Descricao.Visible  := False;
              Mvto_Compra00.lbl_Vlt_Unit.Visible   := False;
              Mvto_Compra00.txt_Vlt_Unit.Visible   := False;
              Mvto_Compra00.lbl_Vlr_Total.Visible  := False;
              Mvto_Compra00.txt_Vlr_Total.Visible  := False;
              Mvto_Compra00.lbl_Operacao.Caption:= 'x';
            Seta();

            Mvto_Compra00.ShowModal;
            Mvto_Compra00.Destroy;
        End;

      End }
    Else
      Begin

        Str_Codigo    := Trim(Lista_Itens.Cells[0,StrToInt(EditFoco_Linha.Text)]);
        Str_Descricao := Trim(Lista_Itens.Cells[1,StrToInt(EditFoco_Linha.Text)]);
        Str_Vlr_Unit  := Trim(Lista_Itens.Cells[3,StrToInt(EditFoco_Linha.Text)]);
        Str_Vlr_Total := Trim(Lista_Itens.Cells[4,StrToInt(EditFoco_Linha.Text)]);

        If Str_Codigo <> '' Then
          Begin

            If Key = #43 Then
              Begin

                Application.CreateForm(TMvto_Compra00,Mvto_Compra00);

                Ampulheta();
                  Mvto_Compra00.Titulo_Lista_Compras.Caption  := '  Lista de Compras >> Soma';
                  Mvto_Compra00.txt_Codigo.Text     := Str_Codigo    ;
                  Mvto_Compra00.txt_Descricao.Text  := Str_Descricao ;
                  Mvto_Compra00.txt_Vlt_Unit.Text   := Str_Vlr_Unit      ;
                  Mvto_Compra00.txt_Vlr_Total.Text  := Str_Vlr_Total  ;
                  Mvto_Compra00.lbl_Operacao.Caption:= '+';
                Seta();

                Mvto_Compra00.ShowModal;
                Mvto_Compra00.Destroy;

              End
            Else If Key = #45 Then
              Begin

                Application.CreateForm(TMvto_Compra00,Mvto_Compra00);

                Ampulheta();
                  Mvto_Compra00.Titulo_Lista_Compras.Caption  := '  Lista de Compras >> Subtração  ';
                  Mvto_Compra00.txt_Codigo.Text     := Str_Codigo    ;
                  Mvto_Compra00.txt_Descricao.Text  := Str_Descricao ;
                  Mvto_Compra00.txt_Vlt_Unit.Text   := Str_Vlr_Unit      ;
                  Mvto_Compra00.txt_Vlr_Total.Text  := Str_Vlr_Total  ;
                  Mvto_Compra00.lbl_Operacao.Caption:= '-';
                Seta();

                Mvto_Compra00.ShowModal;
                Mvto_Compra00.Destroy;

            End;

        End;

    End;

end;

procedure TFrente_Loja00.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

    If Key = vk_F1 Then
      Begin
        If EditPermissao_Acesso.Text='N' Then
          Begin
            // Abrir Tela de Abertura
            Application.CreateForm(TCaixa_Abertura00,Caixa_Abertura00);
            Caixa_Abertura00.ShowModal;
            Caixa_Abertura00.Destroy;

            If EditPermissao_Acesso.Text='S' Then
              Begin
              Frente_Loja00.Close;
            End;

          End
        Else
          Begin
            Msg_Erro('O Caixa já foi Aberto Hoje !');
        End;
      End
    Else If Key = vk_F2 Then
      Begin
        // Abrir Tela de Abertura
        If Trim(EditPermissao_Fechamento.Text) = 'S' Then
          Begin
            //Fechamento_Caixa();
            Application.CreateForm(TCaixa_Fechamento00,Caixa_Fechamento00);
            Caixa_Fechamento00.ShowModal;
            Caixa_Fechamento00.Destroy;

            If Trim(EditPermissao_Fechamento.Text)='Sair' Then
              Begin
              Frente_Loja00.Close;
            End;

        End;

      End

    Else If Key = vk_F3 Then
      Begin
        If Trim(EditPermissao_Fechamento.Text) = 'S' Then
          Begin
            {Application.CreateForm(TCaixa_Deposito00,Caixa_Deposito00);
            Caixa_Deposito00.ShowModal;
            Caixa_Deposito00.Destroy;}

            Application.CreateForm(TApagaItem00,ApagaItem00);
            ApagaItem00.ShowModal;
            ApagaItem00.Destroy;

            Vezes_Teclado.Text := 'N';
            EditCod_Barras.SetFocus;
        End;
      End

    Else If Key = vk_F4 Then
      Begin
        If Trim(EditPermissao_Fechamento.Text) = 'S' Then
          Begin
          If UpperCase(Trim(Principal.Edit_Gaveta.Text)) = 'S' Then
             Begin
             Application.CreateForm(TCaixa_Sangria01,Caixa_Sangria01);
             Caixa_Sangria01.ShowModal;
             Caixa_Sangria01.Destroy;
          End;

          Application.CreateForm(TCaixa_Sangria00,Caixa_Sangria00);
          Caixa_Sangria00.ShowModal;
          Caixa_Sangria00.Destroy;
        End;
      End

    Else If Key = vk_F5 Then
      Begin
        If Trim(EditPermissao_Fechamento.Text) = 'S' Then
          Begin
            Application.CreateForm(TCancela_Cupons_Login00,Cancela_Cupons_Login00);
            Cancela_Cupons_Login00.Tipo_Cancelamento.Text := 'F5';
            Cancela_Cupons_Login00.ShowModal;
            Cancela_Cupons_Login00.Destroy;
        End;
      End

    Else If Key = vk_F6 Then
      Begin
        If Trim(EditPermissao_Fechamento.Text) = 'S' Then
          Begin
            Application.CreateForm(TCancela_Cupons_Login00,Cancela_Cupons_Login00);
            Cancela_Cupons_Login00.Tipo_Cancelamento.Text := 'F6';
            Cancela_Cupons_Login00.ShowModal;
            Cancela_Cupons_Login00.Destroy;
        End;
      End

    Else If Key = vk_F7 Then
      Begin
        If Trim(EditPermissao_Fechamento.Text) = 'S' Then
          Begin
            Application.CreateForm(TProdutos00,Produtos00);
            Produtos00.Edit_Tipo.Text:= 'Frente_Loja';
            Produtos00.ShowModal;
            Produtos00.Destroy;
        End;
      End

    Else If Key = vk_F9 Then
      Begin
        If Trim(EditPermissao_Fechamento.Text) = 'S' Then
          Begin
            Application.CreateForm(TAbertura_CaixaF9,Abertura_CaixaF9);
            Abertura_CaixaF9.ShowModal;
            Abertura_CaixaF9.Destroy;
        End;
      End

    Else If Key = vk_F10 Then
      Begin
        Fecha_Cupom();
      End

    Else If Key = vk_F11 Then
      Begin
        If Trim(EditPermissao_Fechamento.Text) = 'S' Then
          Begin
            Application.CreateForm(TCaixa_Sangria_Login00,Caixa_Sangria_Login00);
            Caixa_Sangria_Login00.ShowModal;
            Caixa_Sangria_Login00.Destroy;
        End;
     { End

    Else If Key = vk_Delete Then
      Begin
      Application.CreateForm(TApagaItem00,ApagaItem00);
      ApagaItem00.ShowModal;
      ApagaItem00.Destroy;

      Vezes_Teclado.Text := 'N';
      EditCod_Barras.SetFocus; }
    End;

End;
procedure TFrente_Loja00.mnuLista_MultiplicacaoClick(Sender: TObject);
begin
{    If Trim(EditPermissao_Fechamento.Text) = 'S' Then
      Begin
        Application.CreateForm(TMvto_Compra00,Mvto_Compra00);

        Ampulheta();
          Mvto_Compra00.Titulo_Lista_Compras.Caption  := '  Lista de Compras >> Multiplicação';
          Mvto_Compra00.txt_Codigo.Visible     := False;
          Mvto_Compra00.txt_Descricao.Visible  := False;
          Mvto_Compra00.txt_Vlt_Unit.Visible   := False;
          Mvto_Compra00.txt_Vlr_Total.Visible  := False;
          Mvto_Compra00.lbl_Operacao.Caption:= 'x';
        Seta();

        Mvto_Compra00.ShowModal;
        Mvto_Compra00.Destroy;
    End; }
end;

procedure TFrente_Loja00.mnuLista_SomaClick(Sender: TObject);
begin
    Str_Codigo    := Trim(Lista_Itens.Cells[0,StrToInt(EditFoco_Linha.Text)]);
    Str_Descricao := Trim(Lista_Itens.Cells[1,StrToInt(EditFoco_Linha.Text)]);
    Str_Vlr_Unit  := Trim(Lista_Itens.Cells[3,StrToInt(EditFoco_Linha.Text)]);
    Str_Vlr_Total := Trim(Lista_Itens.Cells[4,StrToInt(EditFoco_Linha.Text)]);

    If Str_Codigo <> '' Then
      Begin
        Application.CreateForm(TMvto_Compra00,Mvto_Compra00);

        Ampulheta();
          Mvto_Compra00.Titulo_Lista_Compras.Caption  := '  Lista de Compras >> Soma';
          Mvto_Compra00.txt_Codigo.Text     := Str_Codigo    ;
          Mvto_Compra00.txt_Descricao.Text  := Str_Descricao ;
          Mvto_Compra00.txt_Vlt_Unit.Text   := Str_Vlr_Unit      ;
          Mvto_Compra00.txt_Vlr_Total.Text  := Str_Vlr_Total  ;
          Mvto_Compra00.lbl_Operacao.Caption:= '+';
        Seta();

        Mvto_Compra00.ShowModal;
        Mvto_Compra00.Destroy;
    End;
end;

procedure TFrente_Loja00.mnuLista_SubtracaoClick(Sender: TObject);
begin
    Str_Codigo    := Trim(Lista_Itens.Cells[0,StrToInt(EditFoco_Linha.Text)]);
    Str_Descricao := Trim(Lista_Itens.Cells[1,StrToInt(EditFoco_Linha.Text)]);
    Str_Vlr_Unit  := Trim(Lista_Itens.Cells[3,StrToInt(EditFoco_Linha.Text)]);
    Str_Vlr_Total := Trim(Lista_Itens.Cells[4,StrToInt(EditFoco_Linha.Text)]);

    If Str_Codigo <> '' Then
      Begin
        Application.CreateForm(TMvto_Compra00,Mvto_Compra00);

        Ampulheta();
          Mvto_Compra00.Titulo_Lista_Compras.Caption  := '  Lista de Compras >> Subtração';
          Mvto_Compra00.txt_Codigo.Text     := Str_Codigo    ;
          Mvto_Compra00.txt_Descricao.Text  := Str_Descricao ;
          Mvto_Compra00.txt_Vlt_Unit.Text   := Str_Vlr_Unit      ;
          Mvto_Compra00.txt_Vlr_Total.Text  := Str_Vlr_Total  ;
          Mvto_Compra00.lbl_Operacao.Caption:= '-';
        Seta();

        Mvto_Compra00.ShowModal;
        Mvto_Compra00.Destroy;
    End;
end;

procedure TFrente_Loja00.mnuLista_ApagaClick(Sender: TObject);
begin
{     Application.CreateForm(TApagaItem00,ApagaItem00);
     ApagaItem00.ShowModal;
     ApagaItem00.Destroy;

     Vezes_Teclado.Text := 'N';
     EditCod_Barras.SetFocus; }
end;

procedure TFrente_Loja00.mnuTeclas_F01Click(Sender: TObject);
begin
    If EditPermissao_Acesso.Text='N' Then
      Begin
        // Abrir Tela de Abertura
        Application.CreateForm(TCaixa_Abertura00,Caixa_Abertura00);
        Caixa_Abertura00.ShowModal;
        Caixa_Abertura00.Destroy;

        If EditPermissao_Acesso.Text='S' Then
          Begin
            Frente_Loja00.Close;
        End;

      End
    Else
      Begin
        Msg_Erro('O Caixa já foi Aberto Hoje !');
    End;
end;

procedure TFrente_Loja00.mnuTeclas_F02Click(Sender: TObject);
begin
    If Trim(EditPermissao_Fechamento.Text) = 'S' Then
       Begin
       Application.CreateForm(TCaixa_Fechamento00,Caixa_Fechamento00);
       Caixa_Fechamento00.ShowModal;
       Caixa_Fechamento00.Destroy;

       If Trim(EditPermissao_Fechamento.Text)='Sair' Then
          Begin
          Frente_Loja00.Close;
       End;
    End;
end;

procedure TFrente_Loja00.mnuTeclas_F03Click(Sender: TObject);
begin
{    If Trim(EditPermissao_Fechamento.Text) = 'S' Then
      Begin
        Application.CreateForm(TCaixa_Deposito00,Caixa_Deposito00);
        Caixa_Deposito00.ShowModal;
        Caixa_Deposito00.Destroy;
    End; }

     Application.CreateForm(TApagaItem00,ApagaItem00);
     ApagaItem00.ShowModal;
     ApagaItem00.Destroy;

     Vezes_Teclado.Text := 'N';
     EditCod_Barras.SetFocus;
end;

procedure TFrente_Loja00.mnuTeclas_F04Click(Sender: TObject);
begin
    If Trim(EditPermissao_Fechamento.Text) = 'S' Then
      Begin
        If UpperCase(Trim(Principal.Edit_Gaveta.Text)) = 'S' Then
           Begin
           Application.CreateForm(TCaixa_Sangria01,Caixa_Sangria01);
           Caixa_Sangria01.ShowModal;
           Caixa_Sangria01.Destroy;
        End;

        Application.CreateForm(TCaixa_Sangria00,Caixa_Sangria00);
        Caixa_Sangria00.ShowModal;
        Caixa_Sangria00.Destroy;
    End;
end;

procedure TFrente_Loja00.mnuTeclas_F05Click(Sender: TObject);
begin
    If Trim(EditPermissao_Fechamento.Text) = 'S' Then
      Begin
        Application.CreateForm(TCancela_Cupons_Login00,Cancela_Cupons_Login00);
        Cancela_Cupons_Login00.Tipo_Cancelamento.Text := 'F5';
        Cancela_Cupons_Login00.ShowModal;
        Cancela_Cupons_Login00.Destroy;
    End;
end;

procedure TFrente_Loja00.mnuTeclas_F06Click(Sender: TObject);
begin
    If Trim(EditPermissao_Fechamento.Text) = 'S' Then
      Begin
        Application.CreateForm(TCancela_Cupons_Login00,Cancela_Cupons_Login00);
        Cancela_Cupons_Login00.Tipo_Cancelamento.Text := 'F6';
        Cancela_Cupons_Login00.ShowModal;
        Cancela_Cupons_Login00.Destroy;
    End;
end;

procedure TFrente_Loja00.mnuTeclas_F07Click(Sender: TObject);
begin
    If Trim(EditPermissao_Fechamento.Text) = 'S' Then
      Begin
        Application.CreateForm(TProdutos00,Produtos00);
        Produtos00.Edit_Tipo.Text:= 'Frente_Loja';
        Produtos00.ShowModal;
        Produtos00.Destroy;
    End;
end;

procedure TFrente_Loja00.mnuTeclas_F09Click(Sender: TObject);
begin
    If Trim(EditPermissao_Fechamento.Text) = 'S' Then
      Begin
        Application.CreateForm(TAbertura_CaixaF9,Abertura_CaixaF9);
        Abertura_CaixaF9.ShowModal;
        Abertura_CaixaF9.Destroy;
    End;
end;

procedure TFrente_Loja00.mnuTeclas_F10Click(Sender: TObject);
begin
    Fecha_Cupom();
end;

procedure TFrente_Loja00.mnuSairClick(Sender: TObject);
begin
    If Confirma('Deseja realmente sair do Aplicativo ?')=6 Then
      Begin
        If Trim(Frente_Loja00.EditNro_Linha.Text)<>'0' Then
           Begin
           Msg_Erro('Não é possível sair enquanto o Cupom não for Fechado...');
           End
        Else
           Begin
           Deleta_Registro_Vendas(Trim(Numero_HD('C')));
           Frente_Loja00.Close;
        End;
    End;
end;

procedure TFrente_Loja00.mnuTeclas_F11Click(Sender: TObject);
begin
    Application.CreateForm(TCaixa_Sangria_Login00,Caixa_Sangria_Login00);
    Caixa_Sangria_Login00.ShowModal;
    Caixa_Sangria_Login00.Destroy;
end;

procedure TFrente_Loja00.FormCreate(Sender: TObject);
begin
     //*** Trabalha com o Ano de 4 Dígitos ***
     ShortDateFormat := 'dd/mm/yyyy';

     //*** Formata da Data conforme o Padrão Desejado ***
     ShortTimeFormat := 'hh:mm:ss';
end;

procedure TFrente_Loja00.EditCodClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin

      EditDesconto.Text := '0';

      If Trim(EditCodCliente.Text)<>'' Then
         Begin
         Seta();

         ConexaoBD.SQL_Clientes.Close;
         ConexaoBD.SQL_Clientes.SQL.Clear;
         ConexaoBD.SQL_Clientes.SQL.Add('Select * from mgt_clientes Where mgt_cliente_codigo Like ' +#39+'%'+ Trim(EditCodCliente.Text) +'%'+#39+ ' Order By mgt_cliente_codigo');
         ConexaoBD.SQL_Clientes.Open;

         If ((ConexaoBD.SQL_Clientes.RecordCount <= 0) Or (ConexaoBD.SQL_Clientes.RecordCount > 1)) Then
            Begin
            Seta();

            Application.CreateForm(TClientes00,Clientes00);
            Clientes00.Programa_Anterior.Text := 'Frente_Loja';
            Clientes00.ShowModal;
            Clientes00.Destroy;

            If Trim(EditNomeCliente.Text) <> '' Then
               Begin
               EditCod_Barras.SetFocus;
               End
            Else
               Begin
               EditCodCliente.SetFocus;
            End;
            End
         Else
            Begin
            EditCodCliente.Text  := Trim(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_codigo').Text);
            EditNomeCliente.Text := Trim(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_razao_social').Text);
            EditDesconto.Text    := Trim(ConexaoBD.SQL_Clientes.FieldByName('mgt_cliente_desconto').Text);
            EditCod_Barras.SetFocus;
         End;

         End
      Else
         Begin
         If EditVinculoCliente.Checked Then
            Begin
            Seta();

            Application.CreateForm(TClientes00,Clientes00);
            Clientes00.Programa_Anterior.Text := 'Frente_Loja';
            Clientes00.ShowModal;
            Clientes00.Destroy;

            If Trim(EditNomeCliente.Text) <> '' Then
               Begin
               EditCod_Barras.SetFocus;
               End
            Else
               Begin
               EditCodCliente.SetFocus;
            End;

            End
         Else
            Begin
            EditCod_Barras.SetFocus;
         End;
      End;
    End;
end;

procedure TFrente_Loja00.BTN_Emite_NotaClick(Sender: TObject);
begin
    If NFP_Consumidor.Checked = True Then
       Begin
       Application.CreateForm(TNotasFiscais00,NotasFiscais00);
       NotasFiscais00.ShowModal;
       NotasFiscais00.Destroy;
       End
    Else If NFP_Produto.Checked = True Then
       Begin
       Application.CreateForm(TNotasFiscais01,NotasFiscais01);
       NotasFiscais01.ShowModal;
       NotasFiscais01.Destroy;
       End
    Else
       Begin
       Application.CreateForm(TNotasFiscais02,NotasFiscais02);
       NotasFiscais02.ShowModal;
       NotasFiscais02.Destroy;
    End;

    EditCod_Barras.SetFocus;
end;

End.
