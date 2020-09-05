unit Contagem_Cedulas_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TContagemCedulas00 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    btnSair: TBitBtn;
    btnRegistrar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox3: TGroupBox;
    Data_Fechamento: TMaskEdit;
    Vlr_Dinheiro: TEdit;
    Vlr_Debito: TEdit;
    Vlr_Credito: TEdit;
    Vlr_Outros: TEdit;
    Vlr_Total: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Qtde_0_05: TEdit;
    Qtde_0_10: TEdit;
    Qtde_0_25: TEdit;
    Qtde_0_50: TEdit;
    Qtde_1_00: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Qtde_2_00: TEdit;
    Qtde_5_00: TEdit;
    Qtde_10_00: TEdit;
    Qtde_20_00: TEdit;
    Qtde_50_00: TEdit;
    Qtde_100_00: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Qtde_Vlr_Debito: TEdit;
    Qtde_Vlr_Credito: TEdit;
    Qtde_Vlr_Outros: TEdit;
    Label26: TLabel;
    Vlr_0_05: TEdit;
    Vlr_0_10: TEdit;
    Vlr_0_25: TEdit;
    Vlr_0_50: TEdit;
    Vlr_1_00: TEdit;
    Vlr_2_00: TEdit;
    Vlr_5_00: TEdit;
    Vlr_10_00: TEdit;
    Vlr_20_00: TEdit;
    Vlr_50_00: TEdit;
    Vlr_100_00: TEdit;
    Vlr_Somatoria_Total: TEdit;
    Label28: TLabel;
    Vlr_Diferenca: TEdit;
    Label29: TLabel;
    Vlr_Abertura: TEdit;
    Total_Moedas: TEdit;
    Total_Cedulas: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    Label7: TLabel;
    Qtde_Vlr_Sangria: TEdit;
    Label8: TLabel;
    Vlr_Total_Final: TEdit;
    Label27: TLabel;
    Vlr_Abertura_Caixa: TEdit;
    Observacao_Atual: TMemo;
    Label32: TLabel;
    Label33: TLabel;
    Observacao_Anterior: TMemo;
    Label34: TLabel;
    Vlr_Faturamento: TEdit;
    BT_Adiciona: TButton;
    procedure Totaliza();
    procedure btnSairClick(Sender: TObject);
    procedure Data_FechamentoKeyPress(Sender: TObject; var Key: Char);
    procedure Qtde_0_05KeyPress(Sender: TObject; var Key: Char);
    procedure Qtde_0_10KeyPress(Sender: TObject; var Key: Char);
    procedure Qtde_0_25KeyPress(Sender: TObject; var Key: Char);
    procedure Qtde_0_50KeyPress(Sender: TObject; var Key: Char);
    procedure Qtde_1_00KeyPress(Sender: TObject; var Key: Char);
    procedure Qtde_2_00KeyPress(Sender: TObject; var Key: Char);
    procedure Qtde_5_00KeyPress(Sender: TObject; var Key: Char);
    procedure Qtde_10_00KeyPress(Sender: TObject; var Key: Char);
    procedure Qtde_20_00KeyPress(Sender: TObject; var Key: Char);
    procedure Qtde_50_00KeyPress(Sender: TObject; var Key: Char);
    procedure Qtde_100_00KeyPress(Sender: TObject; var Key: Char);
    procedure Qtde_Vlr_DebitoKeyPress(Sender: TObject; var Key: Char);
    procedure Qtde_Vlr_CreditoKeyPress(Sender: TObject; var Key: Char);
    procedure Qtde_Vlr_OutrosKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Qtde_Vlr_SangriaKeyPress(Sender: TObject; var Key: Char);
    procedure btnRegistrarClick(Sender: TObject);
    procedure BT_AdicionaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ContagemCedulas00: TContagemCedulas00;

implementation

uses Conexao_BD, Rotinas_Gerais, DB;

{$R *.dfm}

procedure TContagemCedulas00.Totaliza();

var
   ComandoSQL: String;
   Erro: Integer;
   Vlr_Numero   : Real;
   Vlr_Exibicao : String;

