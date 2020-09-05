unit Limpeza_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TLimpeza00 = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Periodo_Inicial: TMaskEdit;
    Periodo_Final: TMaskEdit;
    pan_Botoes: TPanel;
    BT_Sair: TBitBtn;
    BT_Limpar: TBitBtn;
    procedure BT_SairClick(Sender: TObject);
    procedure Periodo_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure Periodo_FinalKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BT_LimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Limpeza00: TLimpeza00;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TLimpeza00.BT_SairClick(Sender: TObject);
begin
    Limpeza00.Close;
end;

procedure TLimpeza00.Periodo_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
        End
     Else
        Begin
        So_Numero(Sender, Key);
     End;
end;

procedure TLimpeza00.Periodo_FinalKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
        End
     Else
        Begin
        So_Numero(Sender, Key);
     End;
end;

procedure TLimpeza00.FormShow(Sender: TObject);
begin
    Periodo_Inicial.Text := DateToStr(Date() - 1);
    Periodo_Final.Text   := DateToStr(Date() - 1);
end;

procedure TLimpeza00.BT_LimparClick(Sender: TObject);
Var
  Comando_SQL, Nro_Cabeca : String;
begin

  If StrToDate(Periodo_Inicial.Text)>StrToDate(Periodo_Final.Text) Then
    Begin
    MSG_Erro('Data inicial não pode ser maior que a final...');
    Periodo_Inicial.SetFocus;
    End
  Else If StrToDate(Periodo_Inicial.Text) >= Date() Then
    Begin
    MSG_Erro('Data Inicial não pode ser maior/igual ao dia atual...');
    Periodo_Inicial.SetFocus;
    End
  Else If StrToDate(Periodo_Final.Text) >= Date() Then
    Begin
    MSG_Erro('Data Final não pode ser maior/igual ao dia atual...');
    Periodo_Final.SetFocus;
    End
  Else
    Begin

    Ampulheta();

      // Apaga itens de Registro_Caixa
          Comando_SQL := 'Delete From Registro_Caixa Where ';
          Comando_SQL := Comando_SQL + ' (Registro_Caixa_Data       >=' + #39+ Inverte_Data_Plus(Trim(Periodo_Inicial.Text),'amd','-') + #39+ ') And ';
          Comando_SQL := Comando_SQL + ' (Registro_Caixa_Data       <=' + #39+ Inverte_Data_Plus(Trim(Periodo_Final.Text),'amd','-')   + #39+ ')';
          ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
          ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
          ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

      // Apaga itens de Corpo_Cupons
          Comando_SQL := 'Select * From Cabeca_Cupons Where';
          Comando_SQL := Comando_SQL + ' (Cabeca_Cupom_Data_Emissao >=' + #39+ Inverte_Data_Plus(Trim(Periodo_Inicial.Text),'amd','-') + #39+ ') And ';
          Comando_SQL := Comando_SQL + ' (Cabeca_Cupom_Data_Emissao <=' + #39+ Inverte_Data_Plus(Trim(Periodo_Final.Text),'amd','-')   + #39+ ')';
          ConexaoBD.SQL_Cabeca_Cupons.Close;
          ConexaoBD.SQL_Cabeca_Cupons.SQL.Clear;
          ConexaoBD.SQL_Cabeca_Cupons.SQL.Add(Comando_SQL);
          ConexaoBD.SQL_Cabeca_Cupons.Open;

          While Not ConexaoBD.SQL_Cabeca_Cupons.Eof Do
            Begin

              Nro_Cabeca  := ConexaoBD.SQL_Cabeca_CuponsCabeca_Cupom_Numero.AsString;

              ConexaoBD.SQL_Comunitario_Secundario.Close;
              ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
              ConexaoBD.SQL_Comunitario_Secundario.SQL.Add('Delete From Corpo_Cupons Where Corpo_Cupom_Cabeca=' + Trim(Nro_Cabeca));
              ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

              ConexaoBD.SQL_Cabeca_Cupons.Next;

          End;

      // Apaga itens de Cabeca_Cupons
          Comando_SQL := 'Delete From Cabeca_Cupons Where ';
          Comando_SQL := Comando_SQL + ' (Cabeca_Cupom_Data_Emissao >=' + #39+ Inverte_Data_Plus(Trim(Periodo_Inicial.Text),'amd','-') + #39+ ') And ';
          Comando_SQL := Comando_SQL + ' (Cabeca_Cupom_Data_Emissao <=' + #39+ Inverte_Data_Plus(Trim(Periodo_Final.Text),'amd','-')   + #39+ ')';
          ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
          ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
          ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

    Seta();

    MSG_Erro('Limpeza concluída com sucesso...');
    Limpeza00.Close;

  End;
end;

end.
