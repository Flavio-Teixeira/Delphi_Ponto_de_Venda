unit Caixa_Fechamento_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IdMessage, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP;

type
  TCaixa_Fechamento00 = class(TForm)
    Panel_Botoes: TPanel;
    BT_Fechar: TBitBtn;
    Panel_Valores: TPanel;
    EditVlr_Total: TEdit;
    EditVlr_Faturado: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    lblNro_Cupom: TLabel;
    lblVlr_Cupom: TLabel;
    Valida_Gaveta: TTimer;
    Label5: TLabel;
    EditAbertura: TEdit;
    Label6: TLabel;
    EditSangria: TEdit;
    Label7: TLabel;
    EditCupom: TEdit;
    IdSMTP: TIdSMTP;
    IdMessage: TIdMessage;
    procedure BT_FecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EditVlr_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure EditVlr_FaturadoKeyPress(Sender: TObject; var Key: Char);
    procedure Valida_GavetaTimer(Sender: TObject);
    procedure BT_FecharKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Caixa_Fechamento00: TCaixa_Fechamento00;
  Comando_SQL   : String;

  Caixa_Data    : String;
  Caixa_Hora    : String;
  Caixa_Usuario : String;
  Caixa_Maquina : String;

  Valor_Caixa   : String;
  Valor_Venda   : String;
  Valor_Sangria : String;
  Valor_Abertura: String;
  Valor_Cupom   : String;

  Vlr_Abertura  : Real;
  Vlr_Venda     : Real;
  Vlr_Deposito  : Real;
  Vlr_Sangria   : Real;
  Vlr_Total     : String;

  Qtde_Cupom: Integer; 

  Estado_Gaveta: Integer;

implementation

uses Conexao_BD, Rotinas_Gerais, Frente_Loja_00, Principal_00, GHDL32,
  Splash_Screen_Fechamento;

{$R *.dfm}

procedure TCaixa_Fechamento00.BT_FecharClick(Sender: TObject);

var
  Nome_Maquina: String;

