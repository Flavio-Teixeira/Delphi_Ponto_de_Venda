unit Caixa_Sangria_03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TCaixa_Sangria03 = class(TForm)
    Panel_Botoes: TPanel;
    BT_Sair: TBitBtn;
    BT_Retirar: TBitBtn;
    Panel_Valores: TPanel;
    Label1: TLabel;
    EditVlr_Sangria: TEdit;
    BitBtn1: TBitBtn;
    Edit_Data: TEdit;
    Edit_Hora: TEdit;
    Edit_Operacao: TEdit;
    Edit_Maquina: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure EditVlr_SangriaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BT_RetirarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Caixa_Sangria03: TCaixa_Sangria03;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TCaixa_Sangria03.BT_SairClick(Sender: TObject);
begin
    Caixa_Sangria03.Close;
end;

procedure TCaixa_Sangria03.EditVlr_SangriaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Key = #27 Then
        Begin
        Caixa_Sangria03.Close;
     End;

     If Key = #13 Then
        Begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
        End
     Else
      Begin
      So_Valor(Sender,Key);
    End;
end;

procedure TCaixa_Sangria03.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #27 Then Caixa_Sangria03.Close;
end;

procedure TCaixa_Sangria03.BT_RetirarClick(Sender: TObject);
Var
  Comando_SQL, Valor_Caixa : String;
  Ano, Mes, Dia: Word;
  Str_Ano, Str_Mes, Str_Dia, Str_Data: String;
begin
    If (Trim(EditVlr_Sangria.Text)<>'') and (StrToFloat(EditVlr_Sangria.Text)<= 10000) Then
      Begin
        Valor_Caixa := Virgula_Ponto( Trim( EditVlr_Sangria.Text ));

        // *** Inverte data ***
        DecodeDate(StrToDate(Edit_Data.Text), Ano, Mes, Dia);
        Str_Ano := IntToStr(Ano);
        Str_Mes := IntToStr(Mes);
        Str_Dia := IntToStr(Dia);
        Str_Data := Trim(Str_Ano)+'-'+Trim(Str_Mes)+'-'+Trim(Str_Dia);


        // *** Valor Sangria ***
        Comando_SQL := 'Update Registro_Caixa set ';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Valor = '+Valor_Caixa+' ';
        Comando_SQL := Comando_SQL + 'Where (Registro_Caixa_Data = '     +#39+ Str_Data                +#39+ ') And ';
        Comando_SQL := Comando_SQL +       '(Registro_Caixa_Hora = '     +#39+ Trim(Edit_Hora.Text)    +#39+ ') And ';
        Comando_SQL := Comando_SQL +       '(Registro_Caixa_Operacao = ' +#39+ Trim(Edit_Operacao.Text)+#39+ ') And ';
        Comando_SQL := Comando_SQL +       '(Registro_Caixa_Maquina = '  +#39+ Trim(Edit_Maquina.Text) +#39+ ')';

        ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
        ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;
        Prepara_Tela();

        Caixa_Sangria03.Close;
      End
    Else if StrToFloat(EditVlr_Sangria.Text)> 10000 Then
      Begin
        MSG_Erro('Valor não pode ser superior a 10.000,00...');
        EditVlr_Sangria.SetFocus;
      End
    Else
      Begin
      Caixa_Sangria03.Close;
    End;
end;

procedure TCaixa_Sangria03.BitBtn1Click(Sender: TObject);
Var
  Comando_SQL, Valor_Caixa : String;
  Ano, Mes, Dia: Word;
  Str_Ano, Str_Mes, Str_Dia, Str_Data: String;
begin
    If (Trim(EditVlr_Sangria.Text)<>'') and (StrToFloat(EditVlr_Sangria.Text)<= 10000) Then
      Begin
        Valor_Caixa := Virgula_Ponto( Trim( EditVlr_Sangria.Text ));

        // *** Inverte data ***
        DecodeDate(StrToDate(Edit_Data.Text), Ano, Mes, Dia);
        Str_Ano := IntToStr(Ano);
        Str_Mes := IntToStr(Mes);
        Str_Dia := IntToStr(Dia);
        Str_Data := Trim(Str_Ano)+'-'+Trim(Str_Mes)+'-'+Trim(Str_Dia);


        // *** Valor Sangria ***
        Comando_SQL := 'Delete from Registro_Caixa ';
        Comando_SQL := Comando_SQL + 'Where (Registro_Caixa_Data = '     +#39+ Str_Data                +#39+ ') And ';
        Comando_SQL := Comando_SQL +       '(Registro_Caixa_Hora = '     +#39+ Trim(Edit_Hora.Text)    +#39+ ') And ';
        Comando_SQL := Comando_SQL +       '(Registro_Caixa_Operacao = ' +#39+ Trim(Edit_Operacao.Text)+#39+ ') And ';
        Comando_SQL := Comando_SQL +       '(Registro_Caixa_Maquina = '  +#39+ Trim(Edit_Maquina.Text) +#39+ ')';

        ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
        ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

        Caixa_Sangria03.Close;
      End
    Else if StrToFloat(EditVlr_Sangria.Text)> 10000 Then
      Begin
        MSG_Erro('Valor não pode ser superior a 10.000,00...');
        EditVlr_Sangria.SetFocus;
      End
    Else
      Begin
      Caixa_Sangria03.Close;
    End;
end;

end.
