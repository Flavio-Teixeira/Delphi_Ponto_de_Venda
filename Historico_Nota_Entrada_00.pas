unit Historico_Nota_Entrada_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  THistoricoNotaEntrada00 = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    LBL_Registro: TLabel;
    Rel_Periodo_Inicial: TMaskEdit;
    Rel_Periodo_Final: TMaskEdit;
    pan_Botoes: TPanel;
    BT_Sair: TBitBtn;
    BT_Imprimir: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HistoricoNotaEntrada00: THistoricoNotaEntrada00;

implementation

uses Conexao_BD, Rotinas_Gerais, Historico_Nota_Entrada_01;

{$R *.dfm}

procedure THistoricoNotaEntrada00.BT_SairClick(Sender: TObject);
begin
     HistoricoNotaEntrada00.Close;
end;

procedure THistoricoNotaEntrada00.BT_ImprimirClick(Sender: TObject);

var
   Comando_SQL: String;
   
begin
    If StrToDate(Rel_Periodo_Inicial.Text)<=StrToDate(Rel_Periodo_Final.Text) Then
       Begin
       Comando_SQL := 'Select * from Entrada_Nota_Cabeca ';
       Comando_SQL := Comando_SQL + ' Where ';
       Comando_SQL := Comando_SQL + ' (Entrada_Nota_Cabeca_Emissao >=' +#39+ Inverte_Data_Plus(Trim(Rel_Periodo_Inicial.Text),'amd','-') +#39+ ') And ';
       Comando_SQL := Comando_SQL + ' (Entrada_Nota_Cabeca_Emissao <=' +#39+ Inverte_Data_Plus(Trim(Rel_Periodo_Final.Text),'amd','-')   +#39+ ')';

       ConexaoBD.SQL_Entrada_Nota_Cabeca.Close;
       ConexaoBD.SQL_Entrada_Nota_Cabeca.SQL.Clear;
       ConexaoBD.SQL_Entrada_Nota_Cabeca.SQL.Add(Comando_SQL);
       ConexaoBD.SQL_Entrada_Nota_Cabeca.Open;

       Application.CreateForm(THistoricoNotaEntrada01,HistoricoNotaEntrada01);

       HistoricoNotaEntrada01.QRL_DataInicial.Caption := Rel_Periodo_Inicial.Text;
       HistoricoNotaEntrada01.QRL_DataFinal.Caption   := Rel_Periodo_Final.Text;
       
       HistoricoNotaEntrada01.QR_Historico.PreviewModal;
       HistoricoNotaEntrada01.Destroy;
       End
    Else
       Begin
       MSG_Erro('Data inicial não pode ser maior que a final...');
       Rel_Periodo_Inicial.SetFocus;
    End;
end;

end.
