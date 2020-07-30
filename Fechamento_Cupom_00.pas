unit Fechamento_Cupom_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFechamento_Cupom00 = class(TForm)
    Panel_Opcoes: TPanel;
    GroupBox3: TGroupBox;
    Pan_Vlr_Total: TPanel;
    lbl_Vlr_Total: TLabel;
    Final_Vlr_Total: TEdit;
    Pan_Vlr_Pago: TPanel;
    lbl_Vlr_Pago: TLabel;
    Final_Vlr_Pago: TEdit;
    Pan_Forma_Pgto: TPanel;
    Forma_Pgto: TComboBox;
    Pan_Vlr_Troco: TPanel;
    lbl_Vlr_Troco: TLabel;
    Final_Vlr_Troco: TEdit;
    Titulo_Final_Compra: TPanel;
    BT_Finalizar_Venda: TBitBtn;
    Valida_Gaveta: TTimer;

    procedure Final_Vlr_PagoKeyPress(Sender: TObject; var Key: Char);
    procedure Forma_PgtoKeyPress(Sender: TObject; var Key: Char);
    procedure Imprime_Cupom();
    procedure BT_Finalizar_VendaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Final_Vlr_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure Final_Vlr_TrocoKeyPress(Sender: TObject; var Key: Char);
    procedure Valida_GavetaTimer(Sender: TObject);
    procedure BT_Finalizar_VendaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   Fechamento_Cupom00: TFechamento_Cupom00;
   Estado_Gaveta: Integer;

implementation

uses Conexao_BD, Rotinas_Gerais, Frente_Loja_00, GHDL32, Principal_00,
  Rel_ComprasClientes_01;

{$R *.dfm}

procedure TFechamento_Cupom00.Final_Vlr_PagoKeyPress(Sender: TObject;
  var Key: Char);
begin
      If Key = #27 Then
         Begin
         Frente_Loja00.EditCod_Barras.Enabled := True;
         Frente_Loja00.Lista_Itens.Enabled    := True;

         Fechamento_Cupom00.Close;
      End;

      If Key = #13 Then
        Begin
          If StrToFloat(Final_Vlr_Pago.Text) > 0 Then
            Begin

              If StrToFloat(Final_Vlr_Pago.Text) >= StrToFloat(Final_Vlr_Total.Text) Then
                Begin
                  Final_Vlr_Pago.Enabled  := False;
                  Forma_Pgto.Enabled      := True;
                  Prepara_Valores();
                  Forma_Pgto.SetFocus;
                End
              Else
                Begin
                  Msg_Erro('Valor Insuficiente...');
              End;

          End;
        End
      Else
        Begin
          So_Valor(Sender, Key);
      End;
end;

procedure TFechamento_Cupom00.Forma_PgtoKeyPress(Sender: TObject;
  var Key: Char);
begin
      If Key = #27 Then
         Begin
         Frente_Loja00.EditCod_Barras.Enabled := True;
         Frente_Loja00.Lista_Itens.Enabled    := True;

         Fechamento_Cupom00.Close;
      End;

      If Key = #13 Then
        Begin

          Forma_Pgto.Enabled          := False;

          Final_Vlr_Troco.Enabled     := True;
          Final_Vlr_Troco.Text        := FloatToSTr( StrToFloat(Final_Vlr_Pago.Text)- StrToFloat(Final_Vlr_Total.Text) );
          Final_Vlr_Troco.Enabled     := False;
          Prepara_Valores();

          Bt_Finalizar_Venda.Enabled    := True;
          Bt_Finalizar_Venda.SetFocus;
      End;
end;

procedure TFechamento_Cupom00.Imprime_Cupom();
Var

    Linha           :Integer;
    Posicao_Inicial :Integer;
    Posicao_Final   :Integer;
    Ind             :Integer;

    Str_Data        :String;
    Str_Hora        :String;
    Nro_Cupom       :String;
    Vlr_Total       :String;
    Vlr_Pago        :String;
    Vlr_Troco       :String;
    Str_Pgto        :String;
    Endereco_1      :String;
    Endereco_2      :String;
    Titulo      :String;

    Linha_Uno       :String;
    Linha_Dupla     :String;

    Comando_SQL     :String;
    
