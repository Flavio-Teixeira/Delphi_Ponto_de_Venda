unit Rel_RegistroCaixa_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TRel_RegistroCaixa00 = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Rel_Periodo_Inicial: TMaskEdit;
    Rel_Periodo_Final: TMaskEdit;
    pan_Botoes: TPanel;
    BT_Sair: TBitBtn;
    BT_Imprimir: TBitBtn;
    Maquinas: TComboBox;
    Label1: TLabel;
    LBL_Registro: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Rel_Periodo_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Rel_Periodo_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure MaquinasKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rel_RegistroCaixa00: TRel_RegistroCaixa00;

implementation

uses Rotinas_Gerais, Rel_RegistroCaixa_01, Conexao_BD, Login_00;

{$R *.dfm}

procedure TRel_RegistroCaixa00.FormShow(Sender: TObject);
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
end;

procedure TRel_RegistroCaixa00.Rel_Periodo_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
    So_Numero(Sender, Key);

    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRel_RegistroCaixa00.Rel_Periodo_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
    So_Numero(Sender, Key);

    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRel_RegistroCaixa00.BT_ImprimirClick(Sender: TObject);

Var
   Comando_SQL : String;
   DT_Arquivo, Data_Movto_Inicio, Data_Movto_Final, Caminho, Caminho_Resultado, DT_Processada: String;

begin
  If StrToDate(Rel_Periodo_Inicial.Text)<=StrToDate(Rel_Periodo_Final.Text) Then
    Begin

    Ampulheta();

    BT_Imprimir.Enabled := False;
    BT_Sair.Enabled     := False;

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

    Application.CreateForm(TRel_RegistroCaixa01,Rel_RegistroCaixa01);

    //*** Carrega Informação das Máquinas ***

    ConexaoBD.SQL_Comunitario_Secundario.Close;
    ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
    ConexaoBD.SQL_Comunitario_Secundario.SQL.Add('Truncate Informacao_Maquinas_Vazio');
    ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

    ConexaoBD.SQL_Informacao_Maquinas.Close;
    ConexaoBD.SQL_Informacao_Maquinas.SQL.Clear;
    ConexaoBD.SQL_Informacao_Maquinas.SQL.Add('Select * From Informacao_Maquinas Order By Informacao_Maquina_Descricao');
    ConexaoBD.SQL_Informacao_Maquinas.Open;

    While Not ConexaoBD.SQL_Informacao_Maquinas.Eof Do
          Begin
          Comando_SQL := 'Insert Into Informacao_Maquinas_Vazio(';
          Comando_SQL := Comando_SQL + 'Informacao_Maquina_HD, ';
          Comando_SQL := Comando_SQL + 'Informacao_Maquina_Descricao) ';
          Comando_SQL := Comando_SQL + 'Values(' + #39+ Trim(ConexaoBD.SQL_Informacao_MaquinasInformacao_Maquina_HD.Text) + #39 + ', ';
          Comando_SQL := Comando_SQL + #39+ Trim(ConexaoBD.SQL_Informacao_MaquinasInformacao_Maquina_Descricao.Text) + #39 + ') ';

          ConexaoBD.SQL_Comunitario_Secundario.Close;
          ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
          ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
          ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

          ConexaoBD.SQL_Informacao_Maquinas.Next;
    End;

    //*** Prepara o Relatório ***

    Comando_SQL := 'Select * from Registro_Caixa_Movto,Informacao_Maquinas_Vazio';
    Comando_SQL := Comando_SQL + ' Where (';
    Comando_SQL := Comando_SQL + ' (Registro_Caixa_Data >=' +#39+ Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-') +#39+ ') And ';
    Comando_SQL := Comando_SQL + ' (Registro_Caixa_Data <=' +#39+ Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-')   +#39+ ')';

    If Maquinas.Text <> '--- Todas as Máquinas ---' Then
      Begin
      Comando_SQL := Comando_SQL + ' And (Registro_Caixa_Maquina = "' + Obtem_Nro_Antes_Traco(  Trim( Maquinas.Text ) )   + '")';
    End;

    Comando_SQL := Comando_SQL + ' And Registro_Caixa_Maquina=Informacao_Maquina_HD ';
    Comando_SQL := Comando_SQL + ') Order by Registro_Caixa_Maquina, Registro_Caixa_Data, Registro_Caixa_Hora';

    ConexaoBD.SQL_Registro_Caixa_Rel.Close;
    ConexaoBD.SQL_Registro_Caixa_Rel.SQL.Clear;
    ConexaoBD.SQL_Registro_Caixa_Rel.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Registro_Caixa_Rel.Open;

    Rel_RegistroCaixa01.QR_RegistroCaixa.PreviewModal;
    Rel_RegistroCaixa01.Destroy;

    BT_Imprimir.Enabled := True;
    BT_Sair.Enabled     := True;

    Seta();
    End
  Else
    Begin
    MSG_Erro('Data inicial não pode ser maior que a final...');
    Rel_Periodo_Inicial.SetFocus;

  End;

End;

procedure TRel_RegistroCaixa00.BT_SairClick(Sender: TObject);
begin
    Rel_RegistroCaixa00.Close;
end;

procedure TRel_RegistroCaixa00.MaquinasKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

End.