begin
    Ampulheta();

    //*** Total das Moedas ***
    Vlr_Exibicao := FloatToStr(StrToFloat(Vlr_0_05.Text) + StrToFloat(Vlr_0_10.Text) + StrToFloat(Vlr_0_25.Text) + StrToFloat(Vlr_0_50.Text) + StrToFloat(Vlr_1_00.Text));
    Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
    Val(Vlr_Exibicao,Vlr_Numero,Erro);
    Str(Vlr_Numero:13:2,Vlr_Exibicao);
    Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

    Total_Moedas.Text := Trim(Vlr_Exibicao);

    //*** Total das Cédulas ***
    Vlr_Exibicao := FloatToStr(StrToFloat(Vlr_2_00.Text) + StrToFloat(Vlr_5_00.Text) + StrToFloat(Vlr_10_00.Text) + StrToFloat(Vlr_20_00.Text) + StrToFloat(Vlr_50_00.Text) + StrToFloat(Vlr_100_00.Text));
    Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
    Val(Vlr_Exibicao,Vlr_Numero,Erro);
    Str(Vlr_Numero:13:2,Vlr_Exibicao);
    Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

    Total_Cedulas.Text := Trim(Vlr_Exibicao);

    //*** Total dos Débitos ***
    Vlr_Exibicao := FloatToStr(StrToFloat(Qtde_Vlr_Debito.Text) + StrToFloat(Qtde_Vlr_Credito.Text) + StrToFloat(Qtde_Vlr_Outros.Text) + StrToFloat(Qtde_Vlr_Sangria.Text));
    Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
    Val(Vlr_Exibicao,Vlr_Numero,Erro);
    Str(Vlr_Numero:13:2,Vlr_Exibicao);
    Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

    Vlr_Total_Final.Text := Trim(Vlr_Exibicao);

    //*** Valor de Abertura do Caixa ***
    Vlr_Exibicao := FloatToStr(StrToFloat(Total_Moedas.Text) + StrToFloat(Total_Cedulas.Text));
    Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
    Val(Vlr_Exibicao,Vlr_Numero,Erro);
    Str(Vlr_Numero:13:2,Vlr_Exibicao);
    Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

    Vlr_Abertura_Caixa.Text := Trim(Vlr_Exibicao);

    //*** Total Final ***
    Vlr_Exibicao := FloatToStr(StrToFloat(Total_Moedas.Text) + StrToFloat(Total_Cedulas.Text) + StrToFloat(Vlr_Total_Final.Text));
    Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
    Val(Vlr_Exibicao,Vlr_Numero,Erro);
    Str(Vlr_Numero:13:2,Vlr_Exibicao);
    Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

    Vlr_Somatoria_Total.Text := Trim(Vlr_Exibicao);

    //*** Diferença ***
    Vlr_Exibicao := FloatToStr(StrToFloat(Vlr_Total.Text) - StrToFloat(Vlr_Somatoria_Total.Text));
    Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
    Val(Vlr_Exibicao,Vlr_Numero,Erro);
    Str(Vlr_Numero:13:2,Vlr_Exibicao);
    Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

    Vlr_Diferenca.Text := Trim(Vlr_Exibicao);

    Seta();
end;

procedure TContagemCedulas00.btnSairClick(Sender: TObject);
begin
    ContagemCedulas00.Close;
end;

procedure TContagemCedulas00.Data_FechamentoKeyPress(Sender: TObject;
  var Key: Char);

var
   ComandoSQL: String;
   Erro: Integer;
   Vlr_Numero   : Real;
   Vlr_Exibicao, Data_Observacao : String;

begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);

        //*** Obtem os Valores dos Campos ***
        Ampulheta();

        //*** Obtem a Data para Buscar a Observação ***
        Data_Observacao := DateToStr(StrToDate(Data_Fechamento.Text) - 1);

        //*** Limpa os Campos para Exibição ***
        Vlr_Abertura.Text        := '0';
        Vlr_Faturamento.Text     := '0';
        Vlr_Dinheiro.Text        := '0';
        Vlr_Debito.Text          := '0';
        Vlr_Credito.Text         := '0';
        Vlr_Outros.Text          := '0';
        Vlr_Total.Text           := '0';

        Qtde_0_05.Text           := '0';
        Vlr_0_05.Text            := '0';
        Qtde_0_10.Text           := '0';
        Vlr_0_10.Text            := '0';
        Qtde_0_25.Text           := '0';
        Vlr_0_25.Text            := '0';
        Qtde_0_50.Text           := '0';
        Vlr_0_50.Text            := '0';
        Qtde_1_00.Text           := '0';
        Vlr_1_00.Text            := '0';
        Total_Moedas.Text        := '0';

        Qtde_2_00.Text           := '0';
        Vlr_2_00.Text            := '0';
        Qtde_5_00.Text           := '0';
        Vlr_5_00.Text            := '0';
        Qtde_10_00.Text          := '0';
        Vlr_10_00.Text           := '0';
        Qtde_20_00.Text          := '0';
        Vlr_20_00.Text           := '0';
        Qtde_50_00.Text          := '0';
        Vlr_50_00.Text           := '0';
        Qtde_100_00.Text         := '0';
        Vlr_100_00.Text          := '0';
        Total_Cedulas.Text       := '0';

        Qtde_Vlr_Debito.Text     := '0';
        Qtde_Vlr_Credito.Text    := '0';
        Qtde_Vlr_Outros.Text     := '0';
        Qtde_Vlr_Sangria.Text    := '0';

        Vlr_Total_Final.Text     := '0';
        Vlr_Somatoria_Total.Text := '0';
        Vlr_Diferenca.Text       := '0';

        Vlr_Abertura_Caixa.Text  := '0';

        Observacao_Anterior.Lines.Clear;
        Observacao_Atual.Lines.Clear;

        //*** Verifica se Existe o Registro Gravado ***
        ComandoSQL := 'SELECT ';
        ComandoSQL := ComandoSQL + 'COUNT(Contagem_Data_Fechamento) AS Contagem_Total_Registros ';
        ComandoSQL := ComandoSQL + 'FROM Contagem ';
        ComandoSQL := ComandoSQL + 'WHERE Contagem_Data_Fechamento = '+#39+Inverte_Data_Plus(Trim(Data_Fechamento.Text),'amd','-')+#39+' ';

        ConexaoBD.SQL_Comunitario.Close;
        ConexaoBD.SQL_Comunitario.SQL.Clear;
        ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
        ConexaoBD.SQL_Comunitario.Open;

        If (Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Total_Registros']) <> '0' ) Then
           Begin
           //*** Efetua a Seleção com a Data Desejada ***
           ComandoSQL := 'SELECT ';
           ComandoSQL := ComandoSQL + '* ';
           ComandoSQL := ComandoSQL + 'FROM Contagem ';
           ComandoSQL := ComandoSQL + 'WHERE Contagem_Data_Fechamento = '+#39+Inverte_Data_Plus(Trim(Data_Fechamento.Text),'amd','-')+#39+' ';

           ConexaoBD.SQL_Comunitario.Close;
           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
           ConexaoBD.SQL_Comunitario.Open;

           //*** Carrega os Campos com os Valores Obtidos ***
           Vlr_Abertura.Text        := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_Abertura']))));
           Vlr_Faturamento.Text     := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_Faturamento']))));
           Vlr_Dinheiro.Text        := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_Dinheiro']))));
           Vlr_Debito.Text          := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_Debito']))));
           Vlr_Credito.Text         := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_Credito']))));
           Vlr_Outros.Text          := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_Outros']))));
           Vlr_Total.Text           := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_Total']))));

           Qtde_0_05.Text           := Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Qtde_0_05']);
           Vlr_0_05.Text            := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_0_05']))));
           Qtde_0_10.Text           := Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Qtde_0_10']);
           Vlr_0_10.Text            := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_0_10']))));
           Qtde_0_25.Text           := Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Qtde_0_25']);
           Vlr_0_25.Text            := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_0_25']))));
           Qtde_0_50.Text           := Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Qtde_0_50']);
           Vlr_0_50.Text            := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_0_50']))));
           Qtde_1_00.Text           := Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Qtde_1_00']);
           Vlr_1_00.Text            := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_1_00']))));
           Total_Moedas.Text        := Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Total_Moedas']);

           Qtde_2_00.Text           := Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Qtde_2_00']);
           Vlr_2_00.Text            := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_2_00']))));
           Qtde_5_00.Text           := Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Qtde_5_00']);
           Vlr_5_00.Text            := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_5_00']))));
           Qtde_10_00.Text          := Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Qtde_10_00']);
           Vlr_10_00.Text           := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_10_00']))));
           Qtde_20_00.Text          := Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Qtde_20_00']);
           Vlr_20_00.Text           := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_20_00']))));
           Qtde_50_00.Text          := Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Qtde_50_00']);
           Vlr_50_00.Text           := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_50_00']))));
           Qtde_100_00.Text         := Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Qtde_100_00']);
           Vlr_100_00.Text          := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_100_00']))));
           Total_Cedulas.Text       := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Total_Cedulas']))));

           Qtde_Vlr_Debito.Text     := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Qtde_Vlr_Debito']))));
           Qtde_Vlr_Credito.Text    := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Qtde_Vlr_Credito']))));
           Qtde_Vlr_Outros.Text     := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Qtde_Vlr_Outros']))));
           Qtde_Vlr_Sangria.Text    := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Qtde_Vlr_Sangria']))));

           Vlr_Total_Final.Text     := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_Total_Final']))));
           Vlr_Somatoria_Total.Text := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_Somatoria_Total']))));
           Vlr_Diferenca.Text       := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_Diferenca']))));

           Vlr_Abertura_Caixa.Text  := FormatFloat('0.00',StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Vlr_Abertura_Caixa']))));

           Observacao_Anterior.Lines.Add(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Observacao_Anterior']));
           Observacao_Atual.Lines.Add(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Observacao_Atual']));
           End
        Else
           Begin
           //*** Vlr_Abertura ***
           ComandoSQL := 'SELECT ';
           ComandoSQL := ComandoSQL + 'IFNULL(SUM(Registro_Caixa_Valor),0) AS Vlr_Abertura ';
           ComandoSQL := ComandoSQL + 'FROM Registro_Caixa ';
           ComandoSQL := ComandoSQL + 'WHERE Registro_Caixa_Data = '+#39+Inverte_Data_Plus(Trim(Data_Fechamento.Text),'amd','-')+#39+' AND ';
           ComandoSQL := ComandoSQL + 'Registro_Caixa_Operacao = '+#39+'Abertura'+#39;

           ConexaoBD.SQL_Comunitario.Close;
           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
           ConexaoBD.SQL_Comunitario.Open;

           Vlr_Exibicao := Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Vlr_Abertura']));
           Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
           Val(Vlr_Exibicao,Vlr_Numero,Erro);
           Str(Vlr_Numero:13:2,Vlr_Exibicao);
           Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

           Vlr_Abertura.Text := Trim(Vlr_Exibicao);

           //*** Vlr_Dinheiro ***
           ComandoSQL := 'SELECT ';
           ComandoSQL := ComandoSQL + 'IFNULL(SUM(Cabeca_Cupom_Vlr_Total),0) AS Vlr_Dinheiro ';
           ComandoSQL := ComandoSQL + 'FROM Cabeca_Cupons ';
           ComandoSQL := ComandoSQL + 'WHERE Cabeca_Cupom_Data_Emissao = '+#39+Inverte_Data_Plus(Trim(Data_Fechamento.Text),'amd','-')+#39+' AND ';
           ComandoSQL := ComandoSQL + 'Cabeca_Cupom_Status = '+#39+'Fechado'+#39+' AND ';
           ComandoSQL := ComandoSQL + 'Cabeca_Cupom_Forma_Pgto = '+#39+'D'+#39;

           ConexaoBD.SQL_Comunitario.Close;
           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
           ConexaoBD.SQL_Comunitario.Open;

           Vlr_Exibicao := Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Vlr_Dinheiro']));
           Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
           Val(Vlr_Exibicao,Vlr_Numero,Erro);
           Str(Vlr_Numero:13:2,Vlr_Exibicao);
           Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

           Vlr_Dinheiro.Text := Trim(Vlr_Exibicao);

           //*** Vlr_Debito ***
           ComandoSQL := 'SELECT ';
           ComandoSQL := ComandoSQL + 'IFNULL(SUM(Cabeca_Cupom_Vlr_Total),0) AS Vlr_Debito ';
           ComandoSQL := ComandoSQL + 'FROM Cabeca_Cupons ';
           ComandoSQL := ComandoSQL + 'WHERE Cabeca_Cupom_Data_Emissao = '+#39+Inverte_Data_Plus(Trim(Data_Fechamento.Text),'amd','-')+#39+' AND ';
           ComandoSQL := ComandoSQL + 'Cabeca_Cupom_Status = '+#39+'Fechado'+#39+' AND ';
           ComandoSQL := ComandoSQL + 'Cabeca_Cupom_Forma_Pgto = '+#39+'C'+#39;

           ConexaoBD.SQL_Comunitario.Close;
           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
           ConexaoBD.SQL_Comunitario.Open;

           Vlr_Exibicao := Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Vlr_Debito']));
           Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
           Val(Vlr_Exibicao,Vlr_Numero,Erro);
           Str(Vlr_Numero:13:2,Vlr_Exibicao);
           Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

           Vlr_Debito.Text      := Trim(Vlr_Exibicao);
           Qtde_Vlr_Debito.Text := Trim(Vlr_Exibicao);

           //*** Vlr_Credito ***
           ComandoSQL := 'SELECT ';
           ComandoSQL := ComandoSQL + 'IFNULL(SUM(Cabeca_Cupom_Vlr_Total),0) AS Vlr_Credito ';
           ComandoSQL := ComandoSQL + 'FROM Cabeca_Cupons ';
           ComandoSQL := ComandoSQL + 'WHERE Cabeca_Cupom_Data_Emissao = '+#39+Inverte_Data_Plus(Trim(Data_Fechamento.Text),'amd','-')+#39+' AND ';
           ComandoSQL := ComandoSQL + 'Cabeca_Cupom_Status = '+#39+'Fechado'+#39+' AND ';
           ComandoSQL := ComandoSQL + 'Cabeca_Cupom_Forma_Pgto = '+#39+'R'+#39;

           ConexaoBD.SQL_Comunitario.Close;
           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
           ConexaoBD.SQL_Comunitario.Open;

           Vlr_Exibicao := Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Vlr_Credito']));
           Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
           Val(Vlr_Exibicao,Vlr_Numero,Erro);
           Str(Vlr_Numero:13:2,Vlr_Exibicao);
           Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

           Vlr_Credito.Text      := Trim(Vlr_Exibicao);
           Qtde_Vlr_Credito.Text := Trim(Vlr_Exibicao);

           //*** Vlr_Outros ***
           ComandoSQL := 'SELECT ';
           ComandoSQL := ComandoSQL + 'IFNULL(SUM(Cabeca_Cupom_Vlr_Total),0) AS Vlr_Outros ';
           ComandoSQL := ComandoSQL + 'FROM Cabeca_Cupons ';
           ComandoSQL := ComandoSQL + 'WHERE Cabeca_Cupom_Data_Emissao = '+#39+Inverte_Data_Plus(Trim(Data_Fechamento.Text),'amd','-')+#39+' AND ';
           ComandoSQL := ComandoSQL + 'Cabeca_Cupom_Status = '+#39+'Fechado'+#39+' AND ';
           ComandoSQL := ComandoSQL + '(Cabeca_Cupom_Forma_Pgto <> '+#39+'D'+#39+' AND Cabeca_Cupom_Forma_Pgto <> '+#39+'C'+#39+' AND Cabeca_Cupom_Forma_Pgto <> '+#39+'R'+#39+')';

           ConexaoBD.SQL_Comunitario.Close;
           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
           ConexaoBD.SQL_Comunitario.Open;

           Vlr_Exibicao := Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Vlr_Outros']));
           Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
           Val(Vlr_Exibicao,Vlr_Numero,Erro);
           Str(Vlr_Numero:13:2,Vlr_Exibicao);
           Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

           Vlr_Outros.Text      := Trim(Vlr_Exibicao);
           Qtde_Vlr_Outros.Text := Trim(Vlr_Exibicao);

           //*** Vlr_Total ***
           ComandoSQL := 'SELECT ';
           ComandoSQL := ComandoSQL + 'IFNULL(SUM(Cabeca_Cupom_Vlr_Total),0) AS Vlr_Total ';
           ComandoSQL := ComandoSQL + 'FROM Cabeca_Cupons ';
           ComandoSQL := ComandoSQL + 'WHERE Cabeca_Cupom_Data_Emissao = '+#39+Inverte_Data_Plus(Trim(Data_Fechamento.Text),'amd','-')+#39+' AND ';
           ComandoSQL := ComandoSQL + 'Cabeca_Cupom_Status = '+#39+'Fechado'+#39;

           ConexaoBD.SQL_Comunitario.Close;
           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
           ConexaoBD.SQL_Comunitario.Open;

           Vlr_Exibicao := FloatToStr(StrToFloat(Vlr_Abertura.Text) + StrToFloat(Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Vlr_Total']))));
           Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
           Val(Vlr_Exibicao,Vlr_Numero,Erro);
           Str(Vlr_Numero:13:2,Vlr_Exibicao);
           Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

           Vlr_Total.Text := Trim(Vlr_Exibicao);

           //*** Vlr_Sangria ***
           ComandoSQL := 'SELECT ';
           ComandoSQL := ComandoSQL + 'IFNULL(SUM(Registro_Caixa_Valor),0) AS Vlr_Sangria ';
           ComandoSQL := ComandoSQL + 'FROM Registro_Caixa ';
           ComandoSQL := ComandoSQL + 'WHERE Registro_Caixa_Data = '+#39+Inverte_Data_Plus(Trim(Data_Fechamento.Text),'amd','-')+#39+' AND ';
           ComandoSQL := ComandoSQL + 'Registro_Caixa_Operacao = '+#39+'Sangria - Retirada'+#39;

           ConexaoBD.SQL_Comunitario.Close;
           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
           ConexaoBD.SQL_Comunitario.Open;

           Vlr_Exibicao := Ponto_Virgula(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Vlr_Sangria']));
           Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
           Val(Vlr_Exibicao,Vlr_Numero,Erro);
           Str(Vlr_Numero:13:2,Vlr_Exibicao);
           Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

           Qtde_Vlr_Sangria.Text := Trim(Vlr_Exibicao);

           //*** Calcula os Valores Totais ***
           Vlr_Exibicao := FloatToStr(StrToFloat(Vlr_Total.Text) - StrToFloat(Qtde_Vlr_Sangria.Text));
           Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
           Val(Vlr_Exibicao,Vlr_Numero,Erro);
           Str(Vlr_Numero:13:2,Vlr_Exibicao);
           Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

           Vlr_Total_Final.Text := Trim(Vlr_Exibicao);

           //*** Calcula o Total do Faturamento ***
           Vlr_Exibicao := FloatToStr(StrToFloat(Vlr_Dinheiro.Text) + StrToFloat(Vlr_Debito.Text) + StrToFloat(Vlr_Credito.Text) + StrToFloat(Vlr_Outros.Text));
           Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
           Val(Vlr_Exibicao,Vlr_Numero,Erro);
           Str(Vlr_Numero:13:2,Vlr_Exibicao);
           Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

           Vlr_Faturamento.Text := Trim(Vlr_Exibicao);

           //*** Obtem a Observação Anterior ***
           //*** Verifica se Existe o Registro Gravado ***
           ComandoSQL := 'SELECT ';
           ComandoSQL := ComandoSQL + 'COUNT(Contagem_Data_Fechamento) AS Contagem_Total_Registros ';
           ComandoSQL := ComandoSQL + 'FROM Contagem ';
           ComandoSQL := ComandoSQL + 'ORDER BY Contagem_Data_Fechamento DESC';

           ConexaoBD.SQL_Comunitario.Close;
           ConexaoBD.SQL_Comunitario.SQL.Clear;
           ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
           ConexaoBD.SQL_Comunitario.Open;

           If (Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Total_Registros']) <> '0' ) Then
              Begin
              //*** Efetua a Seleção da Observação Anterior ***
              ComandoSQL := 'SELECT ';
              ComandoSQL := ComandoSQL + '* ';
              ComandoSQL := ComandoSQL + 'FROM Contagem ';
              ComandoSQL := ComandoSQL + 'ORDER BY Contagem_Data_Fechamento DESC';

              ConexaoBD.SQL_Comunitario.Close;
              ConexaoBD.SQL_Comunitario.SQL.Clear;
              ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
              ConexaoBD.SQL_Comunitario.Open;

              Observacao_Anterior.Lines.Add(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Contagem_Observacao_Atual']));
           End;
        End;

        //*** Totaliza os Valores ***
        Totaliza();

        //*** Ativa o Botão de Registro ***
        btnRegistrar.Enabled := True;

        Seta();
     End;
end;

procedure TContagemCedulas00.Qtde_0_05KeyPress(Sender: TObject; var Key: Char);

var
   Erro: Integer;
   Vlr_Numero   : Real;
   Vlr_Exibicao : String;

begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);

        //*** Calcula a Quantidade com o Valor ***
        Vlr_Exibicao := FloatToStr(StrToInt(Qtde_0_05.Text) * 0.05);
        Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Vlr_0_05.Text := Trim(Vlr_Exibicao);

        Totaliza();

      End;
end;

procedure TContagemCedulas00.Qtde_0_10KeyPress(Sender: TObject; var Key: Char);

var
   Erro: Integer;
   Vlr_Numero   : Real;
   Vlr_Exibicao : String;

begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);

        //*** Calcula a Quantidade com o Valor ***
        Vlr_Exibicao := FloatToStr(StrToInt(Qtde_0_10.Text) * 0.10);
        Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Vlr_0_10.Text := Trim(Vlr_Exibicao);

        Totaliza();
     End;
end;

procedure TContagemCedulas00.Qtde_0_25KeyPress(Sender: TObject;
  var Key: Char);

var
   Erro: Integer;
   Vlr_Numero   : Real;
   Vlr_Exibicao : String;

begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);

        //*** Calcula a Quantidade com o Valor ***
        Vlr_Exibicao := FloatToStr(StrToInt(Qtde_0_25.Text) * 0.25);
        Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Vlr_0_25.Text := Trim(Vlr_Exibicao);

        Totaliza();
     End;
end;

procedure TContagemCedulas00.Qtde_0_50KeyPress(Sender: TObject;
  var Key: Char);

var
   Erro: Integer;
   Vlr_Numero   : Real;
   Vlr_Exibicao : String;

begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);

        //*** Calcula a Quantidade com o Valor ***
        Vlr_Exibicao := FloatToStr(StrToInt(Qtde_0_50.Text) * 0.50);
        Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Vlr_0_50.Text := Trim(Vlr_Exibicao);

        Totaliza();
     End;
end;

procedure TContagemCedulas00.Qtde_1_00KeyPress(Sender: TObject;
  var Key: Char);

var
   Erro: Integer;
   Vlr_Numero   : Real;
   Vlr_Exibicao : String;

begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);

        //*** Calcula a Quantidade com o Valor ***
        Vlr_Exibicao := FloatToStr(StrToInt(Qtde_1_00.Text) * 1.00);
        Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Vlr_1_00.Text := Trim(Vlr_Exibicao);

        Totaliza();
     End;
end;

procedure TContagemCedulas00.Qtde_2_00KeyPress(Sender: TObject;
  var Key: Char);

var
   Erro: Integer;
   Vlr_Numero   : Real;
   Vlr_Exibicao : String;

begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);

        //*** Calcula a Quantidade com o Valor ***
        Vlr_Exibicao := FloatToStr(StrToInt(Qtde_2_00.Text) * 2.00);
        Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Vlr_2_00.Text := Trim(Vlr_Exibicao);

        Totaliza();
     End;
end;

procedure TContagemCedulas00.Qtde_5_00KeyPress(Sender: TObject;
  var Key: Char);

var
   Erro: Integer;
   Vlr_Numero   : Real;
   Vlr_Exibicao : String;

begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);

        //*** Calcula a Quantidade com o Valor ***
        Vlr_Exibicao := FloatToStr(StrToInt(Qtde_5_00.Text) * 5.00);
        Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Vlr_5_00.Text := Trim(Vlr_Exibicao);

        Totaliza();
     End;
end;

procedure TContagemCedulas00.Qtde_10_00KeyPress(Sender: TObject;
  var Key: Char);

var
   Erro: Integer;
   Vlr_Numero   : Real;
   Vlr_Exibicao : String;

begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);

        //*** Calcula a Quantidade com o Valor ***
        Vlr_Exibicao := FloatToStr(StrToInt(Qtde_10_00.Text) * 10.00);
        Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Vlr_10_00.Text := Trim(Vlr_Exibicao);

        Totaliza();
     End;
end;

procedure TContagemCedulas00.Qtde_20_00KeyPress(Sender: TObject;
  var Key: Char);

var
   Erro: Integer;
   Vlr_Numero   : Real;
   Vlr_Exibicao : String;

begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);

        //*** Calcula a Quantidade com o Valor ***
        Vlr_Exibicao := FloatToStr(StrToInt(Qtde_20_00.Text) * 20.00);
        Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Vlr_20_00.Text := Trim(Vlr_Exibicao);

        Totaliza();
     End;