Begin
    //*** Rotina de Impressão a Nota Fiscal ***
    If Frente_Loja00.EditVinculoCliente.Checked Then
       Begin

       Ampulheta();

       //*** Seleciona os Itens para o Relatório ***

       Comando_SQL := 'Select * from Cabeca_Cupons,Corpo_Cupons,mgt_clientes Where ';
       Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Numero = ' +#39+ Trim(Frente_Loja00.EditNro_Cupom.Text) +#39+ ' AND ';
       Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Numero = Corpo_Cupom_Cabeca AND ';
       Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Cliente_Codigo = mgt_cliente_codigo ';
       Comando_SQL := Comando_SQL + 'Order By Cabeca_Cupom_Data_Emissao ASC, Cabeca_Cupom_Numero ASC';

       ConexaoBD.SQL_Compras_Clientes_Rel.Close;
       ConexaoBD.SQL_Compras_Clientes_Rel.SQL.Clear;
       ConexaoBD.SQL_Compras_Clientes_Rel.SQL.Add(Comando_SQL);
       ConexaoBD.SQL_Compras_Clientes_Rel.Open;

       Application.CreateForm(TRel_ComprasClientes01,Rel_ComprasClientes01);

       Seta();

       Rel_ComprasClientes01.QR_RegistroCaixa.PreviewModal;
       Rel_ComprasClientes01.Destroy;

    End;
End;

procedure TFechamento_Cupom00.BT_Finalizar_VendaClick(Sender: TObject);
begin
    Prepara_Valores();
    Grava_Cupom();
    Abre_Gaveta();
    Imprime_Cupom();
    BT_Finalizar_Venda.Enabled := False;
    Valida_Gaveta.Enabled      := True;
end;

procedure TFechamento_Cupom00.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #27 Then
       Begin
       Frente_Loja00.EditCod_Barras.Enabled := True;
       Frente_Loja00.Lista_Itens.Enabled    := True;

       Fechamento_Cupom00.Close;
    End;
end;

procedure TFechamento_Cupom00.Final_Vlr_TotalKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #27 Then
       Begin
       Frente_Loja00.EditCod_Barras.Enabled := True;
       Frente_Loja00.Lista_Itens.Enabled    := True;

       Fechamento_Cupom00.Close;
    End;
end;

procedure TFechamento_Cupom00.Final_Vlr_TrocoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #27 Then
       Begin
       Frente_Loja00.EditCod_Barras.Enabled := True;
       Frente_Loja00.Lista_Itens.Enabled    := True;

       Fechamento_Cupom00.Close;
    End;
end;

procedure TFechamento_Cupom00.Valida_GavetaTimer(Sender: TObject);
begin
    If UpperCase(Trim(Principal.Edit_Gaveta.Text)) = 'S' Then
       Begin

       Estado_Gaveta := DriverGaveta(GAVETA_COM1, GAVETA_ESTADO);

       If Estado_Gaveta = GAVETA_FECHADA Then
          Begin
          If BT_Finalizar_Venda.Enabled = False Then
             Begin
             Prepara_Tela();
             Fechamento_Cupom00.Close;
          End;
       End;

       End
    Else
       Begin
       Prepara_Tela();
       Fechamento_Cupom00.Close;
    End;
end;

procedure TFechamento_Cupom00.BT_Finalizar_VendaKeyPress(Sender: TObject;
  var Key: Char);
begin
      If Key = #27 Then
         Begin
         Frente_Loja00.EditCod_Barras.Enabled := True;
         Frente_Loja00.Lista_Itens.Enabled    := True;

         Fechamento_Cupom00.Close;
      End;
end;

procedure TFechamento_Cupom00.FormShow(Sender: TObject);
begin
     If Frente_Loja00.EditVinculoCliente.Checked Then
        Begin
        Final_Vlr_Pago.Text := Final_Vlr_Total.Text;

        Final_Vlr_Total.Visible := False;

        lbl_Vlr_Pago.Visible    := False;
        Final_Vlr_Pago.Visible  := False;

        lbl_Vlr_Troco.Visible   := False;
        Final_Vlr_Troco.Visible := False;
     End;
end;

end.
