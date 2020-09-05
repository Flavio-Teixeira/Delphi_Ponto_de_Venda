unit Rel_Fechamento_Caixa_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, Buttons;

type
  TRelFechamentoCaixa00 = class(TForm)
    Panel_Botoes: TPanel;
    Panel_Valores: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditVlr_Total: TEdit;
    EditVlr_Faturado: TEdit;
    EditAbertura: TEdit;
    EditSangria: TEdit;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    EditCupom: TEdit;
    Label8: TLabel;
    Maquinas: TComboBox;
    Label3: TLabel;
    Rel_Periodo_Inicial: TMaskEdit;
    Label4: TLabel;
    Rel_Periodo_Final: TMaskEdit;
    BT_Sair: TBitBtn;
    BT_Imprimir: TBitBtn;
    Label9: TLabel;
    LBL_Registro: TLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MaquinasKeyPress(Sender: TObject; var Key: Char);
    procedure Rel_Periodo_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Rel_Periodo_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelFechamentoCaixa00: TRelFechamentoCaixa00;
  Comando_SQL   : String;

  Caixa_Data_Ini: String;
  Caixa_Data_Fim: String;
  Caixa_Hora    : String;
  Caixa_Usuario : String;
  Caixa_Maquina : String;

  Valor_Caixa   : String;
  Valor_Venda   : String;
  Valor_Sangria : String;
  Valor_Abertura: String;
  Valor_Cupom   : String;

  Vlr_Abertura  :Real;
  Vlr_Venda     :Real;
  Vlr_Deposito  :Real;
  Vlr_Sangria   :Real;

  Qtde_Cupom: Integer;

implementation

uses Conexao_BD, Rotinas_Gerais, Login_00;

{$R *.dfm}

procedure TRelFechamentoCaixa00.BT_SairClick(Sender: TObject);
begin
     RelFechamentoCaixa00.Close;
end;

procedure TRelFechamentoCaixa00.FormShow(Sender: TObject);
begin
    //*** Carrega Máquinas ***
    ConexaoBD.SQL_Informacao_Maquinas.Close;
    ConexaoBD.SQL_Informacao_Maquinas.SQL.Clear;
    ConexaoBD.SQL_Informacao_Maquinas.SQL.Add('Select * From Informacao_Maquinas Order By Informacao_Maquina_Descricao');
    ConexaoBD.SQL_Informacao_Maquinas.Open;

    Maquinas.Items.Add('--- Todas as Máquinas ---');

    While Not ConexaoBD.SQL_Informacao_Maquinas.Eof Do
      Begin
        Maquinas.Items.Add( ConexaoBD.SQL_Informacao_MaquinasInformacao_Maquina_HD.Text + ' - ' + ConexaoBD.SQL_Informacao_MaquinasInformacao_Maquina_Descricao.Text );
        ConexaoBD.SQL_Informacao_Maquinas.Next;
    End;
    Maquinas.ItemIndex  := 0;

    Rel_Periodo_Inicial.Text := DateToStr(Date());
    Rel_Periodo_Final.Text   := DateToStr(Date());

    Maquinas.SetFocus;    
end;