end;

procedure TContagemCedulas00.Qtde_50_00KeyPress(Sender: TObject;
  var Key: Char);

var
   Erro: Integer;
   Vlr_Numero   : Real;
   Vlr_Exibicao : String;

begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);

        //*** Calcula a Quantidade com o Valor ***
        Vlr_Exibicao := FloatToStr(StrToInt(Qtde_50_00.Text) * 50.00);
        Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Vlr_50_00.Text := Trim(Vlr_Exibicao);

        Totaliza();
     End;
end;

procedure TContagemCedulas00.Qtde_100_00KeyPress(Sender: TObject;
  var Key: Char);

var
   Erro: Integer;
   Vlr_Numero   : Real;
   Vlr_Exibicao : String;

begin
     So_Numero(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);

        //*** Calcula a Quantidade com o Valor ***
        Vlr_Exibicao := FloatToStr(StrToInt(Qtde_100_00.Text) * 100.00);
        Vlr_Exibicao := Virgula_Ponto(Vlr_Exibicao);
        Val(Vlr_Exibicao,Vlr_Numero,Erro);
        Str(Vlr_Numero:13:2,Vlr_Exibicao);
        Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

        Vlr_100_00.Text := Trim(Vlr_Exibicao);

        Totaliza();
     End;
end;

procedure TContagemCedulas00.Qtde_Vlr_DebitoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);

        Totaliza();
     End;