begin
     Ampulheta();

     BT_Fechar.Enabled := False;

     Movto_Registro_Caixa('Fechamento');
     Frente_Loja00.EditPermissao_Fechamento.Text :='Sair';

     Valida_Gaveta.Enabled := True;

     //*** Tela Principal ***
     Principal.Caixa_Aberto.Text         := 'N';
     Principal.T_Valor_Venda_Diaria.Text := '0';
     Principal.T_Valor_Venda.Text        := '0';
     Principal.T_Valor_Sangria.Text      := '0';

     //*** Registro das Vendas ***
     Deleta_Registro_Vendas(Trim(Numero_HD('C')));

     //*************************************
     //*** Envia o E-Mail para os S�cios ***
     //*************************************

     //*** Obtem o Nome da M�quina ***
     Caixa_Maquina := Numero_HD('C');

     //*** Carrega M�quinas ***
     ConexaoBD.SQL_Informacao_Maquinas.Close;
     ConexaoBD.SQL_Informacao_Maquinas.SQL.Clear;
     ConexaoBD.SQL_Informacao_Maquinas.SQL.Add('SELECT * FROM Informacao_Maquinas WHERE Informacao_Maquina_HD = ' +#39+ Trim(Caixa_Maquina) +#39+ ' ORDER BY Informacao_Maquina_Descricao');
     ConexaoBD.SQL_Informacao_Maquinas.Open;

     Nome_Maquina := Trim(ConexaoBD.SQL_Informacao_Maquinas.FieldByName('Informacao_Maquina_Descricao').Text);

     //*** Envia os E-Mails ***
     IdMessage.MessageParts.Clear;

     IdSMTP.Host     := Trim('');
     IdSMTP.Username := Trim('');
     IdSMTP.Password := Trim('');

     IdMessage.From.Address := Trim('');
     IdMessage.From.Name    := Trim('');
     IdMessage.From.Text    := Trim('');

     IdMessage.Recipients.EMailAddresses := Trim('');

     IdMessage.CCList.EMailAddresses := '';
     IdMessage.BccList.EMailAddresses := '';
     IdMessage.Priority := mpNormal;
     IdMessage.Subject := Trim('Vida Perfeita: Faturamento - ' + DateToStr(Date) +  ' - ' + Nome_Maquina);

     IdMessage.Body.Clear;
     IdMessage.Body.Add('Relat�rio de Faturamento: ' + Trim(Nome_Maquina) + ' - Data ' + DateToStr(Date));
     IdMessage.Body.Add('');
     IdMessage.Body.Add('Valor total da loja: R$ ' + Trim(Vlr_Total));
     IdMessage.Body.Add('');
     IdMessage.Body.Add('--- Dados da ' + Trim(Nome_Maquina) + ' ---');
     IdMessage.Body.Add('Quantidade de vendas efetuadas: ' + Trim(EditCupom.Text));
     IdMessage.Body.Add('Valor de abertura: R$ ' + Trim(EditAbertura.Text));
     IdMessage.Body.Add('Valor de vendas: R$ ' + Trim(EditVlr_Faturado.Text));
     IdMessage.Body.Add('Valor de sangria: R$ ' + Trim(EditSangria.Text));
     IdMessage.Body.Add('Valor total no caixa: R$ ' + Trim(EditVlr_Total.Text));
     IdMessage.Body.Add('');
     IdMessage.Body.Add('Atenciosamente,');
     IdMessage.Body.Add('');
     IdMessage.Body.Add('Sitema de gerenciamento');
     IdMessage.Body.Add('');
     IdMessage.Body.Add('--');
     IdMessage.Body.Add('Vida Perfeita');
     IdMessage.Body.Add('');
     IdMessage.Body.Add('Fone/Fax: (0xx11) 4238-3732');
     IdMessage.Body.Add('WebSite: http://www.vidaperfeita.com.br');
     IdMessage.Body.Add('E-Mail: vidaperfeita@vidaperfeita.com.br');

     IdSMTP.Connect;
     Try
        Try
           IdSMTP.Send(IdMessage);
        Except
           MSG_Erro('Erro de envio do relat�rio de fechamento aos s�cios, por favor verifique!!!');
        End;
     Finally
        IdSMTP.Disconnect;
     End;

     Seta();
end;

procedure TCaixa_Fechamento00.FormShow(Sender: TObject);
Var
  Ind, Erro: Integer;
  Vlr_Numero   : Real;
  Vlr_Exibicao : String;
begin
    Ampulheta();

    Application.CreateForm(TSplashScreenFechamento,SplashScreenFechamento);
    SplashScreenFechamento.Show;
    SplashScreenFechamento.Refresh;
    
    SplashScreenFechamento.LBL_Registro.Caption := 'Preparando Jun��o de Dados...';
    SplashScreenFechamento.LBL_Registro.Refresh;

    Vlr_Abertura  := 0.00;
    Vlr_Venda     := 0.00;
    Vlr_Deposito  := 0.00;
    Vlr_Sangria   := 0.00;

    Qtde_Cupom    := 0;

    Caixa_Data    := Inverte_Data_Plus(DateToStr(Date),'amd','-');
    Caixa_Maquina := Numero_HD('C');

    ConexaoBD.SQL_Cabeca_Cupons.Close;
    ConexaoBD.SQL_Cabeca_Cupons.SQL.Clear;
    ConexaoBD.SQL_Cabeca_Cupons.SQL.Add('Select * from Cabeca_Cupons Where (Cabeca_Cupom_Data_Emissao = '+ #39 + Caixa_Data + #39 + ') And (Cabeca_Cupom_Status="Fechado")And(Cabeca_Cupom_Maquina="' + Caixa_Maquina + '") Order By Cabeca_Cupom_Numero DESC');
    ConexaoBD.SQL_Cabeca_Cupons.Open;

    SplashScreenFechamento.LBL_Registro.Caption := 'Selecionando Cupons...';
    SplashScreenFechamento.LBL_Registro.Refresh;

    If ConexaoBD.SQL_Cabeca_Cupons.RecordCount > 0 Then
      Begin
      lblNro_Cupom.Caption := Trim(  ConexaoBD.SQL_Cabeca_CuponsCabeca_Cupom_Numero.AsString );
      Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Cabeca_CuponsCabeca_Cupom_Vlr_Total.AsString));
      Val(Vlr_Exibicao,Vlr_Numero,Erro);
      Str(Vlr_Numero:13:2,Vlr_Exibicao);
      Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));
      lblVlr_Cupom.Caption := 'R$  ' + Trim(Vlr_Exibicao);
    End;

    //*** Seleciona as Vendas de todas as M�quinas ***
    Comando_SQL  := 'SELECT IFNULL(SUM(Registro_Caixa_Valor),0) AS T_Registro_Caixa_Valor FROM Registro_Caixa ';
    Comando_SQL  := Comando_SQL + 'WHERE ';
    Comando_SQL  := Comando_SQL + 'Registro_Caixa_Operacao = '+ #39+ 'Venda' + #39+ ' AND ';
    Comando_SQL  := Comando_SQL + 'Registro_Caixa_Data = '+ #39+ Caixa_Data + #39+ ' ';
    Comando_SQL  := Comando_SQL + 'ORDER BY Registro_Caixa_Hora';

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario.Open;

    Vlr_Exibicao := Trim(Virgula_Ponto(ConexaoBD.SQL_Comunitario.FieldByName('T_Registro_Caixa_Valor').Text));
    Val(Vlr_Exibicao,Vlr_Numero,Erro);
    Str(Vlr_Numero:13:2,Vlr_Exibicao);
    Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));
    Vlr_Total := Trim(Vlr_Exibicao);

    //*** Seleciona as Vendas desta M�quina ***
    Comando_SQL  := 'Select * from Registro_Caixa ';
    Comando_SQL  := Comando_SQL + 'Where ';
    Comando_SQL  := Comando_SQL + '(Registro_Caixa_Data='+ #39+ Caixa_Data    + #39+ ') And ';
    Comando_SQL  := Comando_SQL + '(Registro_Caixa_Maquina="' + Caixa_Maquina + '") ';
    Comando_SQL  := Comando_SQL + 'Order By Registro_Caixa_Hora';

    ConexaoBD.SQL_Registro_Caixa.Close;
    ConexaoBD.SQL_Registro_Caixa.SQL.Clear;
    ConexaoBD.SQL_Registro_Caixa.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Registro_Caixa.Open;

    SplashScreenFechamento.LBL_Registro.Caption := 'Selecionando Registros...';
    SplashScreenFechamento.LBL_Registro.Refresh;

    If ConexaoBD.SQL_Registro_Caixa.RecordCount > 0 Then
      Begin

      While Not ConexaoBD.SQL_Registro_Caixa.Eof Do
            Begin
            
            SplashScreenFechamento.LBL_Registro.Caption := 'Jun��o: Atual - Caixa - Nro.: ' + Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Hora.Text);
            SplashScreenFechamento.LBL_Registro.Refresh;

            If Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Operacao.Text)='Abertura' Then
               Begin
               Vlr_Abertura := Vlr_Abertura + ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Valor.AsFloat;
               End
            Else If Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Operacao.Text)='Venda' Then
               Begin
               Vlr_Venda := Vlr_Venda + ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Valor.AsFloat;
               Qtde_Cupom := Qtde_Cupom + 1;
               End
            Else If Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Operacao.Text)='Dep�sito - Entrada' Then
               Begin
               Vlr_Deposito := Vlr_Deposito + ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Valor.AsFloat;
               End
            Else If Trim(ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Operacao.Text)='Sangria - Retirada' Then
               Begin
               Vlr_Sangria := Vlr_Sangria + ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Valor.AsFloat;
            End;

            ConexaoBD.SQL_Registro_Caixa.Next;
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

      SplashScreenFechamento.LBL_Registro.Caption := 'Fechamento Finalizado.';
      SplashScreenFechamento.LBL_Registro.Refresh;
    End;

    SplashScreenFechamento.Close;
    SplashScreenFechamento.Destroy;

    Seta();
end;

procedure TCaixa_Fechamento00.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #27 Then
       Begin
       Caixa_Fechamento00.Close;
    End;
end;

procedure TCaixa_Fechamento00.EditVlr_TotalKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #27 Then
       Begin
       Caixa_Fechamento00.Close;
    End;
end;

procedure TCaixa_Fechamento00.EditVlr_FaturadoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #27 Then
       Begin
       Caixa_Fechamento00.Close;
    End;
end;

procedure TCaixa_Fechamento00.Valida_GavetaTimer(Sender: TObject);
begin
    If UpperCase(Trim(Principal.Edit_Gaveta.Text)) = 'S' Then
       Begin

       Estado_Gaveta := DriverGaveta(GAVETA_COM1, GAVETA_ESTADO);

       If Estado_Gaveta = GAVETA_FECHADA Then
          Begin
          If BT_Fechar.Enabled = False Then
             Begin
             Caixa_Fechamento00.Close;
          End;
       End;
       
       End
    Else
       Begin
       Caixa_Fechamento00.Close;
    End;
end;

procedure TCaixa_Fechamento00.BT_FecharKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #27 Then
       Begin
       Caixa_Fechamento00.Close;
    End;
end;

end.
