unit Rel_Item_Apagado_Venda_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TRelItemApagadoVenda00 = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    LBL_Registro: TLabel;
    Rel_Periodo_Inicial: TMaskEdit;
    Rel_Periodo_Final: TMaskEdit;
    Maquinas: TComboBox;
    pan_Botoes: TPanel;
    BT_Sair: TBitBtn;
    BT_Imprimir: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure Rel_Periodo_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Rel_Periodo_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure MaquinasKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelItemApagadoVenda00: TRelItemApagadoVenda00;

implementation

uses Conexao_BD, Rotinas_Gerais, Login_00, Rel_Item_Apagado_Venda_01;

{$R *.dfm}

procedure TRelItemApagadoVenda00.BT_SairClick(Sender: TObject);
begin
     RelItemApagadoVenda00.Close;
end;

procedure TRelItemApagadoVenda00.Rel_Periodo_InicialKeyPress(
  Sender: TObject; var Key: Char);
begin
    So_Numero(Sender, Key);

    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRelItemApagadoVenda00.Rel_Periodo_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
    So_Numero(Sender, Key);

    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRelItemApagadoVenda00.MaquinasKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
      Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    End;
end;

procedure TRelItemApagadoVenda00.FormShow(Sender: TObject);
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

procedure TRelItemApagadoVenda00.BT_ImprimirClick(Sender: TObject);

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

     //*** Carrega o Item Cancelado ***

     ConexaoBD.SQL_Comunitario_Secundario.Close;
     ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
     ConexaoBD.SQL_Comunitario_Secundario.SQL.Add('Truncate Item_Cancelado_Movto');
     ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

     //*** Prepara a Junção do BD ***

     Data_Movto_Inicio := Rel_Periodo_Inicial.Text;
     Data_Movto_Final  := Rel_Periodo_Final.Text;
     DT_Processada     := '';

     LBL_Registro.Caption := 'Preparando Junção de Dados...';
     LBL_Registro.Refresh;

    //*** Carrega os Itens Cancelados ***

    ConexaoBD.SQL_Item_Cancelado.Close;
    ConexaoBD.SQL_Item_Cancelado.SQL.Clear;
    ConexaoBD.SQL_Item_Cancelado.SQL.Add('Select * From Item_Cancelado Where (Item_Cancelado_Data >='+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-')+#39+') and (Item_Cancelado_Data <='+#39+Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-')+#39+')');
    ConexaoBD.SQL_Item_Cancelado.Open;

    LBL_Registro.Caption := 'Junção: Atual - Caixa - Nro.: ' + Trim(ConexaoBD.SQL_Item_CanceladoItem_Cancelado_Hora.Text);
    LBL_Registro.Refresh;

    If Not ConexaoBD.SQL_Item_Cancelado.Eof Then
       Begin

       ConexaoBD.SQL_Item_Cancelado.First;

       While Not ConexaoBD.SQL_Item_Cancelado.Eof Do
             Begin

             LBL_Registro.Caption := 'Junção: Atual - Caixa - Nro.: ' + Trim(ConexaoBD.SQL_Item_CanceladoItem_Cancelado_Hora.Text);
             LBL_Registro.Refresh;

             Comando_SQL := 'Insert into Item_Cancelado_Movto(';
             Comando_SQL := Comando_SQL + 'Item_Cancelado_Data, ';
             Comando_SQL := Comando_SQL + 'Item_Cancelado_Hora, ';
             Comando_SQL := Comando_SQL + 'Item_Cancelado_Maquina, ';
             Comando_SQL := Comando_SQL + 'Item_Cancelado_Usuario, ';
             Comando_SQL := Comando_SQL + 'Item_Cancelado_Prod_Cod, ';
             Comando_SQL := Comando_SQL + 'Item_Cancelado_Prod_Desc, ';
             Comando_SQL := Comando_SQL + 'Item_Cancelado_Prod_Qtde) ';
             Comando_SQL := Comando_SQL + ' Values(';
             Comando_SQL := Comando_SQL + #39 + Inverte_Data_Plus(Trim(ConexaoBD.SQL_Item_CanceladoItem_Cancelado_Data.Text),'amd','-') +#39+ ',';
             Comando_SQL := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Item_CanceladoItem_Cancelado_Hora.Text) + '",';
             Comando_SQL := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Item_CanceladoItem_Cancelado_Maquina.Text) + '",';
             Comando_SQL := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Item_CanceladoItem_Cancelado_Usuario.Text) + '",';
             Comando_SQL := Comando_SQL +       Trim(ConexaoBD.SQL_Item_CanceladoItem_Cancelado_Prod_Cod.Text) + ',';
             Comando_SQL := Comando_SQL + '"' + Trim(ConexaoBD.SQL_Item_CanceladoItem_Cancelado_Prod_Desc.Text) + '",';
             Comando_SQL := Comando_SQL +       Trim(ConexaoBD.SQL_Item_CanceladoItem_Cancelado_Prod_Qtde.Text) + ')';

             ConexaoBD.SQL_Comunitario_Secundario.Close;
             ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
             ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
             ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

             ConexaoBD.SQL_Item_Cancelado.Next;
       End;

    End;

     LBL_Registro.Caption := 'Processo Finalizado...';
     LBL_Registro.Refresh;

    //Application.CreateForm(TRel_RegistroCaixa01,Rel_RegistroCaixa01);

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

    Comando_SQL := 'Select * from Item_Cancelado_Movto, Informacao_Maquinas_Vazio';
    Comando_SQL := Comando_SQL + ' Where (';
    Comando_SQL := Comando_SQL + ' (Item_Cancelado_Data >=' +#39+ Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-') +#39+ ') And ';
    Comando_SQL := Comando_SQL + ' (Item_Cancelado_Data <=' +#39+ Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-')   +#39+ ')';

    If Maquinas.Text <> '--- Todas as Máquinas ---' Then
      Begin
      Comando_SQL := Comando_SQL + ' And (Item_Cancelado_Maquina = "' + Obtem_Nro_Antes_Traco(  Trim( Maquinas.Text ) )   + '")';
    End;

    Comando_SQL := Comando_SQL + ' And Item_Cancelado_Maquina=Informacao_Maquina_HD ';
    Comando_SQL := Comando_SQL + ') Order by Item_Cancelado_Maquina, Item_Cancelado_Data, Item_Cancelado_Hora';

    ConexaoBD.SQL_Item_Cancelado_Rel.Close;
    ConexaoBD.SQL_Item_Cancelado_Rel.SQL.Clear;
    ConexaoBD.SQL_Item_Cancelado_Rel.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Item_Cancelado_Rel.Open;

    Application.CreateForm(TRelItemApagadoVenda01,RelItemApagadoVenda01);
    RelItemApagadoVenda01.QR_Fornecedor.PreviewModal;
    RelItemApagadoVenda01.Destroy;

    BT_Imprimir.Enabled := True;
    BT_Sair.Enabled     := True;

    Seta();
    End
  Else
    Begin
    MSG_Erro('Data inicial não pode ser maior que a final...');
    Rel_Periodo_Inicial.SetFocus;

  End;
end;

end.