end;

procedure TContagemCedulas00.Qtde_Vlr_CreditoKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);

        Totaliza();
     End;
end;

procedure TContagemCedulas00.Qtde_Vlr_OutrosKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);

        Totaliza();
     End;
end;

procedure TContagemCedulas00.FormShow(Sender: TObject);

var
   Tecla: Char;
   
begin
    Data_Fechamento.Text := DateToStr(Date() - 1);

    //*** Atualiza o Dia para a Contagem de Cédulas ***
    Tecla := Chr(13);
    Data_FechamentoKeyPress(Sender, Tecla);
    Qtde_0_05.SetFocus;
end;

procedure TContagemCedulas00.Qtde_Vlr_SangriaKeyPress(Sender: TObject;
  var Key: Char);
begin
     So_Valor(Sender,Key);

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);

        Totaliza();
     End;
end;

procedure TContagemCedulas00.btnRegistrarClick(Sender: TObject);

var
  ComandoSQL: String;
  
begin
    Ampulheta();

    //*** Desativa o Botão de registrar ***
    btnRegistrar.Enabled := False;

    //*** Deleta o Registro Anterior da Contagem ***
    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add('DELETE FROM Contagem WHERE Contagem_Data_Fechamento = '+#39+Inverte_Data_Plus(Trim(Data_Fechamento.Text),'amd','-')+#39);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    //*** Insere o Registro na Tabela ***
    ComandoSQL := 'INSERT INTO Contagem(';
    ComandoSQL := ComandoSQL + 'Contagem_Data_Fechamento, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_Abertura, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_Faturamento, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_Dinheiro, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_Debito, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_Credito, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_Outros, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_Total, ';
    ComandoSQL := ComandoSQL + 'Contagem_Qtde_0_05, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_0_05, ';
    ComandoSQL := ComandoSQL + 'Contagem_Qtde_0_10, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_0_10, ';
    ComandoSQL := ComandoSQL + 'Contagem_Qtde_0_25, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_0_25, ';
    ComandoSQL := ComandoSQL + 'Contagem_Qtde_0_50, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_0_50, ';
    ComandoSQL := ComandoSQL + 'Contagem_Qtde_1_00, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_1_00, ';
    ComandoSQL := ComandoSQL + 'Contagem_Total_Moedas, ';
    ComandoSQL := ComandoSQL + 'Contagem_Qtde_2_00, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_2_00, ';
    ComandoSQL := ComandoSQL + 'Contagem_Qtde_5_00, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_5_00, ';
    ComandoSQL := ComandoSQL + 'Contagem_Qtde_10_00, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_10_00, ';
    ComandoSQL := ComandoSQL + 'Contagem_Qtde_20_00, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_20_00, ';
    ComandoSQL := ComandoSQL + 'Contagem_Qtde_50_00, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_50_00, ';
    ComandoSQL := ComandoSQL + 'Contagem_Qtde_100_00, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_100_00, ';
    ComandoSQL := ComandoSQL + 'Contagem_Total_Cedulas, ';
    ComandoSQL := ComandoSQL + 'Contagem_Qtde_Vlr_Debito, ';
    ComandoSQL := ComandoSQL + 'Contagem_Qtde_Vlr_Credito, ';
    ComandoSQL := ComandoSQL + 'Contagem_Qtde_Vlr_Outros, ';
    ComandoSQL := ComandoSQL + 'Contagem_Qtde_Vlr_Sangria, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_Total_Final, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_Somatoria_Total, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_Diferenca, ';
    ComandoSQL := ComandoSQL + 'Contagem_Vlr_Abertura_Caixa, ';
    ComandoSQL := ComandoSQL + 'Contagem_Observacao_Anterior, ';
    ComandoSQL := ComandoSQL + 'Contagem_Observacao_Atual) ';
    ComandoSQL := ComandoSQL + 'VALUES(';
    ComandoSQL := ComandoSQL + #39 + Inverte_Data_Plus(Trim(Data_Fechamento.Text),'amd','-') + #39 + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_Abertura.Text)        + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_Faturamento.Text)     + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_Dinheiro.Text)        + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_Debito.Text)          + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_Credito.Text)         + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_Outros.Text)          + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_Total.Text)           + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Qtde_0_05.Text)           + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_0_05.Text)            + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Qtde_0_10.Text)           + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_0_10.Text)            + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Qtde_0_25.Text)           + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_0_25.Text)            + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Qtde_0_50.Text)           + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_0_50.Text)            + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Qtde_1_00.Text)           + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_1_00.Text)            + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Total_Moedas.Text)        + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Qtde_2_00.Text)           + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_2_00.Text)            + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Qtde_5_00.Text)           + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_5_00.Text)            + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Qtde_10_00.Text)          + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_10_00.Text)           + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Qtde_20_00.Text)          + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_20_00.Text)           + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Qtde_50_00.Text)          + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_50_00.Text)           + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Qtde_100_00.Text)         + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_100_00.Text)          + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Total_Cedulas.Text)       + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Qtde_Vlr_Debito.Text)     + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Qtde_Vlr_Credito.Text)    + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Qtde_Vlr_Outros.Text)     + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Qtde_Vlr_Sangria.Text)    + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_Total_Final.Text)     + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_Somatoria_Total.Text) + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_Diferenca.Text)       + ', ';
    ComandoSQL := ComandoSQL + Virgula_Ponto(Vlr_Abertura_Caixa.Text)  + ', ';
    ComandoSQL := ComandoSQL + #39 + Trim(Observacao_Anterior.Text)    + #39 + ', ';
    ComandoSQL := ComandoSQL + #39 + Trim(Observacao_Atual.Text)       + #39 + ') ';

    //*** Registro da Inclusão ***
    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(ComandoSQL);
    ConexaoBD.SQL_Comunitario.ExecSQL;

    Seta();

    MSG_Erro('Registro efetuado com sucesso...');
end;

procedure TContagemCedulas00.BT_AdicionaClick(Sender: TObject);
begin
     //*** Adiciona as Observações Anteriores ***
     Observacao_Atual.Lines.Add(Trim(Observacao_Anterior.Text));
end;

end.