procedure TRelFechamentoCaixa00.MaquinasKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRelFechamentoCaixa00.Rel_Periodo_InicialKeyPress(
  Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
      Rel_Periodo_Final.Text := Rel_Periodo_Inicial.Text;

      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRelFechamentoCaixa00.Rel_Periodo_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRelFechamentoCaixa00.BT_ImprimirClick(Sender: TObject);

Var
   Ind, Erro: Integer;
   Vlr_Numero   : Real;
   Vlr_Exibicao : String;

   DT_Arquivo, Data_Movto_Inicio, Data_Movto_Final, Caminho, Caminho_Resultado, DT_Processada: String;

begin
    Ampulheta();

    //*** Prepara a Junção ***

    //*** Conexao Principal ***

    Caminho_Resultado := Trim(Login00.PdvTex_Caminho.Text);
    Caminho_Resultado := Copy(Caminho_Resultado,0,(Length(Caminho_Resultado) - 3));
    Caminho_Resultado := Trim(Caminho_Resultado);

    //*** Carrega Registro Caixa ***

    ConexaoBD.SQL_Comunitario_Secundario.Close;
    ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
    ConexaoBD.SQL_Comunitario_Secundario.SQL.Add('Truncate Registro_Caixa_Movto');
    ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

    //*** Prepara a Junção do BD ***

    Data_Movto_Inicio := Rel_Periodo_Inicial.Text;
    Data_Movto_Final  := Rel_Periodo_Final.Text;
    DT_Processada     := '';

    LBL_Registro.Caption := 'Preparando Junção de Dados...';
    LBL_Registro.Refresh;

    //*** Carrega Registro Caixa ***

    ConexaoBD.SQL_Registro_Caixa.Close;
    ConexaoBD.SQL_Registro_Caixa.SQL.Clear;
    ConexaoBD.SQL_Registro_Caixa.SQL.Add('Select * From Registro_Caixa Where (Registro_Caixa_Data >= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-')+#39+') and (Registro_Caixa_Data <= '+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-')+#39+')');
    ConexaoBD.SQL_Registro_Caixa.Open;

    LBL_Registro.Caption := 'Junção: Atual - Caixa - Nro.: ' + Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Hora.Text);
    LBL_Registro.Refresh;

    If Not ConexaoBD.SQL_Registro_Caixa.Eof Then
      Begin

      ConexaoBD.SQL_Registro_Caixa.First;

      While Not ConexaoBD.SQL_Registro_Caixa.Eof Do
            Begin

            LBL_Registro.Caption := 'Junção: Atual - Caixa - Nro.: ' + Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Hora.Text);
            LBL_Registro.Refresh;

            Comando_SQL  := 'Insert into Registro_Caixa_Movto(';
            Comando_SQL  := Comando_SQL + 'Registro_Caixa_Data, ';
            Comando_SQL  := Comando_SQL + 'Registro_Caixa_Hora, ';
            Comando_SQL  := Comando_SQL + 'Registro_Caixa_Operacao, ';
            Comando_SQL  := Comando_SQL + 'Registro_Caixa_Maquina, ';
            Comando_SQL  := Comando_SQL + 'Registro_Caixa_Pedido, ';
            Comando_SQL  := Comando_SQL + 'Registro_Caixa_Usuario, ';
            Comando_SQL  := Comando_SQL + 'Registro_Caixa_Valor) ';
            Comando_SQL  := Comando_SQL + 'Values(';
            Comando_SQL  := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Data.Text),'amd','-') + #39+ ', ';
            Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Hora.Text) + '", ';
            Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Operacao.Text) + '", ';
            Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Maquina.Text) + '", ';
            Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Pedido.Text) + '", ';
            Comando_SQL  := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Usuario.Text) + '", ';

            If Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Valor.Text) <> '' Then
               Begin
               Comando_SQL := Comando_SQL + '"' + Virgula_Ponto(Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Valor.Text)) + '")';
               End
            Else
               Begin
               Comando_SQL := Comando_SQL + '"0.00")';
            End;

            ConexaoBD.SQL_Comunitario_Secundario.Close;
            ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
            ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

            ConexaoBD.SQL_Registro_Caixa.Next;
      End;

    End;

    LBL_Registro.Caption := 'Processo Finalizado...';
    LBL_Registro.Refresh;

    Qtde_Cupom    := 0;
    Vlr_Abertura  := 0.00;
    Vlr_Venda     := 0.00;
    Vlr_Deposito  := 0.00;
    Vlr_Sangria   := 0.00;

    Caixa_Data_Ini:= Inverte_Data_Plus(Rel_Periodo_Inicial.Text,'amd','-');
    Caixa_Data_Fim:= Inverte_Data_Plus(Rel_Periodo_Final.Text,'amd','-');
    Caixa_Maquina := Obtem_Nro_Antes_Traco(Maquinas.Text);

    If Trim(Caixa_Maquina) <> '' Then
       Begin
       Comando_SQL  := 'Select * from Registro_Caixa_Movto ';
       Comando_SQL  := Comando_SQL + 'Where ';
       Comando_SQL  := Comando_SQL + '((Registro_Caixa_Data >=' + #39+ Caixa_Data_Ini + #39+ ') And (Registro_Caixa_Data <=' + #39+ Caixa_Data_Fim + #39+ ')) And ';
       Comando_SQL  := Comando_SQL + '(Registro_Caixa_Maquina="' + Caixa_Maquina + '") ';
       Comando_SQL  := Comando_SQL + 'Order By Registro_Caixa_Hora';
       End
    Else
       Begin
       Comando_SQL  := 'Select * from Registro_Caixa_Movto ';
       Comando_SQL  := Comando_SQL + 'Where ';
       Comando_SQL  := Comando_SQL + '((Registro_Caixa_Data >=' + #39+ Caixa_Data_Ini + #39+ ') And (Registro_Caixa_Data <=' + #39+ Caixa_Data_Fim + #39+ ')) ';
       Comando_SQL  := Comando_SQL + 'Order By Registro_Caixa_Hora';
    End;

    ConexaoBD.SQL_Registro_Caixa.Close;
    ConexaoBD.SQL_Registro_Caixa.SQL.Clear;
    ConexaoBD.SQL_Registro_Caixa.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Registro_Caixa.Open;

    If ConexaoBD.SQL_Registro_Caixa.RecordCount > 0 Then
      Begin

      While Not ConexaoBD.SQL_Registro_Caixa.Eof Do
            Begin
            If Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Operacao.Text)='Abertura' Then
               Begin
               Vlr_Abertura := Vlr_Abertura + ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Valor.AsFloat;
               End
            Else If Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Operacao.Text)='Venda' Then
               Begin
               Vlr_Venda := Vlr_Venda + ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Valor.AsFloat;
               Qtde_Cupom := Qtde_Cupom + 1;
               End
            Else If Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Operacao.Text)='Depósito - Entrada' Then
               Begin
               Vlr_Deposito := Vlr_Deposito + ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Valor.AsFloat;
               End
            Else If Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Operacao.Text)='Sangria - Retirada' Then
               Begin
               Vlr_Sangria := Vlr_Sangria + ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Valor.AsFloat;
            End;

            ConexaoBD.SQL_Registro_Caixa.Next;
      End;
    End;

    EditCupom.Text        := IntToStr(Qtde_Cupom);

    Vlr_Exibicao          := FloatToStr(Vlr_Abertura);
    Vlr_Exibicao          := Virgula_Ponto(Vlr_Exibicao);
    Val(Vlr_Exibicao,Vlr_Numero,Erro);
    Str(Vlr_Numero:13:2,Vlr_Exibicao);
    Vlr_Exibicao          := Ponto_Virgula(Trim(Vlr_Exibicao));
    EditAbertura.Text     := Vlr_Exibicao;

    Vlr_Exibicao          := FloatToStr(Vlr_Venda);
    Vlr_Exibicao          := Virgula_Ponto(Vlr_Exibicao);
    Val(Vlr_Exibicao,Vlr_Numero,Erro);
    Str(Vlr_Numero:13:2,Vlr_Exibicao);
    Vlr_Exibicao          := Ponto_Virgula(Trim(Vlr_Exibicao));
    EditVlr_Faturado.Text := Vlr_Exibicao;

    Vlr_Exibicao          := FloatToStr(Vlr_Sangria);
    Vlr_Exibicao          := Virgula_Ponto(Vlr_Exibicao);
    Val(Vlr_Exibicao,Vlr_Numero,Erro);
    Str(Vlr_Numero:13:2,Vlr_Exibicao);
    Vlr_Exibicao          := Ponto_Virgula(Trim(Vlr_Exibicao));
    EditSangria.Text      := Vlr_Exibicao;

    Valor_Caixa := FloatToStr( Vlr_Abertura + Vlr_Venda + Vlr_Deposito - Vlr_Sangria);

    Vlr_Exibicao := Trim(Virgula_Ponto(Valor_Caixa));
    Val(Vlr_Exibicao,Vlr_Numero,Erro);
    Str(Vlr_Numero:13:2,Vlr_Exibicao);
    Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));
    EditVlr_Total.Text    := Vlr_Exibicao;

    Seta();
end;

end.
