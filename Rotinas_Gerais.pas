unit Rotinas_Gerais;

interface

uses SysUtils, Forms, Windows, Messages, Variants, Classes, Graphics, Controls, Ghdl32,
     Dialogs, Menus, ExtCtrls, StdCtrls, ComCtrls, TabNotBk, DB, DBTables, DBCtrls;

// ******************
// ***** Funções ****
// ******************

Function Troca_Caracter(Caracter, Troca, Texto: String): string;
Function GavetaConfigura (pulso,min : Integer): Integer; stdcall; external 'Ghdl32.dll';
Function DriverGaveta (p,f : Integer) :Integer; stdcall; external 'Ghdl32.dll';

Function Carrega_Conexao(): String;

Function MostraData:String;
Function MSG_Erro(strTexto: String): Integer;
Function Confirma(strTexto: String): Integer;
Function Numero_HD(FDrive:String): String;
Function Encripta_HD(FDrive:String): String;
Function Ponto_Virgula(Valor: String): String;
Function Virgula_Ponto(Valor: String): String;
Function Inverte_Data(DT: String): String;
function Inverte_Data_Plus(DT, Formato, Separador: String): String;
Function Valida_Data(StrData: String):Boolean;
Function Valida_CNPJ(xCNPJ: String):Boolean;
function Valida_CPF(num_cpf: String): Boolean;

Function Texto_Grava(Texto:String):String;

Function Obtem_Nro_Antes_Traco(Texto: String): String;
Function Obtem_Depois_Traco(Texto: String): String;

Function Retira_Caracter(Texto, Caracter: String): String;

Function Espacos(Qtde: Integer): String;
Function Exibe_Nro_Impressao(Numero: String; Tamanho: Integer): String;
Function Letra_Maiuscula(Texto: String): string;

function Obtem_Nro_Tipo_Codigo(Tipo_Codigo: String): Integer;
function Obtem_Nro_Estado(Estado: String): Integer;
function Obtem_Nro_Status_Credito(Status_Credito: String): Integer;
function Obtem_Nro_Tipo_Pessoa(Tipo_Pessoa: String): Integer;
function Obtem_Nro_Pais(Pais: String): Integer;
function Obtem_Nro_Opcao_Cobranca(Opcao_Cobranca: String): Integer;
function Obtem_Nro_Opcao_Entrega(Opcao_Entrega: String): Integer;

// ******************
// *** Procedures ***
// ******************

Procedure Seta();
Procedure Ampulheta();
Procedure So_Valor(Sender: TObject; var Key: Char);
Procedure So_Numero(Sender: TObject; var Key: Char);
Procedure So_Numero_Vezes(Sender: TObject; var Key: Char);
Procedure Abre_Gaveta();
Procedure Inicializa_Gaveta();

Procedure Fecha_Tudo();

Procedure Carrega_Grupos(Tela:String);
Procedure Carrega_Fornecedores(Tela:String);

Procedure Procura_Grupos(Tela, Codigo:String);
Procedure Procura_Fornecedores(Tela, Codigo:String);

Procedure Prepara_Tela();
Procedure Prepara_Caixa();

Procedure Movto_Lista(Codigo,Tipo,Operacao:String;Qtde:Integer);
Procedure Movto_Registro_Caixa(Tipo:String);

Procedure Apaga_Item();
Procedure Atualiza_Totais();
Procedure Fecha_Cupom();
Procedure Prepara_Valores();
Procedure Cancela_Cupom_Atual();
Procedure Grava_Cupom();

Procedure Movto_Ponteiro(Acao, Tabela: String);

Procedure Registro_Vendas(Maquina, Vlr_Vendas, Vlr_Sangria, Vlr_Venda_Diaria: String);
Procedure Deleta_Registro_Vendas(Maquina: String);

// *******************************
// *** Processamento Principal ***
// *******************************

Var
  Serial  : Integer;
  FUNCAO  : Integer;

Implementation

uses Conexao_BD, Produtos_02, Produtos_01, Frente_Loja_00,
  Caixa_Abertura_00, Caixa_Fechamento_00, Principal_00,
  Fechamento_Cupom_00, Caixa_Deposito_00, Caixa_Sangria_00, Grids,
  Apaga_Item_00, Grupos_02, Fornecedores_02, Entrada_Produtos_NF_00,
  Splash_Screen, Rel_Estoque_Minimo_00;

// ***************
// *** Funções ***
// ***************

function Troca_Caracter(Caracter, Troca, Texto: String): string;

Var
   Ind: Integer;
   Resultado: String;

begin
     Resultado := ' ';

     For Ind := 1 To Length(Texto) Do
         Begin

         If Texto[Ind] <> Caracter Then
            Begin
            Resultado := Resultado + Texto[Ind];
            End
         Else
            Begin
            Resultado := Resultado + Troca;
         End;

     End;

     Troca_Caracter := Trim(Resultado);
end;

function Carrega_Conexao(): String;
var
   Caminho, Caminho_Resultado: String;

Begin
{*** Prepara a Conexão com as Tabelas e Querys ***}

     ConexaoBD.Conexao_Principal.Connected := True;

     Result := '';
End;

function MostraData: String;
var
   dtHoje: TDateTime;
   intDiaSemana: Integer;
   strDiaSemana: String;

begin
     dtHoje := Date;
     intDiaSemana := DayOfWeek(dtHoje);
     case intDiaSemana of
          1: strDiaSemana := 'Domingo - ';
          2: strDiaSemana := 'Segunda-feira - ';
          3: strDiaSemana := 'Terça-feira - ';
          4: strDiaSemana := 'Quarta-feira - ';
          5: strDiaSemana := 'Quinta-feira - ';
          6: strDiaSemana := 'Sexta-feira - ';
          7: strDiaSemana := 'Sábado - ';
     end;
     Result := strDiaSemana + DateToStr(dtHoje);
end;

function MSG_Erro(strTexto: String):Integer;
begin
     Result := Application.MessageBox(PChar(strTexto),'Atenção !!!',mb_OK+mb_IconExclamation);
end;

function Confirma(strTexto: String):Integer;
begin
     Result := Application.MessageBox(PChar(strTexto),'Confirmação',mb_YesNo+mb_DefButton2+mb_IconQuestion);
end;

function Numero_HD(FDrive:String): String;

var
    Serial:DWord;
    DirLen,Flags: DWord;
    DLabel : Array[0..11] of Char;

begin
     Try
        GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
        Result := IntToHex(Serial,8);
        Except Result :='';
     end;
end;

function Encripta_HD(FDrive:String): String;

var
   Ind: Integer;
   Encriptado: String;

begin
     Encriptado := '*';
     For Ind := 1 To Length( Trim(FDrive) ) do
         begin
         if (FDrive[Ind] in ['0'..'9']) Then
            begin
            Encriptado := Encriptado +  Chr(Ord(FDrive[Ind]) - 22);
            end
         else
            begin
            Encriptado := Encriptado +  Chr(Ord(FDrive[Ind]) - 64);
         end;
     end;
     Encriptado := Encriptado + '*';

     Result := Encriptado;
end;

function Ponto_Virgula(Valor: String): String;
Var
   Ind: Integer;
begin
     if Length(Valor) > 0 then
        begin
        for Ind := 0 to Length(Valor) do
            begin
            if Valor[Ind] = '.' then
               begin
               Valor[Ind] := ',';
            end;
        end;
     end;
     Ponto_Virgula := valor;
end;

function Virgula_Ponto(Valor: String): String;
Var
   Ind: Integer;
begin
     if Length(Valor) > 0 then
        begin
        for Ind := 0 to Length(Valor) do
            begin
            if Valor[Ind] = ',' then
               begin
               Valor[Ind] := '.';
            end;
        end;
     end;
     Virgula_Ponto := valor;
end;

function Inverte_Data(DT: String): String;
var
  Ano, Mes, Dia: Word;
  Str_Ano, Str_Mes, Str_Dia, Str_Data: String;

begin
     DecodeDate(StrToDate(DT), Ano, Mes, Dia);

     Str_Ano := IntToStr(Ano);
     Str_Mes := IntToStr(Mes);
     Str_Dia := IntToStr(Dia);

     Str_Data := Trim(Str_Mes)+'/'+Trim(Str_Dia)+'/'+Trim(Str_Ano);

     Inverte_Data := Str_Data;
end;


function Inverte_Data_Plus(DT, Formato, Separador: String): String;

var
  Ano, Mes, Dia: Word;
  Str_Ano, Str_Mes, Str_Dia, Str_Data: String;

begin
     If ((Trim(DT) <> '') And (Trim(DT) <> '/  /')) Then
        Begin
        DecodeDate(StrToDate(DT), Ano, Mes, Dia);

        Str_Ano := IntToStr(Ano);
        Str_Mes := IntToStr(Mes);
        Str_Dia := IntToStr(Dia);

        If Formato = 'dma' Then
           Begin
           Str_Data := Trim(Str_Dia)+Trim(Separador)+Trim(Str_Mes)+Trim(Separador)+Trim(Str_Ano);
           End
        Else If Formato = 'amd' Then
           Begin
           Str_Data := Trim(Str_Ano)+Trim(Separador)+Trim(Str_Mes)+Trim(Separador)+Trim(Str_Dia);
           End
        Else If Formato = 'mda' Then
           Begin
           Str_Data := Trim(Str_Mes)+Trim(Separador)+Trim(Str_Dia)+Trim(Separador)+Trim(Str_Ano);
           End
        Else If Formato = 'mad' Then
           Begin
           Str_Data := Trim(Str_Mes)+Trim(Separador)+Trim(Str_Ano)+Trim(Separador)+Trim(Str_Dia);
        End;
        End
     Else
        Begin
        Str_Data := '';
     End;

     Inverte_Data_Plus := Str_Data;
end;

function Valida_Data(StrData: String):Boolean;
begin
     Result := True;
     try
        StrToDate(StrData);
     except
        on EConvertError do
           Result := False;
     end;
end;

function Valida_CNPJ(xCNPJ: String):Boolean;
Var
  d1,d4,xx,nCount,fator,resto,digito1,digito2 : Integer;
  Check : String;

begin
     d1 := 0;
     d4 := 0;
     xx := 1;

     for nCount := 1 to Length( xCNPJ )-2 do
         begin
         if Pos( Copy( xCNPJ, nCount, 1 ), '/-.' ) = 0 then
            begin
            if xx < 5 then
               begin
               fator := 6 - xx;
               end
            else
               begin
               fator := 14 - xx;
            end;
            d1 := d1 + StrToInt( Copy( xCNPJ, nCount, 1 ) ) * fator;
            if xx < 6 then
               begin
               fator := 7 - xx;
               end
            else
               begin
               fator := 15 - xx;    end;
               d4 := d4 + StrToInt( Copy( xCNPJ, nCount, 1 ) ) * fator;
               xx := xx+1;
            end;
         end;
         resto := (d1 mod 11);
         if resto < 2 then
            begin
            digito1 := 0;
            end
         else
            begin
            digito1 := 11 - resto;
         end;
         d4 := d4 + 2 * digito1;
         resto := (d4 mod 11);
         if resto < 2 then
            begin
            digito2 := 0;
            end
         else
            begin
            digito2 := 11 - resto;
         end;
         Check := IntToStr(Digito1) + IntToStr(Digito2);

         if Check <> copy(xCNPJ,succ(length(xCNPJ)-2),2) then
            begin
            Result := False;
            end
         else
            begin
            Result := True;
     end;
end;

function Valida_CPF(num_cpf: String): Boolean;

var
   n1,n2,n3,n4,n5,n6,n7,n8,n9: Integer;
   d1,d2,Ind: Integer;
   num, digitado, calculado: String;

begin
     num := '';

     for Ind := 0 to Length(num_cpf) do
         begin
         if (num_cpf[Ind] = '0') or
            (num_cpf[Ind] = '1') or
            (num_cpf[Ind] = '2') or
            (num_cpf[Ind] = '3') or
            (num_cpf[Ind] = '4') or
            (num_cpf[Ind] = '5') or
            (num_cpf[Ind] = '6') or
            (num_cpf[Ind] = '7') or
            (num_cpf[Ind] = '8') or
            (num_cpf[Ind] = '9') then
            begin
            num := num + num_cpf[Ind];
         end;
     end;

     num := trim(num);

     if Length(num) = 1 then
        begin
        num := '0000000000' + num;
        end
     else if Length(num) = 2 then
        begin
        num := '000000000' + num;
        end
     else if Length(num) = 3 then
        begin
        num := '00000000' + num;
        end
     else if Length(num) = 4 then
        begin
        num := '0000000' + num;
        end
     else if Length(num) = 5 then
        begin
        num := '000000' + num;
        end
     else if Length(num) = 6 then
        begin
        num := '00000' + num;
        end
     else if Length(num) = 7 then
        begin
        num := '0000' + num;
        end
     else if Length(num) = 8 then
        begin
        num := '000' + num;
        end
     else if Length(num) = 9 then
        begin
        num := '00' + num;
        end
     else if Length(num) = 10 then
        begin
        num := '0' + num;
     end;

     n1 := StrToInt(num[1]);
     n2 := StrToInt(num[2]);
     n3 := StrToInt(num[3]);
     n4 := StrToInt(num[4]);
     n5 := StrToInt(num[5]);
     n6 := StrToInt(num[6]);
     n7 := StrToInt(num[7]);
     n8 := StrToInt(num[8]);
     n9 := StrToInt(num[9]);
     d1 := n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
     d1 := 11-(d1 mod 11);

     if d1 >= 10 then
        begin
        d1 := 0;
     end;

     d2 := d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
     d2 := 11-(d2 mod 11);

     if d2>=10 then
        begin
        d2 := 0;
     end;

     calculado := inttostr(d1) + inttostr(d2);
     digitado  := num[10] + num[11];

     if calculado = digitado then
        begin
        Valida_CPF := True;
        end
     else
        begin
        Valida_CPF := False;
     end;
end;

Function Texto_Grava(Texto:String):String;
var
   Ind: Integer;
   Resultado: String;

Begin

    Resultado := ' ';

    For Ind := 1 To Length(Texto) Do
      Begin

        If Texto[Ind] = #39 Then
            Begin
            Resultado := Resultado + '´';
            End
        Else
            Begin
            Resultado := Resultado + Texto[Ind];
        End;

    End;

    Result := Trim(Resultado);

End;

function Obtem_Nro_Antes_Traco(Texto: String): String;

var
   Ind: Integer;
   Resultado: String;
   Ativa: Boolean;

begin
     Resultado := ' ';
     Ativa     := True;

     For Ind := 1 To Length(Texto) Do
         Begin
         If Texto[Ind] = '-' Then
            Begin
            Ativa := False;
         End;

         If Ativa = True Then
            Begin
            If Texto[Ind] <> '-' Then
               Begin
               Resultado := Resultado + Texto[Ind];
            End
         End;
     End;

     Result := Trim(Resultado);
end;

function Obtem_Depois_Traco(Texto: String): String;

var
   Ind: Integer;
   Resultado: String;
   Ativa: Boolean;

begin
     Resultado := ' ';
     Ativa     := False;

     For Ind := 1 To Length(Texto) Do
         Begin
         If Texto[Ind] = '-' Then
            Begin
            Ativa := True;
         End;

         If Ativa = True Then
            Begin
            If Texto[Ind] <> '-' Then
               Begin
               Resultado := Resultado + Texto[Ind];
            End
         End;
     End;

     Result := Trim(Resultado);
end;

function Retira_Caracter(Texto, Caracter: String): String;

var
   Ind: Integer;
   Resultado: String;

begin
     Resultado := ' ';

     For Ind := 1 To Length(Texto) Do
         Begin
         If Texto[Ind] <> Caracter Then
            Begin
            Resultado := Resultado + Texto[Ind];
         End;
     End;

     Result := Trim(Resultado);
end;

function Espacos(Qtde: Integer): String;
var
   Resultado: String;
   Ind: Integer;

begin
     For Ind := 1 To Qtde Do
         Begin
         Resultado := Resultado + ' ';
     End;

     Espacos := Resultado;
end;

function Exibe_Nro_Impressao(Numero: String; Tamanho: Integer): String;
var
   Resultado: String;

begin
     If Length(Trim(Numero)) < Tamanho Then
        Begin
        Resultado := Espacos((Tamanho - Length(Trim(Numero)))) + Trim(Numero);
        End
     Else
        Begin
        Resultado := Trim(Numero);
     End;

     Exibe_Nro_Impressao := Resultado;
end;

function Letra_Maiuscula(Texto: String): string;
var
   Ind: Integer;
   Resultado: String;

begin
     Texto     := UpperCase(Texto);
     Texto     := Trim(Texto);
     Resultado := ' ';

     For Ind := 1 To Length(Texto) Do
         Begin
         If Texto[Ind] = 'á' Then
            Begin
            Resultado := Resultado + 'Á';
            End
         Else If Texto[Ind] = 'á' Then
            Begin
            Resultado := Resultado + 'Á';
            End
         Else If Texto[Ind] = 'à' Then
            Begin
            Resultado := Resultado + 'À';
            End
         Else If Texto[Ind] = 'â' Then
            Begin
            Resultado := Resultado + 'Â';
            End
         Else If Texto[Ind] = 'ã' Then
            Begin
            Resultado := Resultado + 'Ã';
            End
         Else If Texto[Ind] = 'ä' Then
            Begin
            Resultado := Resultado + 'Ä';
            End
         Else If Texto[Ind] = 'é' Then
            Begin
            Resultado := Resultado + 'É';
            End
         Else If Texto[Ind] = 'è' Then
            Begin
            Resultado := Resultado + 'È';
            End
         Else If Texto[Ind] = 'ê' Then
            Begin
            Resultado := Resultado + 'Ê';
            End
         Else If Texto[Ind] = 'ë' Then
            Begin
            Resultado := Resultado + 'Ë';
            End
         Else If Texto[Ind] = 'í' Then
            Begin
            Resultado := Resultado + 'Í';
            End
         Else If Texto[Ind] = 'ì' Then
            Begin
            Resultado := Resultado + 'Ì';
            End
         Else If Texto[Ind] = 'î' Then
            Begin
            Resultado := Resultado + 'Î';
            End
         Else If Texto[Ind] = 'ï' Then
            Begin
            Resultado := Resultado + 'Ï';
            End
         Else If Texto[Ind] = 'ó' Then
            Begin
            Resultado := Resultado + 'Ó';
            End
         Else If Texto[Ind] = 'ò' Then
            Begin
            Resultado := Resultado + 'Ò';
            End
         Else If Texto[Ind] = 'õ' Then
            Begin
            Resultado := Resultado + 'Õ';
            End
         Else If Texto[Ind] = 'ô' Then
            Begin
            Resultado := Resultado + 'Ô';
            End
         Else If Texto[Ind] = 'ö' Then
            Begin
            Resultado := Resultado + 'Ö';
            End
         Else If Texto[Ind] = 'ú' Then
            Begin
            Resultado := Resultado + 'Ú';
            End
         Else If Texto[Ind] = 'ù' Then
            Begin
            Resultado := Resultado + 'Ù';
            End
         Else If Texto[Ind] = 'û' Then
            Begin
            Resultado := Resultado + 'Û';
            End
         Else If Texto[Ind] = 'ü' Then
            Begin
            Resultado := Resultado + 'Ü';
            End
         Else If Texto[Ind] = 'ç' Then
            Begin
            Resultado := Resultado + 'Ç';
            End
         Else
            Begin
            Resultado := Resultado + Texto[Ind];
         End;
     End;

     Letra_Maiuscula := Trim(Resultado);
end;

function Obtem_Nro_Tipo_Codigo(Tipo_Codigo: String): Integer;

var
   Ind, Resultado: Integer;
   Relacao_Tipo_Codigo: Array[0..3] of String;

begin
     //Carrega o Array

     Relacao_Tipo_Codigo[0] := 'CNPJ';
     Relacao_Tipo_Codigo[1] := 'CPF';
     Relacao_Tipo_Codigo[2] := 'RG';
     Relacao_Tipo_Codigo[3] := 'E-Mail';

     // Obtem o Número do Tipo do Código no Array

     Resultado := 0;

     For Ind := 0 To 3 Do
         Begin
         If (Relacao_Tipo_Codigo[Ind] = Trim(Tipo_Codigo)) Then
            Begin
            Resultado := Ind;
         End;
     End;

     Result := Resultado;
end;

function Obtem_Nro_Estado(Estado: String): Integer;

var
   Ind, Resultado: Integer;
   Relacao_Estado: Array[0..27] of String;

begin
     //Carrega o Array

     Relacao_Estado[0]  := 'AC';
     Relacao_Estado[1]  := 'AL';
     Relacao_Estado[2]  := 'AP';
     Relacao_Estado[3]  := 'AM';
     Relacao_Estado[4]  := 'BA';
     Relacao_Estado[5]  := 'CE';
     Relacao_Estado[6]  := 'DF';
     Relacao_Estado[7]  := 'ES';
     Relacao_Estado[8]  := 'GO';
     Relacao_Estado[9]  := 'MA';
     Relacao_Estado[10] := 'MT';
     Relacao_Estado[11] := 'MS';
     Relacao_Estado[12] := 'MG';
     Relacao_Estado[13] := 'PA';
     Relacao_Estado[14] := 'PB';
     Relacao_Estado[15] := 'PR';
     Relacao_Estado[16] := 'PE';
     Relacao_Estado[17] := 'PI';
     Relacao_Estado[18] := 'RN';
     Relacao_Estado[19] := 'RS';
     Relacao_Estado[20] := 'RJ';
     Relacao_Estado[21] := 'RO';
     Relacao_Estado[22] := 'RR';
     Relacao_Estado[23] := 'SC';
     Relacao_Estado[24] := 'SP';
     Relacao_Estado[25] := 'SE';
     Relacao_Estado[26] := 'TO';
     Relacao_Estado[27] := '--';

     // Obtem o Número do Estado no Array

     Resultado := 0;

     For Ind := 0 To 27 Do
         Begin
         If (Relacao_Estado[Ind] = Trim(Estado)) Then
            Begin
            Resultado := Ind;
         End;
     End;

     Obtem_Nro_Estado := Resultado;
end;

function Obtem_Nro_Status_Credito(Status_Credito: String): Integer;

var
   Ind, Resultado: Integer;
   Relacao_Status_Credito: Array[0..1] of String;

begin
     //Carrega o Array

     Relacao_Status_Credito[0] := 'N';
     Relacao_Status_Credito[1] := 'S';

     // Obtem o Número do Status do Crédito no Array

     Resultado := 0;

     For Ind := 0 To 1 Do
         Begin
         If (Relacao_Status_Credito[Ind] = Trim(Status_Credito)) Then
            Begin
            Resultado := Ind;
         End;
     End;

     Result := Resultado;
end;

function Obtem_Nro_Tipo_Pessoa(Tipo_Pessoa: String): Integer;

var
   Ind, Resultado: Integer;
   Relacao_Tipo_Pessoa: Array[0..1] of String;

begin
     //Carrega o Array

     Relacao_Tipo_Pessoa[0] := 'PJ';
     Relacao_Tipo_Pessoa[1] := 'PF';

     // Obtem o Número do Tipo de Pessoa no Array

     Resultado := 0;

     For Ind := 0 To 1 Do
         Begin
         If (Relacao_Tipo_Pessoa[Ind] = Trim(Tipo_Pessoa)) Then
            Begin
            Resultado := Ind;
         End;
     End;

     Result := Resultado;
end;

function Obtem_Nro_Pais(Pais: String): Integer;

var
   Ind, Resultado: Integer;
   Relacao_Pais: Array[0..16] of String;

begin
     //Carrega o Array

     Relacao_Pais[0]  := 'Brasil';
     Relacao_Pais[1]  := 'Argentina';
     Relacao_Pais[2]  := 'América Central';
     Relacao_Pais[3]  := 'Bolívia';
     Relacao_Pais[4]  := 'Canadá';
     Relacao_Pais[5]  := 'Chile';
     Relacao_Pais[6]  := 'Colômbia';
     Relacao_Pais[7]  := 'Equador';
     Relacao_Pais[8]  := 'Estados Unidos';
     Relacao_Pais[9]  := 'Paraguai';
     Relacao_Pais[10] := 'Portugal';
     Relacao_Pais[11] := 'Uruguai';
     Relacao_Pais[12] := 'Suiça';
     Relacao_Pais[13] := 'Inglaterra';
     Relacao_Pais[14] := 'Suécia';
     Relacao_Pais[15] := 'Alemanha';
     Relacao_Pais[16] := 'Islândia';

     // Obtem o Número do Pais no Array

     Resultado := 0;

     For Ind := 0 To 16 Do
         Begin
         If (Relacao_Pais[Ind] = Trim(Pais)) Then
            Begin
            Resultado := Ind;
         End;
     End;

     Obtem_Nro_Pais := Resultado;
end;

function Obtem_Nro_Opcao_Cobranca(Opcao_Cobranca: String): Integer;

var
   Ind, Resultado: Integer;
   Relacao_Opcao_Cobranca: Array[0..1] of String;

begin
     //Carrega o Array

     Relacao_Opcao_Cobranca[0] := 'O Mesmo';
     Relacao_Opcao_Cobranca[1] := 'Outro';

     // Obtem o Número da Opcao de Cobranca no Array

     Resultado := 0;

     For Ind := 0 To 1 Do
         Begin
         If (Relacao_Opcao_Cobranca[Ind] = Trim(Opcao_Cobranca)) Then
            Begin
            Resultado := Ind;
         End;
     End;

     Result := Resultado;
end;

function Obtem_Nro_Opcao_Entrega(Opcao_Entrega: String): Integer;

var
   Ind, Resultado: Integer;
   Relacao_Opcao_Entrega: Array[0..1] of String;

begin
     //Carrega o Array

     Relacao_Opcao_Entrega[0] := 'O Mesmo';
     Relacao_Opcao_Entrega[1] := 'Outro';

     // Obtem o Número da Opcao de Cobranca no Array

     Resultado := 0;

     For Ind := 0 To 1 Do
         Begin
         If (Relacao_Opcao_Entrega[Ind] = Trim(Opcao_Entrega)) Then
            Begin
            Resultado := Ind;
         End;
     End;

     Result := Resultado;
end;

// ******************
// *** Procedures ***
// ******************

procedure Seta();
begin
     Screen.Cursor := crDefault; // *** Tira a Ampulheta do Cursor ***
end;

procedure Ampulheta();
begin
     Screen.Cursor := crHourglass; // *** Coloca a Ampúlheta no cursor ***
end;

procedure So_Valor(Sender: TObject; var Key: Char);
begin
     If Not(key in ['0'..'9','.',',',#8,#13]) Then
        Begin
        key := #0;
     End;

     If key in [',','.'] Then
        Begin
        key := DecimalSeparator;
     End;

     If key = DecimalSeparator Then
        Begin
        If pos(key,TEdit(Sender).Text) <> 0 Then
           Begin
           key := #0;
        End;
     End;
end;

procedure So_Numero(Sender: TObject; var Key: Char);
begin
     If Not(key in ['0'..'9',#8,#13]) Then
        Begin
        key := #0;
     End;
end;

procedure So_Numero_Vezes(Sender: TObject; var Key: Char);
begin
     If Not(key in ['0'..'9',#8,#13,'*']) Then
        Begin
        key := #0;
     End;
end;

Procedure Abre_Gaveta();

Var
    Pulso, Tempo, Estado_Gaveta: Integer;

begin
     If UpperCase(Trim(Principal.Edit_Gaveta.Text)) = 'S' Then
        Begin

        Estado_Gaveta := DriverGaveta(GAVETA_COM1, GAVETA_ESTADO);

        If Estado_Gaveta < 0 Then
           Begin
           //*** Inicialização da Gaveta ***

           DriverGaveta(GAVETA_COM1, GAVETA_INICIALIZA);

           Pulso := 150;
           Tempo := 0;

           GavetaConfigura(Pulso, Tempo);
        End;

        DriverGaveta(GAVETA_COM1, GAVETA_ABRE);

     End;
End;

Procedure Inicializa_Gaveta();

Var
    Pulso, Tempo, Estado_Gaveta: Integer;

begin
     If UpperCase(Trim(Principal.Edit_Gaveta.Text)) = 'S' Then
        Begin

        Estado_Gaveta := DriverGaveta(GAVETA_COM1, GAVETA_ESTADO);

        If Estado_Gaveta < 0 Then
           Begin
           //*** Inicialização da Gaveta ***

           DriverGaveta(GAVETA_COM1, GAVETA_INICIALIZA);

           Pulso := 150;
           Tempo := 0;

           GavetaConfigura(Pulso, Tempo);
        End;

     End;
End;

procedure Fecha_Tudo();
Begin
     Ampulheta();

     ConexaoBD.Conexao_Principal.Connected := False;
     ConexaoBD.Conexao_Principal.Close;

     Seta();
End;

procedure Carrega_Grupos(Tela:String);
  Begin

  // Obtem os Grupos
  ConexaoBD.SQL_Grupos.Close;
  ConexaoBD.SQL_Grupos.SQL.Clear;
  ConexaoBD.SQL_Grupos.SQL.Add('Select * From Grupos order by Grupo_Numero');
  ConexaoBD.SQL_Grupos.Open;

  If (Tela='Produtos02') Then
    Begin

     Produtos02.CBGrupo.Items.Clear;

     If Produtos02.EditGrupo_Ant.Text <> '' Then
        Begin
          ConexaoBD.SQL_Comunitario.Close;
          ConexaoBD.SQL_Comunitario.SQL.Clear;
          ConexaoBD.SQL_Comunitario.SQL.Add('Select * From Produtos,Grupos Where (Produto_Grupo = Grupo_Numero)And(Produto_Grupo=' + Trim(Produtos02.EditGrupo_Ant.Text) + ')');
          ConexaoBD.SQL_Comunitario.Open;
          Produtos02.CBGrupo.Items.Add(Trim(ConexaoBD.SQL_Comunitario.FieldValues['Grupo_Numero']) +' - '+ ConexaoBD.SQL_Comunitario.FieldValues['Grupo_Descricao']);
     End;

     Produtos02.CBGrupo.Items.Add('--- Nenhum ---');

     If ConexaoBD.SQL_Grupos.RecordCount > 0 Then
        Begin
        ConexaoBD.SQL_Grupos.First;

        While Not ConexaoBD.SQL_Grupos.EOF Do
              Begin
              Produtos02.CBGrupo.Items.Add(ConexaoBD.SQL_GruposGrupo_Numero.Text + ' - ' + ConexaoBD.SQL_GruposGrupo_Descricao.Text);
              ConexaoBD.SQL_Grupos.Next;
        End;
     End;
     Produtos02.CBGrupo.ItemIndex := 0;

    End
  Else If (Tela='RelEstoqueMinimo00') Then
    Begin

     RelEstoqueMinimo00.CBGrupo.Items.Clear;
     RelEstoqueMinimo00.CBGrupo.Items.Add('--- Todos ---');

     If ConexaoBD.SQL_Grupos.RecordCount > 0 Then
        Begin
        ConexaoBD.SQL_Grupos.First;

        While Not ConexaoBD.SQL_Grupos.EOF Do
              Begin
              RelEstoqueMinimo00.CBGrupo.Items.Add(ConexaoBD.SQL_GruposGrupo_Numero.Text + ' - ' + ConexaoBD.SQL_GruposGrupo_Descricao.Text);
              ConexaoBD.SQL_Grupos.Next;
        End;
     End;
     RelEstoqueMinimo00.CBGrupo.ItemIndex := 0;

    End
  Else
    Begin

     Produtos01.CBGrupo.Items.Clear;
     Produtos01.CBGrupo.Items.Add('--- Nenhum ---');

     If ConexaoBD.SQL_Grupos.RecordCount > 0 Then
        Begin
        ConexaoBD.SQL_Grupos.First;

        While Not ConexaoBD.SQL_Grupos.EOF Do
              Begin
              Produtos01.CBGrupo.Items.Add(ConexaoBD.SQL_GruposGrupo_Numero.Text + ' - ' + ConexaoBD.SQL_GruposGrupo_Descricao.Text);
              ConexaoBD.SQL_Grupos.Next;
        End;
     End;
     Produtos01.CBGrupo.ItemIndex := 0;
  End;

End;

procedure Carrega_Fornecedores(Tela:String);
  Begin

  // Obtem os Fornecedores
  ConexaoBD.SQL_Fornecedores.Close;
  ConexaoBD.SQL_Fornecedores.SQL.Clear;
  ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores order by Fornecedor_Numero');
  ConexaoBD.SQL_Fornecedores.Open;

  If (Tela='Produtos02') Then
    Begin

     Produtos02.CBFornecedor.Items.Clear;

     If (Produtos02.EditFor_Cod_Ant.Text <> '')And(Produtos02.EditFor_Desc_Ant.Text <> '') Then
        Begin
          Produtos02.CBFornecedor.Items.Add(Produtos02.EditFor_Cod_Ant.Text +' - '+ Produtos02.EditFor_Desc_Ant.Text);
     End;

     Produtos02.CBFornecedor.Items.Add('--- Nenhum ---');

     If ConexaoBD.SQL_Fornecedores.RecordCount > 0 Then
        Begin
        ConexaoBD.SQL_Fornecedores.First;

        While Not ConexaoBD.SQL_Fornecedores.EOF Do
              Begin
              Produtos02.CBFornecedor.Items.Add(ConexaoBD.SQL_FornecedoresFornecedor_Numero.Text + ' - ' + ConexaoBD.SQL_FornecedoresFornecedor_Razao_Social.Text);
              ConexaoBD.SQL_Fornecedores.Next;
        End;
     End;
     Produtos02.CBFornecedor.ItemIndex := 0;

    End
  Else If (Tela='RelEstoqueMinimo00') Then
    Begin

     RelEstoqueMinimo00.CBFornecedor.Items.Clear;
     RelEstoqueMinimo00.CBFornecedor.Items.Add('--- Todos ---');

     If ConexaoBD.SQL_Fornecedores.RecordCount > 0 Then
        Begin
        ConexaoBD.SQL_Fornecedores.First;

        While Not ConexaoBD.SQL_Fornecedores.EOF Do
              Begin
              RelEstoqueMinimo00.CBFornecedor.Items.Add(ConexaoBD.SQL_FornecedoresFornecedor_Numero.Text + ' - ' + ConexaoBD.SQL_FornecedoresFornecedor_Razao_Social.Text);
              ConexaoBD.SQL_Fornecedores.Next;
        End;
     End;
     RelEstoqueMinimo00.CBFornecedor.ItemIndex := 0;

    End
  Else If (Tela='EntradaProdutosNF00') Then
    Begin
     EntradaProdutosNF00.CBFornecedor.Items.Clear;
     EntradaProdutosNF00.CBFornecedor.Items.Add('--- Nenhum ---');

     If ConexaoBD.SQL_Fornecedores.RecordCount > 0 Then
        Begin
        ConexaoBD.SQL_Fornecedores.First;

        While Not ConexaoBD.SQL_Fornecedores.EOF Do
              Begin
              EntradaProdutosNF00.CBFornecedor.Items.Add(ConexaoBD.SQL_FornecedoresFornecedor_Numero.Text + ' - ' + ConexaoBD.SQL_FornecedoresFornecedor_Razao_Social.Text);
              ConexaoBD.SQL_Fornecedores.Next;
        End;
     End;
     EntradaProdutosNF00.CBFornecedor.ItemIndex := 0;
     End
  Else
    Begin

     Produtos01.CBFornecedor.Items.Clear;
     Produtos01.CBFornecedor.Items.Add('--- Nenhum ---');

     If ConexaoBD.SQL_Fornecedores.RecordCount > 0 Then
        Begin
        ConexaoBD.SQL_Fornecedores.First;

        While Not ConexaoBD.SQL_Fornecedores.EOF Do
              Begin
              Produtos01.CBFornecedor.Items.Add(ConexaoBD.SQL_FornecedoresFornecedor_Numero.Text + ' - ' + ConexaoBD.SQL_FornecedoresFornecedor_Razao_Social.Text);
              ConexaoBD.SQL_Fornecedores.Next;
        End;
     End;
     Produtos01.CBFornecedor.ItemIndex := 0;
  End;
End;

procedure Procura_Grupos(Tela, Codigo:String);
var i, posicao: integer;
Begin
  if Trim(Codigo) <> '' Then
    begin
    posicao:=0;
    If (Tela='Produtos02') Then
      Begin
      Produtos02.CBGrupo.ItemIndex := 0;
      For i :=0 To Produtos02.CBGrupo.Items.Count Do
        Begin
        Produtos02.CBGrupo.ItemIndex := i;
        If (Obtem_Nro_Antes_Traco(Produtos02.CBGrupo.Text) = Codigo) and (Obtem_Nro_Antes_Traco(Produtos02.CBGrupo.Text) <> '') Then posicao := i;
      End;
      Produtos02.CBGrupo.ItemIndex := posicao;
      End
    Else
      Begin
      Produtos01.CBGrupo.ItemIndex := 0;
      For i :=0 To Produtos01.CBGrupo.Items.Count Do
        Begin
        Produtos01.CBGrupo.ItemIndex := i;
        If (Obtem_Nro_Antes_Traco(Produtos01.CBGrupo.Text) = Codigo) and (Obtem_Nro_Antes_Traco(Produtos01.CBGrupo.Text) <> '') Then posicao := i;
      End;
      Produtos01.CBGrupo.ItemIndex := posicao;
    End;
    If posicao = 0 Then MSG_Erro('Código Não Encontrado...');
  End;
End;

procedure Procura_Fornecedores(Tela, Codigo:String);
var i, posicao: integer;
Begin
  if Trim(Codigo) <> '' Then
    begin
    posicao:=0;
    If (Tela='Produtos02') Then
      Begin
      Produtos02.CBFornecedor.ItemIndex := 0;
      For i :=0 To Produtos02.CBFornecedor.Items.Count Do
        Begin
        Produtos02.CBFornecedor.ItemIndex := i;
        If (Obtem_Nro_Antes_Traco(Produtos02.CBFornecedor.Text) = Codigo) Then posicao := i;
      End;
      Produtos02.CBFornecedor.ItemIndex := posicao;
      End
    Else If (Tela='EntradaProdutosNF00') Then
      Begin
      EntradaProdutosNF00.CBFornecedor.ItemIndex := 0;
      For i :=0 To EntradaProdutosNF00.CBFornecedor.Items.Count Do
        Begin
        EntradaProdutosNF00.CBFornecedor.ItemIndex := i;
        If (Obtem_Nro_Antes_Traco(EntradaProdutosNF00.CBFornecedor.Text) = Codigo) Then posicao := i;
      End;
      EntradaProdutosNF00.CBFornecedor.ItemIndex := posicao;
      End
    Else
      Begin
      Produtos01.CBFornecedor.ItemIndex := 0;
      For i :=0 To Produtos01.CBFornecedor.Items.Count Do
        Begin
        Produtos01.CBFornecedor.ItemIndex := i;
        If (Obtem_Nro_Antes_Traco(Produtos01.CBFornecedor.Text) = Codigo) Then posicao := i;
      End;
      Produtos01.CBFornecedor.ItemIndex := posicao;
    End;
    If posicao = 0 Then MSG_Erro('Código Não Encontrado...');
  End;
End;

Procedure Prepara_Tela();

Var
  Ind : Integer;
  Barra_Progresso, Erro: Integer;
  Comando_SQL, Vlr_Exibicao: String;
  Vlr_Venda, Vlr_Progresso, Vlr_Sangria: Real;

Begin

    Ampulheta();

    If (SplashScreen <> Nil) Then
       Begin
       SplashScreen.LBL_Registro.Caption := 'Ativando Tela...';
       SplashScreen.Refresh;
    End;

    Frente_Loja00.Panel_Principal.Enabled       := True;

    Frente_Loja00.EditCod_Barras.Enabled        := True;
    Frente_Loja00.Lista_Itens.Enabled           := True;

    Frente_Loja00.Vezes_Teclado.Text            := 'N';
    Frente_Loja00.EditCod_Barras.Text           := '';
    Frente_Loja00.EditDescricao.Caption         := '';
    Frente_Loja00.EditCodCliente.Text           := '';
    Frente_Loja00.EditNomeCliente.Text          := '';
    Frente_Loja00.EditDesconto.Text             := '0';

    Frente_Loja00.Total_Qtd_Compra.Caption      := '0';
    Frente_Loja00.Total_Vlr_Compra.Caption      := '0.00';

    For Ind := 0 To Frente_Loja00.Lista_Itens.RowCount Do
      Begin
        Frente_Loja00.Lista_Itens.Cells[0,Ind]:= '';
        Frente_Loja00.Lista_Itens.Cells[1,Ind]:= '';
        Frente_Loja00.Lista_Itens.Cells[2,Ind]:= '';
        Frente_Loja00.Lista_Itens.Cells[3,Ind]:= '';
        Frente_Loja00.Lista_Itens.Cells[4,Ind]:= '';
        Frente_Loja00.Lista_Itens.Cells[5,Ind]:= '';
        Frente_Loja00.Lista_Itens.Cells[6,Ind]:= '';
    End;

    Frente_Loja00.EditNro_Linha.Text            := '0';
    Frente_Loja00.EditFoco_Linha.Text           := '1';

    //*** Preparação dos Títulos da Lista de Compras para os Dois Tamanhos de Tela ***

    If Screen.Width <= 640 Then
       Begin
       //*** Código do Produto ***
       Frente_Loja00.Lista_Itens.Cells[0,0]        := 'Código';
       Frente_Loja00.Lista_Itens.ColWidths[0]      := 70;

       //*** Descrição do Produto ***
       Frente_Loja00.Lista_Itens.Cells[1,0]        := 'Descrição';
       Frente_Loja00.Lista_Itens.ColWidths[1]      := 240;

       //*** Quantidade ***
       Frente_Loja00.Lista_Itens.Cells[2,0]        := 'Qtde';
       Frente_Loja00.Lista_Itens.ColWidths[2]      := 60;

       //*** Valor Unitário ***
       Frente_Loja00.Lista_Itens.Cells[3,0]        := 'Vlr.Unitário';
       Frente_Loja00.Lista_Itens.ColWidths[3]      := 95;

       //*** Valor Total ***
       Frente_Loja00.Lista_Itens.Cells[4,0]        := 'Vlr.Total';
       Frente_Loja00.Lista_Itens.ColWidths[4]      := 90;

       //*** Descrição Completa ***
       Frente_Loja00.Lista_Itens.Cells[5,0]        := '';
       Frente_Loja00.Lista_Itens.ColWidths[5]      := -1;

       //*** Estoque Atual ***
       Frente_Loja00.Lista_Itens.Cells[6,0]        := 'Estoque';
       Frente_Loja00.Lista_Itens.ColWidths[6]      := 75;

       Frente_Loja00.Lista_Itens.RowCount          := 2;
       Frente_Loja00.Lista_Itens.FixedRows         := 1;
       End
    Else
       Begin
       //*** Código do Produto ***
       Frente_Loja00.Lista_Itens.Cells[0,0]        := 'Código';
       Frente_Loja00.Lista_Itens.ColWidths[0]      := 70;

       //*** Descrição do Produto ***
       Frente_Loja00.Lista_Itens.Cells[1,0]        := 'Descrição';
       Frente_Loja00.Lista_Itens.ColWidths[1]      := 314;

       //*** Quantidade ***
       Frente_Loja00.Lista_Itens.Cells[2,0]        := 'Qtde';
       Frente_Loja00.Lista_Itens.ColWidths[2]      := 60;

       //*** Valor Unitário ***
       Frente_Loja00.Lista_Itens.Cells[3,0]        := 'Vlr.Unitário';
       Frente_Loja00.Lista_Itens.ColWidths[3]      := 95;

       //*** Valor Total ***
       Frente_Loja00.Lista_Itens.Cells[4,0]        := 'Vlr.Total';
       Frente_Loja00.Lista_Itens.ColWidths[4]      := 90;

       //*** Descrição Completa ***
       Frente_Loja00.Lista_Itens.Cells[5,0]        := '';
       Frente_Loja00.Lista_Itens.ColWidths[5]      := -1;

       //*** Estoque Atual ***
       Frente_Loja00.Lista_Itens.Cells[6,0]        := 'Estoque';
       Frente_Loja00.Lista_Itens.ColWidths[6]      := 75;

       Frente_Loja00.Lista_Itens.RowCount          := 2;
       Frente_Loja00.Lista_Itens.FixedRows         := 1;
    End;

    //*** Início - Venda Diária ***

    ConexaoBD.SQL_Comunitario.Close;
    ConexaoBD.SQL_Comunitario.SQL.Clear;
    ConexaoBD.SQL_Comunitario.SQL.Add('Select * From Valor_Venda_Diaria');
    ConexaoBD.SQL_Comunitario.Open;

    If ConexaoBD.SQL_Comunitario.RecordCount > 0 Then
       Begin
       Vlr_Exibicao := ConexaoBD.SQL_Comunitario.FieldValues['Valor_Venda_Diaria_Vlr'];
       Principal.T_Valor_Venda_Diaria.Text := Ponto_Virgula(Vlr_Exibicao);
       End
    Else
       Begin
       Principal.T_Valor_Venda_Diaria.Text := '0';
    End;

    //*** Final - Venda Diária ***

    If Trim(Principal.Caixa_Aberto.Text) = 'N' Then
       Begin

       SplashScreen.LBL_Registro.Caption := 'Verificando Caixa...';
       SplashScreen.Refresh;

       ConexaoBD.SQL_Fechamento_Caixa.Close;
       ConexaoBD.SQL_Fechamento_Caixa.SQL.Clear;
       ConexaoBD.SQL_Fechamento_Caixa.SQL.Add('Select * From Fechamentos_Caixas where Fechamento_Caixa_Maquina = '+#39+ Trim(Numero_HD('C')) +#39 );
       ConexaoBD.SQL_Fechamento_Caixa.Open;

       If ConexaoBD.SQL_Fechamento_Caixa.RecordCount > 0 Then
          Begin

          //*** Barra de Progresso ***

          //Vlr_Exibicao := Ponto_Virgula(Trim(ConexaoBD.SQL_Fechamento_Caixafechamento_caixa_vlr_venda_diaria.Text));
          Vlr_Exibicao := Ponto_Virgula(Trim(Principal.T_Valor_Venda_Diaria.Text));
          Val(Vlr_Exibicao,Vlr_Venda,Erro);
          Vlr_Progresso := Int(Vlr_Venda);

          Vlr_Exibicao := Ponto_Virgula(Trim(ConexaoBD.SQL_Fechamento_Caixafechamento_caixa_vlr_vendas.Text));
          Val(Vlr_Exibicao,Vlr_Venda,Erro);
          Vlr_Venda := Int(Vlr_Venda);

          Vlr_Exibicao := Ponto_Virgula(Trim(ConexaoBD.SQL_Fechamento_Caixafechamento_caixa_vlr_sangria.Text));
          Val(Vlr_Exibicao,Vlr_Sangria,Erro);
          Vlr_Sangria := Int(Vlr_Sangria);

          //Vlr_Exibicao := FloatToStr(Int((((Vlr_Venda - Vlr_Sangria) / Vlr_Progresso) * 100)));
          Vlr_Exibicao := FloatToStr(Int(((Vlr_Venda / Vlr_Progresso) * 100)));

          if (StrToFloat(Vlr_Exibicao) < 0) Then Vlr_Exibicao := '0';

          Principal.T_Valor_Venda_Diaria.Text := Ponto_Virgula(Trim(ConexaoBD.SQL_Fechamento_Caixafechamento_caixa_vlr_venda_diaria.Text));
          Principal.T_Valor_Venda.Text        := Ponto_Virgula(Trim(ConexaoBD.SQL_Fechamento_Caixafechamento_caixa_vlr_vendas.Text));
          Principal.T_Valor_Sangria.Text      := Ponto_Virgula(Trim(ConexaoBD.SQL_Fechamento_Caixafechamento_caixa_vlr_sangria.Text));

          End
       Else
          Begin

          SplashScreen.LBL_Registro.Caption := 'Obtendo Venda Diária...';
          SplashScreen.Refresh;

          //*** Barra de Progresso ***

          ConexaoBD.SQL_Comunitario.Close;
          ConexaoBD.SQL_Comunitario.SQL.Clear;
          ConexaoBD.SQL_Comunitario.SQL.Add('Select * From Valor_Venda_Diaria');
          ConexaoBD.SQL_Comunitario.Open;

          If ConexaoBD.SQL_Comunitario.RecordCount > 0 Then
             Begin
             Vlr_Exibicao := ConexaoBD.SQL_Comunitario.FieldValues['Valor_Venda_Diaria_Vlr'];

             Principal.T_Valor_Venda_Diaria.Text := Ponto_Virgula(Vlr_Exibicao);

             Val(Vlr_Exibicao,Vlr_Venda,Erro);
             Vlr_Progresso := Int(Vlr_Venda);
             End
          Else
             Begin
             Principal.T_Valor_Venda_Diaria.Text := '0';
             
             Vlr_Progresso := 1;
          End;

          Caixa_Data    := Inverte_Data_Plus(DateToStr(Date),'amd','-');
          Caixa_Maquina := Numero_HD('C');

          SplashScreen.LBL_Registro.Caption := 'Somando Valor de Venda...';
          SplashScreen.Refresh;

          Comando_SQL  := 'Select SUM(Registro_Caixa_Valor) As Registro_Total from Registro_Caixa ';
          Comando_SQL  := Comando_SQL + 'Where ';
          Comando_SQL  := Comando_SQL + '(Registro_Caixa_Data='+#39 + Caixa_Data    +#39+ ') And ';
          Comando_SQL  := Comando_SQL + '(Registro_Caixa_Maquina="' + Caixa_Maquina + '") And ';
          Comando_SQL  := Comando_SQL + '(Registro_Caixa_Operacao="Venda")';

          ConexaoBD.SQL_Comunitario_Secundario.Close;
          ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
          ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
          ConexaoBD.SQL_Comunitario_Secundario.Open;

          If ConexaoBD.SQL_Comunitario_Secundario.RecordCount > 0 Then
             Begin

             ConexaoBD.SQL_Comunitario_Secundario.First;

             If ConexaoBD.SQL_Comunitario_Secundario.FieldValues['Registro_Total'] <> Null Then
                Begin
                Vlr_Exibicao := ConexaoBD.SQL_Comunitario_Secundario.FieldValues['Registro_Total'];
                End
             Else
                Begin
                Vlr_Exibicao := '0';
             End;

             Principal.T_Valor_Venda.Text := Ponto_Virgula(Vlr_Exibicao);

             Val(Vlr_Exibicao,Vlr_Venda,Erro);
             Vlr_Venda := Int(Vlr_Venda);
             End
          Else
             Begin
             Principal.T_Valor_Venda.Text := '0';

             Vlr_Venda := 0;
          End;

          SplashScreen.LBL_Registro.Caption := 'Somando Sangrias...';
          SplashScreen.Refresh;

          Comando_SQL  := 'Select SUM(Registro_Caixa_Valor) As Registro_Total from Registro_Caixa ';
          Comando_SQL  := Comando_SQL + 'Where ';
          Comando_SQL  := Comando_SQL + '(Registro_Caixa_Data='+#39 + Caixa_Data    +#39+ ') And ';
          Comando_SQL  := Comando_SQL + '(Registro_Caixa_Maquina="' + Caixa_Maquina + '") And ';
          Comando_SQL  := Comando_SQL + '(Registro_Caixa_Operacao="Sangria - Retirada")';

          ConexaoBD.SQL_Comunitario_Secundario.Close;
          ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
          ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
          ConexaoBD.SQL_Comunitario_Secundario.Open;

          If ConexaoBD.SQL_Comunitario_Secundario.RecordCount > 0 Then
             Begin

             ConexaoBD.SQL_Comunitario_Secundario.First;

             If ConexaoBD.SQL_Comunitario_Secundario.FieldValues['Registro_Total'] <> Null Then
                Begin
                Vlr_Exibicao := ConexaoBD.SQL_Comunitario_Secundario.FieldValues['Registro_Total'];
                End
             Else
                Begin
                Vlr_Exibicao := '0';
             End;

             Principal.T_Valor_Sangria.Text := Ponto_Virgula(Vlr_Exibicao);

             Val(Vlr_Exibicao,Vlr_Sangria,Erro);
             Vlr_Sangria := Int(Vlr_Sangria);
             End
          Else
             Begin
             Vlr_Sangria := 0;
          End;

          //Vlr_Exibicao := FloatToStr(Int((((Vlr_Venda - Vlr_Sangria) / Vlr_Progresso) * 100)));
          Vlr_Exibicao := FloatToStr(Int(((Vlr_Venda / Vlr_Progresso) * 100)));

          if (StrToFloat(Vlr_Exibicao) < 0) Then Vlr_Exibicao := '0';

          //*** Registro das Vendas ***

          Registro_Vendas(Trim(Numero_HD('C')), Trim(Principal.T_Valor_Venda.Text), Trim(Principal.T_Valor_Sangria.Text), Trim(Principal.T_Valor_Venda_Diaria.Text));
       End;

       End
    Else
       Begin

       //*** Barra de Progresso ***

       Vlr_Exibicao := Ponto_Virgula(Trim(Principal.T_Valor_Venda_Diaria.Text));
       Val(Vlr_Exibicao,Vlr_Venda,Erro);
       Vlr_Progresso := Int(Vlr_Venda);

       Vlr_Exibicao := Ponto_Virgula(Trim(Principal.T_Valor_Venda.Text));
       Val(Vlr_Exibicao,Vlr_Venda,Erro);
       Vlr_Venda := Int(Vlr_Venda);

       Vlr_Exibicao := Ponto_Virgula(Trim(Principal.T_Valor_Sangria.Text));
       Val(Vlr_Exibicao,Vlr_Sangria,Erro);
       Vlr_Sangria := Int(Vlr_Sangria);

       //Vlr_Exibicao := FloatToStr(Int((((Vlr_Venda - Vlr_Sangria) / Vlr_Progresso) * 100)));
       Vlr_Exibicao := FloatToStr(Int(((Vlr_Venda / Vlr_Progresso) * 100)));

       if (StrToFloat(Vlr_Exibicao) < 0) Then Vlr_Exibicao := '0';
    End;

    Principal.Caixa_Aberto.Text := 'S';

    Barra_Progresso := StrToInt(Vlr_Exibicao);

    Frente_Loja00.Porcentagem_Venda_Total.Progress := Barra_Progresso;
    Frente_Loja00.Porcentagem_Venda_Total.Refresh;
    Frente_Loja00.Refresh;

    Frente_Loja00.Vezes_Teclado.Text := 'N';

    If Frente_Loja00.EditVinculoCliente.Checked Then
       Begin
       Frente_Loja00.EditCodCliente.SetFocus;
       End
    Else
       Begin
       Frente_Loja00.EditCod_Barras.SetFocus;
    End;

  Seta();

End;

Procedure Prepara_Caixa();
Var
  ComandoSQL: String;
Begin
      SplashScreen.LBL_Registro.Caption := 'Preparando Dados do Caixa...';
      SplashScreen.Refresh;

      ComandoSQL  := 'Select * from Registro_Caixa ';
      ComandoSQL  := ComandoSQL + 'Where ';
      ComandoSQL  := ComandoSQL + '(Registro_Caixa_Data='+#39 + Inverte_Data_Plus(DateToStr(Date()),'amd','-') +#39+ ') And ';
      ComandoSQL  := ComandoSQL + '(Registro_Caixa_Maquina="' + Numero_HD('C') + '") And ';
      ComandoSQL  := ComandoSQL + '(Registro_Caixa_Operacao="Abertura" Or Registro_Caixa_Operacao="Fechamento") ';
      ComandoSQL  := ComandoSQL + 'Order By Registro_Caixa_Hora DESC';

      ConexaoBD.SQL_Registro_Caixa.Close;
      ConexaoBD.SQL_Registro_Caixa.SQL.Clear;
      ConexaoBD.SQL_Registro_Caixa.SQL.Add(ComandoSQL);
      ConexaoBD.SQL_Registro_Caixa.Open;

      Frente_Loja00.EditPermissao_Acesso.Text     := 'N';
      Frente_Loja00.EditPermissao_Fechamento.Text := 'N';

      If Not ConexaoBD.SQL_Registro_Caixa.Eof Then
        Begin
          ConexaoBD.SQL_Registro_Caixa.First;
          If (ConexaoBD.SQL_Registro_CaixaRegistro_Caixa_Operacao.Text)='Fechamento' Then
            Begin
              // Abrir Tela de Abertura
              Application.CreateForm(TCaixa_Abertura00,Caixa_Abertura00);
              Caixa_Abertura00.ShowModal;
              Caixa_Abertura00.Destroy;
            End
          Else
            Begin
              // Dar Continuidade ao Caixa Tela de Abertura
              Frente_Loja00.EditPermissao_Acesso.Text := 'S';
          End;
        End
      Else
        Begin
              // Abrir Tela de Abertura
              Application.CreateForm(TCaixa_Abertura00,Caixa_Abertura00);
              Caixa_Abertura00.ShowModal;
              Caixa_Abertura00.Destroy;
      End;

      SplashScreen.Refresh;
End;


procedure Movto_Lista(Codigo,Tipo,Operacao:String;Qtde:Integer);
Var
   Ind          :Integer;
   Linha, Erro  :Integer;
   Vlr_Numero   : Real;
   Vlr_Exibicao : String;

   Str_Codigo   : String;
   Str_Descricao: String;
   Str_Descr_Completa: String;
   Str_Qtde     : String;
   Str_Vlr_Unit : String;
   Str_Vlr_Total: String;
   Str_Estoque  : String;
   Encontrou_Codigo: Boolean;

   Qtde_Posicao : Integer;
   Vezes_Teclado: Boolean;

Begin

    Ampulheta();

{      If Tipo = 'Código_Barras' Then
        Begin
          //*** Busca pelo Código de Barras ***
          ConexaoBD.SQL_Produtos.Close;
          ConexaoBD.SQL_Produtos.SQL.Clear;
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Cod_Barra = "' + Trim(Codigo) + '"');
          ConexaoBD.SQL_Produtos.Open;
        End
      Else If Tipo = 'Código' Then
        Begin
          //*** Busca pelo Código do Produto ***
          ConexaoBD.SQL_Produtos.Close;
          ConexaoBD.SQL_Produtos.SQL.Clear;
          ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Codigo = ' + Trim(Codigo));
          ConexaoBD.SQL_Produtos.Open;
        End; }

      //*** Procura pelo Código de Barras e Código do Produto, Nesta devida ordem ***

      //*** Busca pelo Código de Barras ***

      Qtde_Posicao  := 0;
      Vezes_Teclado := False;

      For Ind := 1 To Length(Trim(Codigo)) Do
          Begin
          If Codigo[Ind] = '*' Then
             Begin
             Qtde_Posicao  := Qtde_Posicao + 1;
             Qtde          := StrToInt(Copy(Codigo,1,(Qtde_Posicao - 1)));
             Vezes_Teclado := True;
             Break;
          End;

          Qtde_Posicao := Qtde_Posicao + 1;
      End;

      If Vezes_Teclado Then
         Begin
         Codigo := Copy(Codigo,(Qtde_Posicao + 1),(Length(Trim(Codigo)) - (Qtde_Posicao)));
      End;

      Encontrou_Codigo := False;

      ConexaoBD.SQL_Produtos.Close;
      ConexaoBD.SQL_Produtos.SQL.Clear;
      ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Cod_Barra = "' + Trim(Codigo) + '"');
      ConexaoBD.SQL_Produtos.Open;

      If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
         Begin
         Encontrou_Codigo := True;
      End;

      //*** Busca pelo Código do Produto ***
      {
      If Not Encontrou_Codigo Then
         Begin
         ConexaoBD.SQL_Produtos.Close;
         ConexaoBD.SQL_Produtos.SQL.Clear;
         ConexaoBD.SQL_Produtos.SQL.Add('Select * from Produtos Where Produto_Codigo = ' + Trim(Codigo));
         ConexaoBD.SQL_Produtos.Open;

         If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
            Begin
            Encontrou_Codigo := True;
         End;
      End;
      }
      If Encontrou_Codigo Then
        Begin

          Str_Codigo    := '';
          Str_Descricao := '';
          Str_Descr_Completa  :='';
          Str_Qtde      := '';
          Str_Vlr_Unit  := '';
          Str_Vlr_Total := '';
          Str_Estoque   := '';
          Linha := 0;

          If Operacao = '+' Then
            Begin

              Str_Codigo    := Trim(ConexaoBD.SQL_ProdutosProduto_Codigo.Text);
              Str_Descricao := Trim(ConexaoBD.SQL_ProdutosProduto_Descricao_Curta.Text);
              Str_Descr_Completa  := Trim(ConexaoBD.SQL_ProdutosProduto_Descricao.Text);
              Str_Estoque   := Trim(ConexaoBD.SQL_ProdutosProduto_Estoque_Atual.Text);

              For Ind := 1 To (Frente_Loja00.Lista_Itens.RowCount-1) Do
                Begin
                If (Frente_Loja00.Lista_Itens.Cells[0,Ind]=Trim(ConexaoBD.SQL_ProdutosProduto_Codigo.Text)) Then
                  Begin
                  Str_Qtde      := IntToStr(  StrToInt(Frente_Loja00.Lista_Itens.Cells[2,Ind]) + Qtde );
                  Linha := Ind;
                End;
              End;

              If Linha = 0 Then
                Begin
                  Str_Qtde      := IntToStr(Qtde);
                  Frente_Loja00.EditNro_Linha.Text := InttoStr(StrToInt(Frente_Loja00.EditNro_Linha.Text) + 1);
                  Frente_Loja00.Lista_Itens.RowCount:= Frente_Loja00.Lista_Itens.RowCount + 1;
                  Linha := StrToInt(Frente_Loja00.EditNro_Linha.Text);
              End;

              If StrToInt(Str_Qtde)<= 0 Then
                Begin
                  Str_Qtde    := '1';
              End;

              Str_Vlr_Unit  := Trim(ConexaoBD.SQL_ProdutosProduto_Preco_Varejo.Text);

              If StrToFloat(Frente_Loja00.EditDesconto.Text) > 0 Then
                 Begin
                 Str((StrToFloat(ConexaoBD.SQL_ProdutosProduto_Preco_Varejo.Text) - ((StrToFloat(ConexaoBD.SQL_ProdutosProduto_Preco_Varejo.Text) * StrToFloat(Frente_Loja00.EditDesconto.Text)) / 100)):13:2,Str_Vlr_Unit);
                 Str_Vlr_Unit := Ponto_Virgula(Trim(Str_Vlr_Unit));
              End;

              Vlr_Exibicao := Trim(Virgula_Ponto( FloatToStr(StrToFloat(Str_Vlr_Unit) * StrToInt(Str_Qtde))));
              Val(Vlr_Exibicao,Vlr_Numero,Erro);
              Str(Vlr_Numero:13:2,Vlr_Exibicao);
              Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));
              Str_Vlr_Total := Vlr_Exibicao;

              //Direciona o Foco das Teclas de Atalho para este item
              Frente_Loja00.EditFoco_Linha.Text:= IntToStr(Linha);

              //Mostra a Descrição do Produto Selecionado
              Frente_Loja00.EditDescricao.Caption := ConexaoBD.SQL_ProdutosProduto_Descricao.Text;

            End
          Else If Operacao = '-' Then
            Begin

              For Ind := 1 To (Frente_Loja00.Lista_Itens.RowCount-1) Do
                Begin

                  If (Frente_Loja00.Lista_Itens.Cells[0,Ind]=Trim(ConexaoBD.SQL_ProdutosProduto_Codigo.Text)) Then
                    Begin
                      Str_Codigo    := Frente_Loja00.Lista_Itens.Cells[0,Ind];
                      Str_Descricao := Frente_Loja00.Lista_Itens.Cells[1,Ind];
                      Str_Descr_Completa  := Frente_Loja00.Lista_Itens.Cells[5,Ind];
                      Str_Qtde      := IntToStr(  StrToInt(Frente_Loja00.Lista_Itens.Cells[2,Ind]) - Qtde );
                      Str_Estoque   := Frente_Loja00.Lista_Itens.Cells[6,Ind];

                      If StrToInt(Str_Qtde)<= 0 Then
                        Begin
                        Str_Qtde    := '1';
                      End;

                      Str_Vlr_Unit  := Frente_Loja00.Lista_Itens.Cells[3,Ind];
                          Vlr_Exibicao := Trim(Virgula_Ponto( FloatToStr(StrToFloat(Str_Vlr_Unit) * StrToInt(Str_Qtde))));
                          Val(Vlr_Exibicao,Vlr_Numero,Erro);
                          Str(Vlr_Numero:13:2,Vlr_Exibicao);
                          Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));
                      Str_Vlr_Total := Vlr_Exibicao;
                      Linha := Ind;
                  End;

              End;

           { End
          Else If Operacao = 'x' Then
            Begin

              For Ind := 1 To (Frente_Loja00.Lista_Itens.RowCount-1) Do
                Begin

                  If (Frente_Loja00.Lista_Itens.Cells[0,Ind]=Trim(ConexaoBD.SQL_ProdutosProduto_Codigo.Text)) Then
                    Begin
                      Str_Codigo    := Frente_Loja00.Lista_Itens.Cells[0,Ind];
                      Str_Descricao := Frente_Loja00.Lista_Itens.Cells[1,Ind];
                      Str_Descr_Completa  := Frente_Loja00.Lista_Itens.Cells[5,Ind];
                      Str_Qtde      := IntToStr(  StrToInt(Frente_Loja00.Lista_Itens.Cells[2,Ind]) * Qtde );

                      If StrToInt(Str_Qtde)<= 0 Then
                        Begin
                        Str_Qtde    := '1';
                      End;

                      Str_Vlr_Unit  := Frente_Loja00.Lista_Itens.Cells[3,Ind];
                          Vlr_Exibicao := Trim(Virgula_Ponto( FloatToStr(StrToFloat(Str_Vlr_Unit) * StrToInt(Str_Qtde))));
                          Val(Vlr_Exibicao,Vlr_Numero,Erro);
                          Str(Vlr_Numero:13:2,Vlr_Exibicao);
                          Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));
                      Str_Vlr_Total := Vlr_Exibicao;
                      Linha := Ind;
                  End;

              End; }

          End;

          Frente_Loja00.Lista_Itens.Cells[0,Linha] := Str_Codigo;
          Frente_Loja00.Lista_Itens.Cells[1,Linha] := Str_Descricao;
          Frente_Loja00.Lista_Itens.Cells[2,Linha] := Str_Qtde;

                Vlr_Exibicao := Trim(Virgula_Ponto(Str_Vlr_Unit));
                Val(Vlr_Exibicao,Vlr_Numero,Erro);
                Str(Vlr_Numero:13:2,Vlr_Exibicao);
                Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));
          Frente_Loja00.Lista_Itens.Cells[3,Linha] := Vlr_Exibicao;

                Vlr_Exibicao := Trim(Virgula_Ponto(Str_Vlr_Total));
                Val(Vlr_Exibicao,Vlr_Numero,Erro);
                Str(Vlr_Numero:13:2,Vlr_Exibicao);
                Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));
          Frente_Loja00.Lista_Itens.Cells[4,Linha] := Vlr_Exibicao;

          Frente_Loja00.Lista_Itens.Cells[5,Linha] := Str_Descr_Completa;
          Frente_Loja00.Lista_Itens.Cells[6,Linha] := Str_Estoque;

          Frente_Loja00.Lista_Itens.Row := (Frente_Loja00.Lista_Itens.RowCount) - 1;

          Frente_Loja00.Lista_Itens.Refresh;

          // Atualiza Totais >> Qtde e Valor
          Atualiza_Totais();

          End
      Else
         Begin
         If Trim(Codigo) <> '' Then
            Begin
            Frente_Loja00.EditDescricao.Caption := '*** Cod: '+Trim(Codigo)+' - Produto Não Cadastrado ***';
            MSG_Erro('Atenção: O Produto de Código: '+Trim(Codigo)+', Não Está Cadastrado No Sistema, Favor Verificar...');
            End
         Else
            Begin
            Frente_Loja00.EditDescricao.Caption := '';
         End;
      End;

      Frente_Loja00.Vezes_Teclado.Text         := 'N';
      Frente_Loja00.EditCod_Barras.Text        := '';

    Seta();

End;

Procedure Movto_Registro_Caixa(Tipo:String);
Begin

    Caixa_Data    := Inverte_Data_Plus(DateToStr(Date),'amd','-');
    Caixa_Hora    := Trim(TimeToStr(Time));
    Caixa_Usuario := Trim(Principal.Edit_Usuario.Text);
    Caixa_Maquina := Numero_HD('C');

    If Trim(Tipo)='F9-Abertura' Then

      Begin
        //*** Grava Abertura - F9 ***
        Comando_SQL := 'Insert into Registro_Caixa(';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Data,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Hora,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Usuario,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Maquina,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Operacao)';

        Comando_SQL := Comando_SQL + ' Values(';
        Comando_SQL := Comando_SQL + #39 + Caixa_Data             +#39+ ',';
        Comando_SQL := Comando_SQL + '"' + Caixa_Hora             + '",';
        Comando_SQL := Comando_SQL + '"' + Caixa_Usuario          + '",';
        Comando_SQL := Comando_SQL + '"' + Caixa_Maquina          + '",';
        Comando_SQL := Comando_SQL + '"' + 'F9 - Abertura Gaveta' + '")';

        Abre_Gaveta();

      End

    Else If Trim(Tipo)='Abertura' Then

      Begin

        Valor_Caixa := Virgula_Ponto( Trim( Caixa_Abertura00.EditVlr_Abertura.Text ));

        //*** Grava Abertura do Caixa ***
        Comando_SQL := 'Insert into Registro_Caixa(';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Data,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Hora,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Usuario,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Maquina,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Valor,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Operacao)';

        Comando_SQL := Comando_SQL + ' Values(';
        Comando_SQL := Comando_SQL + #39 + Caixa_Data     + #39 +',';
        Comando_SQL := Comando_SQL + '"' + Caixa_Hora     + '",';
        Comando_SQL := Comando_SQL + '"' + Caixa_Usuario  + '",';
        Comando_SQL := Comando_SQL + '"' + Caixa_Maquina  + '",';
        Comando_SQL := Comando_SQL +       Valor_Caixa    + ', ';
        Comando_SQL := Comando_SQL + '"' + 'Abertura'     + '")';

        Abre_Gaveta();

      End

    Else If Trim(Tipo)='Fechamento' Then

      Begin
        Valor_Cupom    := Virgula_Ponto( Trim( Caixa_Fechamento00.EditCupom.Text ));
        Valor_Abertura := Virgula_Ponto( Trim( Caixa_Fechamento00.EditAbertura.Text ));
        Valor_Venda    := Virgula_Ponto( Trim( Caixa_Fechamento00.EditVlr_Faturado.Text ));
        Valor_Sangria  := Virgula_Ponto( Trim( Caixa_Fechamento00.EditSangria.Text ));
        Valor_Caixa    := Virgula_Ponto( Trim( Caixa_Fechamento00.EditVlr_Total.Text ));

        //Grava Qtde de Cupons
        Comando_SQL := 'Insert into Registro_Caixa(';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Data,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Hora,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Usuario,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Maquina,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Valor,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Operacao)';

        Comando_SQL := Comando_SQL + ' Values(';
        Comando_SQL := Comando_SQL + #39 + Caixa_Data       + #39+ ',';
        Comando_SQL := Comando_SQL + '"' + Caixa_Hora       + '",';
        Comando_SQL := Comando_SQL + '"' + Caixa_Usuario    + '",';
        Comando_SQL := Comando_SQL + '"' + Caixa_Maquina    + '",';
        Comando_SQL := Comando_SQL +       Valor_Cupom      + ', ';
        Comando_SQL := Comando_SQL + '"' + 'Qtde de Cupons' + '")';

        ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
        ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

        //Grava o Valor da Abertura
        Comando_SQL := 'Insert into Registro_Caixa(';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Data,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Hora,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Usuario,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Maquina,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Valor,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Operacao)';

        Comando_SQL := Comando_SQL + ' Values(';
        Comando_SQL := Comando_SQL + #39 + Caixa_Data       + #39+ ',';
        Comando_SQL := Comando_SQL + '"' + Caixa_Hora       + '",';
        Comando_SQL := Comando_SQL + '"' + Caixa_Usuario    + '",';
        Comando_SQL := Comando_SQL + '"' + Caixa_Maquina    + '",';
        Comando_SQL := Comando_SQL +       Valor_Abertura   + ', ';
        Comando_SQL := Comando_SQL + '"' + 'Valor Abertura' + '")';

        ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
        ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

        //Grava Valor Faturado
        Comando_SQL := 'Insert into Registro_Caixa(';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Data,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Hora,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Usuario,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Maquina,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Valor,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Operacao)';

        Comando_SQL := Comando_SQL + ' Values(';
        Comando_SQL := Comando_SQL + #39 + Caixa_Data       + #39+ ',';
        Comando_SQL := Comando_SQL + '"' + Caixa_Hora       + '",';
        Comando_SQL := Comando_SQL + '"' + Caixa_Usuario    + '",';
        Comando_SQL := Comando_SQL + '"' + Caixa_Maquina    + '",';
        Comando_SQL := Comando_SQL +       Valor_Venda      + ', ';
        Comando_SQL := Comando_SQL + '"' + 'Valor Faturado' + '")';

        ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
        ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

        //Grava Valor Sangria
        Comando_SQL := 'Insert into Registro_Caixa(';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Data,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Hora,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Usuario,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Maquina,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Valor,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Operacao)';

        Comando_SQL := Comando_SQL + ' Values(';
        Comando_SQL := Comando_SQL + #39 + Caixa_Data       + #39+ ',';
        Comando_SQL := Comando_SQL + '"' + Caixa_Hora       + '",';
        Comando_SQL := Comando_SQL + '"' + Caixa_Usuario    + '",';
        Comando_SQL := Comando_SQL + '"' + Caixa_Maquina    + '",';
        Comando_SQL := Comando_SQL +       Valor_Sangria    + ', ';
        Comando_SQL := Comando_SQL + '"' + 'Valor Sangria ' + '")';

        ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
        ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

        //Grava Fechamento
        Comando_SQL := 'Insert into Registro_Caixa(';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Data,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Hora,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Usuario,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Maquina,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Valor,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Operacao)';

        Comando_SQL := Comando_SQL + ' Values(';
        Comando_SQL := Comando_SQL + #39 + Caixa_Data     + #39+ ',';
        Comando_SQL := Comando_SQL + '"' + Caixa_Hora     + '",';
        Comando_SQL := Comando_SQL + '"' + Caixa_Usuario  + '",';
        Comando_SQL := Comando_SQL + '"' + Caixa_Maquina  + '",';
        Comando_SQL := Comando_SQL +       Valor_Caixa    + ', ';
        Comando_SQL := Comando_SQL + '"' + 'Fechamento'   + '")';

        Abre_Gaveta();

      End

    Else If Trim(Tipo)='Depósito' Then

      Begin

        Valor_Caixa := Virgula_Ponto( Trim( Caixa_Deposito00.EditVlr_Deposito.Text ));

        //*** Valor Deposito ***
        Comando_SQL := 'Insert into Registro_Caixa(';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Data,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Hora,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Usuario,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Maquina,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Valor,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Operacao)';

        Comando_SQL := Comando_SQL + ' Values(';
        Comando_SQL := Comando_SQL + #39 + Caixa_Data           + #39+ ',';
        Comando_SQL := Comando_SQL + '"' + Caixa_Hora           + '",';
        Comando_SQL := Comando_SQL + '"' + Caixa_Usuario        + '",';
        Comando_SQL := Comando_SQL + '"' + Caixa_Maquina        + '",';
        Comando_SQL := Comando_SQL +       Valor_Caixa          + ', ';
        Comando_SQL := Comando_SQL + '"' + 'Depósito - Entrada' + '")';

        Abre_Gaveta();

      End

    Else

      Begin

        Valor_Caixa := Virgula_Ponto( Trim( Caixa_Sangria00.EditVlr_Sangria.Text ));

        // *** Valor Sangria ***
        Comando_SQL := 'Insert into Registro_Caixa(';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Data,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Hora,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Usuario,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Maquina,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Valor,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Operacao)';

        Comando_SQL := Comando_SQL + ' Values(';
        Comando_SQL := Comando_SQL + #39 + Caixa_Data           + #39+ ',';
        Comando_SQL := Comando_SQL + '"' + Caixa_Hora           + '",';
        Comando_SQL := Comando_SQL + '"' + Caixa_Usuario        + '",';
        Comando_SQL := Comando_SQL + '"' + Caixa_Maquina        + '",';
        Comando_SQL := Comando_SQL +       Valor_Caixa          + ', ';
        Comando_SQL := Comando_SQL + '"' + 'Sangria - Retirada' + '")';

    End;

    ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
    ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
    ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

    Prepara_Tela();

End;

Procedure Apaga_Item();
Var
  Linha, Ind : Integer;
  Str_Codigo_Grava, Str_Descricao_Grava, Str_Qtde_Grava, Str_Estoque: String;
  Cupom_Data, Cupom_Hora, Cupom_Maquina, Comando_SQL:String;

Begin
    Str_Codigo    := Trim(ApagaItem00.Lista_Itens.Cells[0,ApagaItem00.Lista_Itens.Row]);
    Str_Descricao := Trim(ApagaItem00.Lista_Itens.Cells[1,ApagaItem00.Lista_Itens.Row]);

    Str_Codigo_Grava := Trim(ApagaItem00.Lista_Itens.Cells[0,ApagaItem00.Lista_Itens.Row]);
    Str_Descricao_Grava := Trim(ApagaItem00.Lista_Itens.Cells[1,ApagaItem00.Lista_Itens.Row]);
    Str_Qtde_Grava := Trim(ApagaItem00.Lista_Itens.Cells[2,ApagaItem00.Lista_Itens.Row]);

    Cupom_Data    := Inverte_Data_Plus(DateToStr(Date),'amd','-');
    Cupom_Hora    := Trim(TimeToStr(Time));
    Cupom_Maquina := Numero_HD('C');

    Linha         := ApagaItem00.Lista_Itens.Row;

    If (Str_Codigo <> '')And(Linha > 0) Then
       Begin

        // Limpa Linha de Registro do Item
        Str_Codigo    := '';
        Str_Descricao := '';
        Str_Qtde      := '';
        Str_Vlr_Unit  := '';
        Str_Vlr_Total := '';
        Str_Estoque   := '';

        ApagaItem00.Lista_Itens.Cells[0,Linha]:= '';
        ApagaItem00.Lista_Itens.Cells[1,Linha]:= '';
        ApagaItem00.Lista_Itens.Cells[2,Linha]:= '';
        ApagaItem00.Lista_Itens.Cells[3,Linha]:= '';
        ApagaItem00.Lista_Itens.Cells[4,Linha]:= '';
        ApagaItem00.Lista_Itens.Cells[5,Linha]:= '';
        ApagaItem00.Lista_Itens.Cells[6,Linha]:= '';

        //Reorganiza os Itens
        For Ind:=(Linha + 1) To (ApagaItem00.Lista_Itens.RowCount - 1) Do
            begin
            ApagaItem00.Lista_Itens.Cells[0,Ind-1] := ApagaItem00.Lista_Itens.Cells[0,Ind];
            ApagaItem00.Lista_Itens.Cells[1,Ind-1] := ApagaItem00.Lista_Itens.Cells[1,Ind];
            ApagaItem00.Lista_Itens.Cells[2,Ind-1] := ApagaItem00.Lista_Itens.Cells[2,Ind];
            ApagaItem00.Lista_Itens.Cells[3,Ind-1] := ApagaItem00.Lista_Itens.Cells[3,Ind];
            ApagaItem00.Lista_Itens.Cells[4,Ind-1] := ApagaItem00.Lista_Itens.Cells[4,Ind];
            ApagaItem00.Lista_Itens.Cells[5,Ind-1] := ApagaItem00.Lista_Itens.Cells[5,Ind];
            ApagaItem00.Lista_Itens.Cells[6,Ind-1] := ApagaItem00.Lista_Itens.Cells[6,Ind];
        End;

        // Renumera o Contador do StringGrid
        ApagaItem00.Lista_Itens.RowCount := ApagaItem00.Lista_Itens.RowCount-1;

        For Ind:= 0 To Frente_Loja00.Lista_Itens.RowCount Do
            begin
            Frente_Loja00.Lista_Itens.Cells[0,Ind] := '';
            Frente_Loja00.Lista_Itens.Cells[1,Ind] := '';
            Frente_Loja00.Lista_Itens.Cells[2,Ind] := '';
            Frente_Loja00.Lista_Itens.Cells[3,Ind] := '';
            Frente_Loja00.Lista_Itens.Cells[4,Ind] := '';
            Frente_Loja00.Lista_Itens.Cells[5,Ind] := '';
            Frente_Loja00.Lista_Itens.Cells[6,Ind] := '';
        End;

        Frente_Loja00.Lista_Itens.RowCount  := ApagaItem00.Lista_Itens.RowCount;
        Frente_Loja00.Lista_Itens.FixedRows := ApagaItem00.Lista_Itens.FixedRows;

        Frente_Loja00.EditNro_Linha.Text    := IntToStr((StrToInt(Frente_Loja00.EditNro_Linha.Text) - 1));
        Frente_Loja00.EditFoco_Linha.Text   := IntToStr((StrToInt(Frente_Loja00.EditFoco_Linha.Text) - 1));

        For Ind:= 0 To ApagaItem00.Lista_Itens.RowCount Do
            begin
            Frente_Loja00.Lista_Itens.Cells[0,Ind] := ApagaItem00.Lista_Itens.Cells[0,Ind];
            Frente_Loja00.Lista_Itens.Cells[1,Ind] := ApagaItem00.Lista_Itens.Cells[1,Ind];
            Frente_Loja00.Lista_Itens.Cells[2,Ind] := ApagaItem00.Lista_Itens.Cells[2,Ind];
            Frente_Loja00.Lista_Itens.Cells[3,Ind] := ApagaItem00.Lista_Itens.Cells[3,Ind];
            Frente_Loja00.Lista_Itens.Cells[4,Ind] := ApagaItem00.Lista_Itens.Cells[4,Ind];
            Frente_Loja00.Lista_Itens.Cells[5,Ind] := ApagaItem00.Lista_Itens.Cells[5,Ind];
            Frente_Loja00.Lista_Itens.Cells[6,Ind] := ApagaItem00.Lista_Itens.Cells[6,Ind];
        End;

        // Atualiza Totais >> Qtde e Valor
        Atualiza_Totais();

        //*** Registra o Item Apagado ***

        Comando_SQL := 'Insert into Item_Cancelado(';
        Comando_SQL := Comando_SQL + 'Item_Cancelado_Data, ';
        Comando_SQL := Comando_SQL + 'Item_Cancelado_Hora, ';
        Comando_SQL := Comando_SQL + 'Item_Cancelado_Maquina, ';
        Comando_SQL := Comando_SQL + 'Item_Cancelado_Usuario, ';
        Comando_SQL := Comando_SQL + 'Item_Cancelado_Prod_Cod, ';
        Comando_SQL := Comando_SQL + 'Item_Cancelado_Prod_Desc, ';
        Comando_SQL := Comando_SQL + 'Item_Cancelado_Prod_Qtde) ';
        Comando_SQL := Comando_SQL + ' Values(';
        Comando_SQL := Comando_SQL + #39 + Cupom_Data                         + #39+ ',';
        Comando_SQL := Comando_SQL + '"' + Cupom_Hora                         + '",';
        Comando_SQL := Comando_SQL + '"' + Cupom_Maquina                      + '",';
        Comando_SQL := Comando_SQL + '"' + Trim(Principal.Edit_Usuario.Text)  + '",';
        Comando_SQL := Comando_SQL +       Str_Codigo_Grava                   + ',';
        Comando_SQL := Comando_SQL + '"' + Str_Descricao_Grava                + '",';
        Comando_SQL := Comando_SQL +       Str_Qtde_Grava                     + ')';

        ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
        ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

        //*** Finaliza o Processo ***

        ApagaItem00.Close;
    End;

End;

Procedure Atualiza_Totais();
Var
  Ind, Erro         : Integer;
  Vlr_Numero        : Real;
  Vlr_Exibicao      : String;
  Total_Qtd_Compra  : Integer;
  Total_Vlr_Compra  : Real;
Begin

    // Mostra a Quantidade de Itens e o Valor Total da Compra
    Total_Qtd_Compra  := 0;
    Total_Vlr_Compra  := 0.00;

    For Ind:=1 To (Frente_Loja00.Lista_Itens.RowCount-1) Do
      Begin

          If Frente_Loja00.Lista_Itens.Cells[2,Ind]<>'' Then
            Begin
              Total_Qtd_Compra := Total_Qtd_Compra + StrToInt(Frente_Loja00.Lista_Itens.Cells[2,Ind]);
          End;

          If Frente_Loja00.Lista_Itens.Cells[4,Ind]<>'' Then
            Begin
              Total_Vlr_Compra := Total_Vlr_Compra + StrToFloat(Frente_Loja00.Lista_Itens.Cells[4,Ind]);
          End;

    End;

    Frente_Loja00.Total_Qtd_Compra.Caption:= VarToStr(Total_Qtd_Compra);

      Vlr_Exibicao := Trim(Virgula_Ponto(FloatToStr(Total_Vlr_Compra)));
      Val(Vlr_Exibicao,Vlr_Numero,Erro);
      Str(Vlr_Numero:13:2,Vlr_Exibicao);
      Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));

    Frente_Loja00.Total_Vlr_Compra.Caption:= Vlr_Exibicao;

End;

Procedure Fecha_Cupom();

var
   Comando_SQL: String;
   
Begin

  If Trim(Frente_Loja00.EditNro_Linha.Text)<>'0' Then
    Begin
        Ampulheta();

        //*** Tela Principal ***

        Principal.T_Valor_Venda.Text := FloatToStr( StrToFloat(Ponto_Virgula(Trim(Principal.T_Valor_Venda.Text))) + StrToFloat(Ponto_Virgula(Trim(Frente_Loja00.Total_Vlr_Compra.Caption))) );

        //*** Registro das Vendas ***

        Registro_Vendas(Trim(Numero_HD('C')), Trim(Principal.T_Valor_Venda.Text), '', '');

        Frente_Loja00.Vezes_Teclado.Text            := 'N';
        Frente_Loja00.EditCod_Barras.Text           := '';
        Frente_Loja00.EditDescricao.Caption         := '';

        Frente_Loja00.EditCod_Barras.Enabled        := False;
        Frente_Loja00.Lista_Itens.Enabled           := False;

        Application.CreateForm(TFechamento_Cupom00,Fechamento_Cupom00);
        Fechamento_Cupom00.Final_Vlr_Total.Text := Frente_Loja00.Total_Vlr_Compra.Caption;
        Fechamento_Cupom00.Final_Vlr_Pago.Text  := Frente_Loja00.Total_Vlr_Compra.Caption;
        Fechamento_Cupom00.ShowModal;
        Fechamento_Cupom00.Destroy;

        Frente_Loja00.EditCodCliente.Text           := '';
        Frente_Loja00.EditNomeCliente.Text          := '';
        Frente_Loja00.EditDesconto.Text             := '0';

        Seta();
    End
  Else
    Begin
      Msg_Erro('Nenhuma compra foi Efetuada ...');
  End;

End;

Procedure Prepara_Valores();
Var
  Erro     : Integer;
  Vlr_Numero    : Real;
  Vlr_Exibicao  : String;
  Vlr_Total     : String;
  Vlr_Pago      : String;
  Vlr_Troco     : String;
Begin

    // Mostra a Quantidade os Valores da Compra
    Vlr_Total := Trim(Fechamento_Cupom00.Final_Vlr_Total.Text);
    Vlr_Pago  := Trim(Fechamento_Cupom00.Final_Vlr_Pago.Text);
    Vlr_Troco := Trim(Fechamento_Cupom00.Final_Vlr_Troco.Text);

            Vlr_Exibicao := Trim(Virgula_Ponto(Vlr_Total));
            Val(Vlr_Exibicao,Vlr_Numero,Erro);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));
    Fechamento_Cupom00.Final_Vlr_Total.Text := Vlr_Exibicao;

            Vlr_Exibicao := Trim(Virgula_Ponto(Vlr_Pago));
            Val(Vlr_Exibicao,Vlr_Numero,Erro);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));
    Fechamento_Cupom00.Final_Vlr_Pago.Text  := Vlr_Exibicao;

            Vlr_Exibicao := Trim(Virgula_Ponto(Vlr_Troco));
            Val(Vlr_Exibicao,Vlr_Numero,Erro);
            Str(Vlr_Numero:13:2,Vlr_Exibicao);
            Vlr_Exibicao := Ponto_Virgula(Trim(Vlr_Exibicao));
    Fechamento_Cupom00.Final_Vlr_Troco.Text := Vlr_Exibicao;

End;

Procedure Cancela_Cupom_Atual();
  Begin

    If Trim(Frente_Loja00.EditNro_Linha.Text)<>'0' Then
      Begin
        If Confirma('Deseja realmente cancelar o Cupom ?')=6 Then
          Begin
            Prepara_Tela();
        End;
      End
    Else
      Begin
        Msg_Erro('Nenhuma Compra foi Efetuada ...');
    End;

End;

Procedure Grava_Cupom();
Var
    Comando_SQL   :String;
    Cupom_Data    :String;
    Cupom_Hora    :String;
    Cupom_Maquina :String;
    Vlr_Total     :String;
    Vlr_Pago      :String;
    Vlr_Troco     :String;
    Ind           :Integer;
    Nro_Cabeca    :String;
Begin

    Ampulheta();

        //*** Obtem os Valores ***
        Cupom_Data    := Inverte_Data_Plus(DateToStr(Date),'amd','-');
        Cupom_Hora    := Trim(TimeToStr(Time));
        Cupom_Maquina := Numero_HD('C');
        Vlr_Total     := Virgula_Ponto( Trim(Fechamento_Cupom00.Final_Vlr_Total.Text) );
        Vlr_Pago      := Virgula_Ponto( Trim(Fechamento_Cupom00.Final_Vlr_Pago.Text) );
        Vlr_Troco     := Virgula_Ponto( Trim(Fechamento_Cupom00.Final_Vlr_Troco.Text) );

        //*** Insere o Registro Principal da Compra ***
        Comando_SQL := 'Insert into Cabeca_Cupons(';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Maquina,';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Status,';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Forma_Pgto,';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Vlr_Total,';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Vlr_Pago,';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Vlr_Troco,';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Data_Emissao,';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Hora_Emissao,';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Qtd_Itens,';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Cliente_Codigo,';
        Comando_SQL := Comando_SQL + 'Cabeca_Cupom_Cliente_Razao_Social)';

        Comando_SQL := Comando_SQL + ' Values(';
        Comando_SQL := Comando_SQL + #39 +  Cupom_Maquina                                 + #39+ ',';
        Comando_SQL := Comando_SQL + #39 +  'Fechado'                                     + #39+ ',';
        Comando_SQL := Comando_SQL + #39 +  Trim(Fechamento_Cupom00.Forma_Pgto.Text[1])   + #39+ ',';
        Comando_SQL := Comando_SQL + #39 +  Vlr_Total                                     + #39+ ',';
        Comando_SQL := Comando_SQL + #39 +  Vlr_Pago                                      + #39+ ',';
        Comando_SQL := Comando_SQL + #39 +  Vlr_Troco                                     + #39+ ',';
        Comando_SQL := Comando_SQL + #39 +  Cupom_Data                                    + #39+ ',';
        Comando_SQL := Comando_SQL + #39 +  Cupom_Hora                                    + #39+ ',';
        Comando_SQL := Comando_SQL +        Trim(Frente_Loja00.Total_Qtd_Compra.Caption)  + ', ';
        Comando_SQL := Comando_SQL + #39 +  Trim(Frente_Loja00.EditCodCliente.Text)       + #39+ ',';
        Comando_SQL := Comando_SQL + #39 +  Trim(Frente_Loja00.EditNomeCliente.Text)      + #39+ ')';

        ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
        ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

        //*** Insere o Registro Principal da Compra ***
        ConexaoBD.SQL_Cabeca_Cupons.Close;
        ConexaoBD.SQL_Cabeca_Cupons.SQL.Clear;
        ConexaoBD.SQL_Cabeca_Cupons.SQL.Add('Select * From Cabeca_Cupons Where Cabeca_Cupom_Data_Emissao = '+#39+Inverte_Data_Plus(Trim(DateToStr(Date())),'amd','-')+#39+' Order By Cabeca_Cupom_Numero DESC');
        ConexaoBD.SQL_Cabeca_Cupons.Open;

        Nro_Cabeca := ConexaoBD.SQL_Cabeca_CuponsCabeca_Cupom_Numero.Text;
        Frente_Loja00.EditNro_Cupom.Text := Nro_Cabeca;

        For Ind := 1 To (Frente_Loja00.Lista_Itens.RowCount - 2) Do
          Begin
            Comando_SQL := 'Insert into Corpo_Cupons(';
            Comando_SQL := Comando_SQL + 'Corpo_Cupom_Cabeca,';
            Comando_SQL := Comando_SQL + 'Corpo_Cupom_Maquina,';
            Comando_SQL := Comando_SQL + 'Corpo_Cupom_Prod_Codigo,';
            Comando_SQL := Comando_SQL + 'Corpo_Cupom_Prod_Desc,';
            Comando_SQL := Comando_SQL + 'Corpo_Cupom_Prod_Desc_Curta,';
            Comando_SQL := Comando_SQL + 'Corpo_Cupom_Prod_Qtde,';
            Comando_SQL := Comando_SQL + 'Corpo_Cupom_Prod_Vlr_Unitario,';
            Comando_SQL := Comando_SQL + 'Corpo_Cupom_Vlr_Total)';

            Comando_SQL := Comando_SQL + ' Values(';
            Comando_SQL := Comando_SQL + Trim(Nro_Cabeca) + ',';
            Comando_SQL := Comando_SQL + '"' + Cupom_Maquina                                + '",';
            Comando_SQL := Comando_SQL +       Trim(Frente_Loja00.Lista_Itens.Cells[0,Ind]) + ',';
            Comando_SQL := Comando_SQL + '"' + Trim(Frente_Loja00.Lista_Itens.Cells[5,Ind]) + '",';
            Comando_SQL := Comando_SQL + '"' + Trim(Frente_Loja00.Lista_Itens.Cells[1,Ind]) + '",';
            Comando_SQL := Comando_SQL +       Trim(Frente_Loja00.Lista_Itens.Cells[2,Ind]) + ',' ;
            Comando_SQL := Comando_SQL + '"' + Virgula_Ponto( Trim(Frente_Loja00.Lista_Itens.Cells[3,Ind]) ) + '",';
            Comando_SQL := Comando_SQL + '"' + Virgula_Ponto( Trim(Frente_Loja00.Lista_Itens.Cells[4,Ind]) ) + '")';

            ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
            ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
            ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

            ConexaoBD.SQL_Comunitario.SQL.Clear;
            ConexaoBD.SQL_Comunitario.SQL.Add('Update Produtos Set Produto_Ultima_Venda = ' + #39 + Cupom_Data + #39+ ', Produto_Estoque_Atual= ( Produto_Estoque_Atual - '+Trim(Frente_Loja00.Lista_Itens.Cells[2,Ind])  +') Where Produto_Codigo=' + Trim(Frente_Loja00.Lista_Itens.Cells[0,Ind]) );
            ConexaoBD.SQL_Comunitario.ExecSQL;

        End;

        //*** Insere o Registro no Caixa ***
        Comando_SQL := 'Insert into Registro_Caixa(';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Data,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Hora,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Usuario,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Maquina,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Pedido,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Valor,';
        Comando_SQL := Comando_SQL + 'Registro_Caixa_Operacao)';

        Comando_SQL := Comando_SQL + ' Values(';
        Comando_SQL := Comando_SQL + #39 + Cupom_Data                         + #39+ ',';
        Comando_SQL := Comando_SQL + '"' + Cupom_Hora                         + '",';
        Comando_SQL := Comando_SQL + '"' + Trim(Principal.Edit_Usuario.Text)  + '",';
        Comando_SQL := Comando_SQL + '"' + Numero_HD('C')                     + '",';
        Comando_SQL := Comando_SQL + '"' + Nro_Cabeca                         + '",';
        Comando_SQL := Comando_SQL + '"' + Vlr_Total                          + '",';
        Comando_SQL := Comando_SQL + '"' + 'Venda'                            + '")';

        ConexaoBD.SQL_Comunitario_Secundario.SQL.Clear;
        ConexaoBD.SQL_Comunitario_Secundario.SQL.Add(Comando_SQL);
        ConexaoBD.SQL_Comunitario_Secundario.ExecSQL;

    Seta();

End;

Procedure Movto_Ponteiro(Acao, Tabela: String);

var
   Nro_Cod_Prod: Integer;
   Str_Cod_Prod, Str_Cod_Prod_Ini, Str_Cod_Prod_Fim: String;
   Achou_Produto: Boolean;

Begin
    Ampulheta();

    If Trim(Acao) = 'Inicio' Then
      Begin

      If Trim(Tabela) = 'Produtos' Then
         Begin
         ConexaoBD.SQL_Produtos.Close;
         ConexaoBD.SQL_Produtos.SQL.Clear;
         ConexaoBD.SQL_Produtos.SQL.Add('Select * From Produtos Order By produto_codigo');
         ConexaoBD.SQL_Produtos.Open;

         If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
            Begin
            ConexaoBD.SQL_Produtos.First;

            Produtos02.lblCodigo.Caption         := ConexaoBD.SQL_ProdutosProduto_Codigo.Text;

            Produtos02.EditDescricao.Text        := ConexaoBD.SQL_ProdutosProduto_Descricao.Text;
            Produtos02.EditDescricao_Curta.Text  := ConexaoBD.SQL_ProdutosProduto_Descricao_Curta.Text;

            Produtos02.EditGrupo_Ant.Text        := ConexaoBD.SQL_ProdutosProduto_Grupo.Text;
            Produtos02.EditFor_Cod_Ant.Text      := ConexaoBD.SQL_ProdutosProduto_Fornecedor_Cod.Text;
            Produtos02.EditFor_Desc_Ant.Text     := ConexaoBD.SQL_ProdutosProduto_Fornecedor_Desc.Text;

            Carrega_Grupos('Produtos02');
            Carrega_Fornecedores('Produtos02');

            Produtos02.EditCod_Barra.Text        := ConexaoBD.SQL_ProdutosProduto_Cod_Barra.Text;
            Produtos02.Edit_Cod_Barra.Text       := ConexaoBD.SQL_ProdutosProduto_Cod_Barra.Text;

            If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'UN' Then
               Begin
               Produtos02.EditUnidade.ItemIndex   := 0;
               End
            Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'PT' Then
               Begin
               Produtos02.EditUnidade.ItemIndex   := 1;
               End
            Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'CX' Then
               Begin
               Produtos02.EditUnidade.ItemIndex   := 2;
               End
            Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'FD' Then
               Begin
               Produtos02.EditUnidade.ItemIndex   := 3;
               End
            Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'MT' Then
               Begin
               Produtos02.EditUnidade.ItemIndex   := 4;
               End
            Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'RL' Then
               Begin
               Produtos02.EditUnidade.ItemIndex   := 5;
            End;

            Produtos02.EditEstoque.Text          := ConexaoBD.SQL_ProdutosProduto_Estoque_Atual.Text;
            Produtos02.EditMinimo.Text           := ConexaoBD.SQL_ProdutosProduto_Estoque_Minimo.Text;
            Produtos02.EditCusto.Text            := ConexaoBD.SQL_ProdutosProduto_Custo.Text;
            Produtos02.EditLucro.Text            := ConexaoBD.SQL_ProdutosProduto_Margem_Lucro.Text;
            Produtos02.EditPreco.Text            := ConexaoBD.SQL_ProdutosProduto_Preco_Varejo.Text;
            Produtos02.CodProdFornecedor.Text    := ConexaoBD.SQL_ProdutosProduto_Pedido_Codigo_Fornecedor.Text;
            Produtos02.EditNCM.Text              := ConexaoBD.SQL_ProdutosProduto_NCM.Text;

            //*** Carrega a Tabela Nutricional ***
            Produtos02.EditValorEnergeticoG.Text   := ConexaoBD.SQL_ProdutosProduto_TN_Valor_Energetico_C1.Text;
            Produtos02.EditCarboidratosG.Text      := ConexaoBD.SQL_ProdutosProduto_TN_Carboidratos_C1.Text;
            Produtos02.EditProteinasG.Text         := ConexaoBD.SQL_ProdutosProduto_TN_Proteinas_C1.Text;
            Produtos02.EditGordurasTotaisG.Text    := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Totais_C1.Text;
            Produtos02.EditGordurasSaturadasG.Text := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Sat_C1.Text;
            Produtos02.EditGordurasTransG.Text     := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Trans_C1.Text;
            Produtos02.EditFibrasG.Text            := ConexaoBD.SQL_ProdutosProduto_TN_Fibras_C1.Text;
            Produtos02.EditSodioG.Text             := ConexaoBD.SQL_ProdutosProduto_TN_Sodio_C1.Text;

            Produtos02.EditValorEnergeticoP.Text   := ConexaoBD.SQL_ProdutosProduto_TN_Valor_Energetico_C2.Text;
            Produtos02.EditCarboidratosP.Text      := ConexaoBD.SQL_ProdutosProduto_TN_Carboidratos_C2.Text;
            Produtos02.EditProteinasP.Text         := ConexaoBD.SQL_ProdutosProduto_TN_Proteinas_C2.Text;
            Produtos02.EditGordurasTotaisP.Text    := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Totais_C2.Text;
            Produtos02.EditGordurasSaturadasP.Text := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Sat_C2.Text;
            Produtos02.EditGordurasTransP.Text     := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Trans_C2.Text;
            Produtos02.EditFibrasP.Text            := ConexaoBD.SQL_ProdutosProduto_TN_Fibras_C2.Text;
            Produtos02.EditSodioP.Text             := ConexaoBD.SQL_ProdutosProduto_TN_Sodio_C2.Text;
         End;

         End

      Else If Trim(Tabela) = 'Grupos' Then
         Begin
         ConexaoBD.SQL_Grupos.Close;
         ConexaoBD.SQL_Grupos.SQL.Clear;
         ConexaoBD.SQL_Grupos.SQL.Add('Select * From Grupos Order By grupo_numero');
         ConexaoBD.SQL_Grupos.Open;

         If ConexaoBD.SQL_Grupos.RecordCount > 0 Then
            Begin
            ConexaoBD.SQL_Grupos.First;

            Grupos02.lblCodigo.Caption  := ConexaoBD.SQL_GruposGrupo_Numero.Text;
            Grupos02.EditDescricao.Text := ConexaoBD.SQL_GruposGrupo_Descricao.Text;
         End;
         End

      Else If Trim(Tabela) = 'Fornecedores' Then
         Begin
         ConexaoBD.SQL_Fornecedores.Close;
         ConexaoBD.SQL_Fornecedores.SQL.Clear;
         ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Order By Fornecedor_Numero');
         ConexaoBD.SQL_Fornecedores.Open;

         If ConexaoBD.SQL_Fornecedores.RecordCount > 0 Then
            Begin
            ConexaoBD.SQL_Fornecedores.First;

            Fornecedores02.lblNumero.Caption          := ConexaoBD.SQL_FornecedoresFornecedor_Numero.Text;
            Fornecedores02.EditCNPJ.Text              := ConexaoBD.SQL_FornecedoresFornecedor_CNPJ.Text;
            Fornecedores02.EditInscricaoEstadual.Text := ConexaoBD.SQL_FornecedoresFornecedor_IE.Text;
            Fornecedores02.EditRazaoSocial.Text       := ConexaoBD.SQL_FornecedoresFornecedor_Razao_Social.Text;
            Fornecedores02.EditRamoAtividade.Text     := ConexaoBD.SQL_FornecedoresFornecedor_Ramo_Atividade.Text;
            Fornecedores02.EditNomeFantasia.Text      := ConexaoBD.SQL_FornecedoresFornecedor_Nome_Fantasia.Text;
            Fornecedores02.EditEndereco.Text          := ConexaoBD.SQL_FornecedoresFornecedor_Endereco.Text;
            Fornecedores02.EditComplemento.Text       := ConexaoBD.SQL_FornecedoresFornecedor_Complemento.Text;
            Fornecedores02.EditBairro.Text            := ConexaoBD.SQL_FornecedoresFornecedor_Bairro.Text;
            Fornecedores02.EditCidade.Text            := ConexaoBD.SQL_FornecedoresFornecedor_Cidade.Text;
            Fornecedores02.EditCep.Text               := ConexaoBD.SQL_FornecedoresFornecedor_Cep.Text;
            Fornecedores02.CBEstado.Text              := ConexaoBD.SQL_FornecedoresFornecedor_Estado.Text;
            Fornecedores02.EditContato.Text           := ConexaoBD.SQL_FornecedoresFornecedor_Contato.Text;
            Fornecedores02.EditEmail.Text             := ConexaoBD.SQL_FornecedoresFornecedor_Email.Text;
            Fornecedores02.EditFone_Comercial.Text    := ConexaoBD.SQL_FornecedoresFornecedor_Fone_Comercial.Text;
            Fornecedores02.EditFone_Celular.Text      := ConexaoBD.SQL_FornecedoresFornecedor_Fone_Celular.Text;
            Fornecedores02.EditFone_Fax.Text          := ConexaoBD.SQL_FornecedoresFornecedor_Fone_Fax.Text;
         End;

      End;

      End
    Else If Trim(Acao) = 'Final' Then
      Begin

      If Trim(Tabela) = 'Produtos' Then
         Begin
         ConexaoBD.SQL_Produtos.Close;
         ConexaoBD.SQL_Produtos.SQL.Clear;
         ConexaoBD.SQL_Produtos.SQL.Add('Select * From Produtos Order By produto_codigo Desc');
         ConexaoBD.SQL_Produtos.Open;

         If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
            Begin
            ConexaoBD.SQL_Produtos.First;

            Produtos02.lblCodigo.Caption         := ConexaoBD.SQL_ProdutosProduto_Codigo.Text;

            Produtos02.EditDescricao.Text        := ConexaoBD.SQL_ProdutosProduto_Descricao.Text;
            Produtos02.EditDescricao_Curta.Text  := ConexaoBD.SQL_ProdutosProduto_Descricao_Curta.Text;

            Produtos02.EditGrupo_Ant.Text        := ConexaoBD.SQL_ProdutosProduto_Grupo.Text;
            Produtos02.EditFor_Cod_Ant.Text      := ConexaoBD.SQL_ProdutosProduto_Fornecedor_Cod.Text;
            Produtos02.EditFor_Desc_Ant.Text     := ConexaoBD.SQL_ProdutosProduto_Fornecedor_Desc.Text;

            Carrega_Grupos('Produtos02');
            Carrega_Fornecedores('Produtos02');

            Produtos02.EditCod_Barra.Text        := ConexaoBD.SQL_ProdutosProduto_Cod_Barra.Text;
            Produtos02.Edit_Cod_Barra.Text       := ConexaoBD.SQL_ProdutosProduto_Cod_Barra.Text;

            If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'UN' Then
               Begin
               Produtos02.EditUnidade.ItemIndex   := 0;
               End
            Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'PT' Then
               Begin
               Produtos02.EditUnidade.ItemIndex   := 1;
               End
            Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'CX' Then
               Begin
               Produtos02.EditUnidade.ItemIndex   := 2;
               End
            Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'FD' Then
               Begin
               Produtos02.EditUnidade.ItemIndex   := 3;
               End
            Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'MT' Then
               Begin
               Produtos02.EditUnidade.ItemIndex   := 4;
               End
            Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'RL' Then
               Begin
               Produtos02.EditUnidade.ItemIndex   := 5;
            End;

            Produtos02.EditEstoque.Text          := ConexaoBD.SQL_ProdutosProduto_Estoque_Atual.Text;
            Produtos02.EditMinimo.Text           := ConexaoBD.SQL_ProdutosProduto_Estoque_Minimo.Text;
            Produtos02.EditCusto.Text            := ConexaoBD.SQL_ProdutosProduto_Custo.Text;
            Produtos02.EditLucro.Text            := ConexaoBD.SQL_ProdutosProduto_Margem_Lucro.Text;
            Produtos02.EditPreco.Text            := ConexaoBD.SQL_ProdutosProduto_Preco_Varejo.Text;
            Produtos02.CodProdFornecedor.Text    := ConexaoBD.SQL_ProdutosProduto_Pedido_Codigo_Fornecedor.Text;
            Produtos02.EditNCM.Text              := ConexaoBD.SQL_ProdutosProduto_NCM.Text;

            //*** Carrega a Tabela Nutricional ***
            Produtos02.EditValorEnergeticoG.Text   := ConexaoBD.SQL_ProdutosProduto_TN_Valor_Energetico_C1.Text;
            Produtos02.EditCarboidratosG.Text      := ConexaoBD.SQL_ProdutosProduto_TN_Carboidratos_C1.Text;
            Produtos02.EditProteinasG.Text         := ConexaoBD.SQL_ProdutosProduto_TN_Proteinas_C1.Text;
            Produtos02.EditGordurasTotaisG.Text    := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Totais_C1.Text;
            Produtos02.EditGordurasSaturadasG.Text := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Sat_C1.Text;
            Produtos02.EditGordurasTransG.Text     := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Trans_C1.Text;
            Produtos02.EditFibrasG.Text            := ConexaoBD.SQL_ProdutosProduto_TN_Fibras_C1.Text;
            Produtos02.EditSodioG.Text             := ConexaoBD.SQL_ProdutosProduto_TN_Sodio_C1.Text;

            Produtos02.EditValorEnergeticoP.Text   := ConexaoBD.SQL_ProdutosProduto_TN_Valor_Energetico_C2.Text;
            Produtos02.EditCarboidratosP.Text      := ConexaoBD.SQL_ProdutosProduto_TN_Carboidratos_C2.Text;
            Produtos02.EditProteinasP.Text         := ConexaoBD.SQL_ProdutosProduto_TN_Proteinas_C2.Text;
            Produtos02.EditGordurasTotaisP.Text    := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Totais_C2.Text;
            Produtos02.EditGordurasSaturadasP.Text := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Sat_C2.Text;
            Produtos02.EditGordurasTransP.Text     := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Trans_C2.Text;
            Produtos02.EditFibrasP.Text            := ConexaoBD.SQL_ProdutosProduto_TN_Fibras_C2.Text;
            Produtos02.EditSodioP.Text             := ConexaoBD.SQL_ProdutosProduto_TN_Sodio_C2.Text;
         End;

         End

      Else If Trim(Tabela) = 'Grupos' Then
         Begin
         ConexaoBD.SQL_Grupos.Close;
         ConexaoBD.SQL_Grupos.SQL.Clear;
         ConexaoBD.SQL_Grupos.SQL.Add('Select * From Grupos Order By grupo_numero Desc');
         ConexaoBD.SQL_Grupos.Open;

         If ConexaoBD.SQL_Grupos.RecordCount > 0 Then
            Begin
            ConexaoBD.SQL_Grupos.First;

            Grupos02.lblCodigo.Caption  := ConexaoBD.SQL_GruposGrupo_Numero.Text;
            Grupos02.EditDescricao.Text := ConexaoBD.SQL_GruposGrupo_Descricao.Text;
         End;
         End

      Else If Trim(Tabela) = 'Fornecedores' Then
         Begin
         ConexaoBD.SQL_Fornecedores.Close;
         ConexaoBD.SQL_Fornecedores.SQL.Clear;
         ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Order By fornecedor_numero Desc');
         ConexaoBD.SQL_Fornecedores.Open;

         If ConexaoBD.SQL_Fornecedores.RecordCount > 0 Then
            Begin
            ConexaoBD.SQL_Fornecedores.First;

            Fornecedores02.lblNumero.Caption          := ConexaoBD.SQL_FornecedoresFornecedor_Numero.Text;
            Fornecedores02.EditCNPJ.Text              := ConexaoBD.SQL_FornecedoresFornecedor_CNPJ.Text;
            Fornecedores02.EditInscricaoEstadual.Text := ConexaoBD.SQL_FornecedoresFornecedor_IE.Text;
            Fornecedores02.EditRazaoSocial.Text       := ConexaoBD.SQL_FornecedoresFornecedor_Razao_Social.Text;
            Fornecedores02.EditRamoAtividade.Text     := ConexaoBD.SQL_FornecedoresFornecedor_Ramo_Atividade.Text;
            Fornecedores02.EditNomeFantasia.Text      := ConexaoBD.SQL_FornecedoresFornecedor_Nome_Fantasia.Text;
            Fornecedores02.EditEndereco.Text          := ConexaoBD.SQL_FornecedoresFornecedor_Endereco.Text;
            Fornecedores02.EditComplemento.Text       := ConexaoBD.SQL_FornecedoresFornecedor_Complemento.Text;
            Fornecedores02.EditBairro.Text            := ConexaoBD.SQL_FornecedoresFornecedor_Bairro.Text;
            Fornecedores02.EditCidade.Text            := ConexaoBD.SQL_FornecedoresFornecedor_Cidade.Text;
            Fornecedores02.EditCep.Text               := ConexaoBD.SQL_FornecedoresFornecedor_Cep.Text;
            Fornecedores02.CBEstado.Text              := ConexaoBD.SQL_FornecedoresFornecedor_Estado.Text;
            Fornecedores02.EditContato.Text           := ConexaoBD.SQL_FornecedoresFornecedor_Contato.Text;
            Fornecedores02.EditEmail.Text             := ConexaoBD.SQL_FornecedoresFornecedor_Email.Text;
            Fornecedores02.EditFone_Comercial.Text    := ConexaoBD.SQL_FornecedoresFornecedor_Fone_Comercial.Text;
            Fornecedores02.EditFone_Celular.Text      := ConexaoBD.SQL_FornecedoresFornecedor_Fone_Celular.Text;
            Fornecedores02.EditFone_Fax.Text          := ConexaoBD.SQL_FornecedoresFornecedor_Fone_Fax.Text;
         End;
      End;

      End
    Else If Trim(Acao) = 'Anterior' Then
      Begin

      If Trim(Tabela) = 'Produtos' Then
         Begin

         Achou_Produto := False;

         //*** Obtem a Posição Inicial ***

         ConexaoBD.SQL_Produtos.Close;
         ConexaoBD.SQL_Produtos.SQL.Clear;
         ConexaoBD.SQL_Produtos.SQL.Add('Select * From Produtos Order By produto_codigo');
         ConexaoBD.SQL_Produtos.Open;

         If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
            Begin
            ConexaoBD.SQL_Produtos.First;
            Str_Cod_Prod_Ini := ConexaoBD.SQL_ProdutosProduto_Codigo.Text;
            End
         Else
            Begin
            Str_Cod_Prod_Ini := '0';
         End;

         //*** Obtem a Posição Final ***

         ConexaoBD.SQL_Produtos.Close;
         ConexaoBD.SQL_Produtos.SQL.Clear;
         ConexaoBD.SQL_Produtos.SQL.Add('Select * From Produtos Order By produto_codigo Desc');
         ConexaoBD.SQL_Produtos.Open;

         If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
            Begin
            ConexaoBD.SQL_Produtos.First;
            Str_Cod_Prod_Fim := ConexaoBD.SQL_ProdutosProduto_Codigo.Text;
            End
         Else
            Begin
            Str_Cod_Prod_Fim := '0';
         End;

         //*** Para na Posição Correta ***

         Nro_Cod_Prod := StrToInt(Produtos02.lblCodigo.Caption);
         Str_Cod_Prod := IntToStr(Nro_Cod_Prod);

         While Not Achou_Produto Do
               Begin
               Nro_Cod_Prod := (Nro_Cod_Prod - 1);
               Str_Cod_Prod := IntToStr(Nro_Cod_Prod);

               If Nro_Cod_Prod < StrToInt(Str_Cod_Prod_Ini) Then
                  Begin
                  Str_Cod_Prod := Str_Cod_Prod_Ini;
               End;

               If ((StrToInt(Str_Cod_Prod) >= StrToInt(Str_Cod_Prod_Ini)) And (StrToInt(Str_Cod_Prod) <= StrToInt(Str_Cod_Prod_Fim))) Then
                  Begin
                  ConexaoBD.SQL_Produtos.Close;
                  ConexaoBD.SQL_Produtos.SQL.Clear;
                  ConexaoBD.SQL_Produtos.SQL.Add('Select * From Produtos Where produto_codigo = ' + Trim(Str_Cod_Prod) );
                  ConexaoBD.SQL_Produtos.Open;

                  If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
                     Begin
                     ConexaoBD.SQL_Produtos.First;

                     Achou_Produto := True;

                     Produtos02.lblCodigo.Caption         := ConexaoBD.SQL_ProdutosProduto_Codigo.Text;

                     Produtos02.EditDescricao.Text        := ConexaoBD.SQL_ProdutosProduto_Descricao.Text;
                     Produtos02.EditDescricao_Curta.Text  := ConexaoBD.SQL_ProdutosProduto_Descricao_Curta.Text;

                     Produtos02.EditGrupo_Ant.Text        := ConexaoBD.SQL_ProdutosProduto_Grupo.Text;
                     Produtos02.EditFor_Cod_Ant.Text      := ConexaoBD.SQL_ProdutosProduto_Fornecedor_Cod.Text;
                     Produtos02.EditFor_Desc_Ant.Text     := ConexaoBD.SQL_ProdutosProduto_Fornecedor_Desc.Text;

                     Carrega_Grupos('Produtos02');
                     Carrega_Fornecedores('Produtos02');

                     Produtos02.EditCod_Barra.Text        := ConexaoBD.SQL_ProdutosProduto_Cod_Barra.Text;
                     Produtos02.Edit_Cod_Barra.Text       := ConexaoBD.SQL_ProdutosProduto_Cod_Barra.Text;

                     If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'UN' Then
                        Begin
                        Produtos02.EditUnidade.ItemIndex   := 0;
                        End
                     Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'PT' Then
                        Begin
                        Produtos02.EditUnidade.ItemIndex   := 1;
                        End
                     Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'CX' Then
                        Begin
                        Produtos02.EditUnidade.ItemIndex   := 2;
                        End
                     Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'FD' Then
                        Begin
                        Produtos02.EditUnidade.ItemIndex   := 3;
                        End
                     Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'MT' Then
                        Begin
                        Produtos02.EditUnidade.ItemIndex   := 4;
                        End
                     Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'RL' Then
                        Begin
                        Produtos02.EditUnidade.ItemIndex   := 5;
                     End;

                     Produtos02.EditEstoque.Text          := ConexaoBD.SQL_ProdutosProduto_Estoque_Atual.Text;
                     Produtos02.EditMinimo.Text           := ConexaoBD.SQL_ProdutosProduto_Estoque_Minimo.Text;
                     Produtos02.EditCusto.Text            := ConexaoBD.SQL_ProdutosProduto_Custo.Text;
                     Produtos02.EditLucro.Text            := ConexaoBD.SQL_ProdutosProduto_Margem_Lucro.Text;
                     Produtos02.EditPreco.Text            := ConexaoBD.SQL_ProdutosProduto_Preco_Varejo.Text;
                     Produtos02.CodProdFornecedor.Text    := ConexaoBD.SQL_ProdutosProduto_Pedido_Codigo_Fornecedor.Text;
                     Produtos02.EditNCM.Text              := ConexaoBD.SQL_ProdutosProduto_NCM.Text;

                     //*** Carrega a Tabela Nutricional ***
                     Produtos02.EditValorEnergeticoG.Text   := ConexaoBD.SQL_ProdutosProduto_TN_Valor_Energetico_C1.Text;
                     Produtos02.EditCarboidratosG.Text      := ConexaoBD.SQL_ProdutosProduto_TN_Carboidratos_C1.Text;
                     Produtos02.EditProteinasG.Text         := ConexaoBD.SQL_ProdutosProduto_TN_Proteinas_C1.Text;
                     Produtos02.EditGordurasTotaisG.Text    := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Totais_C1.Text;
                     Produtos02.EditGordurasSaturadasG.Text := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Sat_C1.Text;
                     Produtos02.EditGordurasTransG.Text     := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Trans_C1.Text;
                     Produtos02.EditFibrasG.Text            := ConexaoBD.SQL_ProdutosProduto_TN_Fibras_C1.Text;
                     Produtos02.EditSodioG.Text             := ConexaoBD.SQL_ProdutosProduto_TN_Sodio_C1.Text;

                     Produtos02.EditValorEnergeticoP.Text   := ConexaoBD.SQL_ProdutosProduto_TN_Valor_Energetico_C2.Text;
                     Produtos02.EditCarboidratosP.Text      := ConexaoBD.SQL_ProdutosProduto_TN_Carboidratos_C2.Text;
                     Produtos02.EditProteinasP.Text         := ConexaoBD.SQL_ProdutosProduto_TN_Proteinas_C2.Text;
                     Produtos02.EditGordurasTotaisP.Text    := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Totais_C2.Text;
                     Produtos02.EditGordurasSaturadasP.Text := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Sat_C2.Text;
                     Produtos02.EditGordurasTransP.Text     := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Trans_C2.Text;
                     Produtos02.EditFibrasP.Text            := ConexaoBD.SQL_ProdutosProduto_TN_Fibras_C2.Text;
                     Produtos02.EditSodioP.Text             := ConexaoBD.SQL_ProdutosProduto_TN_Sodio_C2.Text;
                  End;

                  If Str_Cod_Prod = Str_Cod_Prod_Ini Then
                  Begin
                     MSG_Erro('Este é o primeiro produto cadastrado!');
                  End;
               End;
         End;
         End

      Else If Trim(Tabela) = 'Grupos' Then
         Begin

         Achou_Produto := False;

         //*** Obtem a Posição Inicial ***

         ConexaoBD.SQL_Grupos.Close;
         ConexaoBD.SQL_Grupos.SQL.Clear;
         ConexaoBD.SQL_Grupos.SQL.Add('Select * From Grupos Order By grupo_numero');
         ConexaoBD.SQL_Grupos.Open;

         If ConexaoBD.SQL_Grupos.RecordCount > 0 Then
            Begin
            ConexaoBD.SQL_Grupos.First;
            Str_Cod_Prod_Ini := ConexaoBD.SQL_GruposGrupo_Numero.Text;
            End
         Else
            Begin
            Str_Cod_Prod_Ini := '0';
         End;

         //*** Obtem a Posição Final ***

         ConexaoBD.SQL_Grupos.Close;
         ConexaoBD.SQL_Grupos.SQL.Clear;
         ConexaoBD.SQL_Grupos.SQL.Add('Select * From Grupos Order By grupo_numero Desc');
         ConexaoBD.SQL_Grupos.Open;

         If ConexaoBD.SQL_Grupos.RecordCount > 0 Then
            Begin
            ConexaoBD.SQL_Grupos.First;
            Str_Cod_Prod_Fim := ConexaoBD.SQL_GruposGrupo_Numero.Text;
            End
         Else
            Begin
            Str_Cod_Prod_Fim := '0';
         End;

         //*** Para na Posição Correta ***

         Nro_Cod_Prod := StrToInt(Grupos02.lblCodigo.Caption);
         Str_Cod_Prod := IntToStr(Nro_Cod_Prod);

         While Not Achou_Produto Do
               Begin
               Nro_Cod_Prod := (Nro_Cod_Prod - 1);
               Str_Cod_Prod := IntToStr(Nro_Cod_Prod);

               If Nro_Cod_Prod < StrToInt(Str_Cod_Prod_Ini) Then
                  Begin
                  Str_Cod_Prod := Str_Cod_Prod_Ini;
               End;

               If ((StrToInt(Str_Cod_Prod) >= StrToInt(Str_Cod_Prod_Ini)) And (StrToInt(Str_Cod_Prod) <= StrToInt(Str_Cod_Prod_Fim))) Then
                  Begin
                  ConexaoBD.SQL_Grupos.Close;
                  ConexaoBD.SQL_Grupos.SQL.Clear;
                  ConexaoBD.SQL_Grupos.SQL.Add('Select * From Grupos Where grupo_numero = ' + Trim(Str_Cod_Prod) );
                  ConexaoBD.SQL_Grupos.Open;

                  If ConexaoBD.SQL_Grupos.RecordCount > 0 Then
                     Begin
                     ConexaoBD.SQL_Grupos.First;

                     Achou_Produto := True;

                     Grupos02.lblCodigo.Caption  := ConexaoBD.SQL_GruposGrupo_Numero.Text;
                     Grupos02.EditDescricao.Text := ConexaoBD.SQL_GruposGrupo_Descricao.Text;
                  End;
               End;
         End;
         End

      Else If Trim(Tabela) = 'Fornecedores' Then
         Begin

         Achou_Produto := False;

         //*** Obtem a Posição Inicial ***

         ConexaoBD.SQL_Fornecedores.Close;
         ConexaoBD.SQL_Fornecedores.SQL.Clear;
         ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Order By fornecedor_numero');
         ConexaoBD.SQL_Fornecedores.Open;

         If ConexaoBD.SQL_Fornecedores.RecordCount > 0 Then
            Begin
            ConexaoBD.SQL_Fornecedores.First;
            Str_Cod_Prod_Ini := ConexaoBD.SQL_FornecedoresFornecedor_Numero.Text;
            End
         Else
            Begin
            Str_Cod_Prod_Ini := '0';
         End;

         //*** Obtem a Posição Final ***

         ConexaoBD.SQL_Fornecedores.Close;
         ConexaoBD.SQL_Fornecedores.SQL.Clear;
         ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Order By fornecedor_numero Desc');
         ConexaoBD.SQL_Fornecedores.Open;

         If ConexaoBD.SQL_Fornecedores.RecordCount > 0 Then
            Begin
            ConexaoBD.SQL_Fornecedores.First;
            Str_Cod_Prod_Fim := ConexaoBD.SQL_FornecedoresFornecedor_Numero.Text;
            End
         Else
            Begin
            Str_Cod_Prod_Fim := '0';
         End;

         //*** Para na Posição Correta ***

         Nro_Cod_Prod := StrToInt(Fornecedores02.lblNumero.Caption);
         Str_Cod_Prod := IntToStr(Nro_Cod_Prod);

         While Not Achou_Produto Do
               Begin
               Nro_Cod_Prod := (Nro_Cod_Prod - 1);
               Str_Cod_Prod := IntToStr(Nro_Cod_Prod);

               If Nro_Cod_Prod < StrToInt(Str_Cod_Prod_Ini) Then
                  Begin
                  Str_Cod_Prod := Str_Cod_Prod_Ini;
               End;

               If ((StrToInt(Str_Cod_Prod) >= StrToInt(Str_Cod_Prod_Ini)) And (StrToInt(Str_Cod_Prod) <= StrToInt(Str_Cod_Prod_Fim))) Then
                  Begin
                  ConexaoBD.SQL_Fornecedores.Close;
                  ConexaoBD.SQL_Fornecedores.SQL.Clear;
                  ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Where fornecedor_numero = ' + Trim(Str_Cod_Prod) );
                  ConexaoBD.SQL_Fornecedores.Open;

                  If ConexaoBD.SQL_Fornecedores.RecordCount > 0 Then
                     Begin
                     ConexaoBD.SQL_Fornecedores.First;

                     Achou_Produto := True;

                     Fornecedores02.lblNumero.Caption          := ConexaoBD.SQL_FornecedoresFornecedor_Numero.Text;
                     Fornecedores02.EditCNPJ.Text              := ConexaoBD.SQL_FornecedoresFornecedor_CNPJ.Text;
                     Fornecedores02.EditInscricaoEstadual.Text := ConexaoBD.SQL_FornecedoresFornecedor_IE.Text;
                     Fornecedores02.EditRazaoSocial.Text       := ConexaoBD.SQL_FornecedoresFornecedor_Razao_Social.Text;
                     Fornecedores02.EditRamoAtividade.Text     := ConexaoBD.SQL_FornecedoresFornecedor_Ramo_Atividade.Text;
                     Fornecedores02.EditNomeFantasia.Text      := ConexaoBD.SQL_FornecedoresFornecedor_Nome_Fantasia.Text;
                     Fornecedores02.EditEndereco.Text          := ConexaoBD.SQL_FornecedoresFornecedor_Endereco.Text;
                     Fornecedores02.EditComplemento.Text       := ConexaoBD.SQL_FornecedoresFornecedor_Complemento.Text;
                     Fornecedores02.EditBairro.Text            := ConexaoBD.SQL_FornecedoresFornecedor_Bairro.Text;
                     Fornecedores02.EditCidade.Text            := ConexaoBD.SQL_FornecedoresFornecedor_Cidade.Text;
                     Fornecedores02.EditCep.Text               := ConexaoBD.SQL_FornecedoresFornecedor_Cep.Text;
                     Fornecedores02.CBEstado.Text              := ConexaoBD.SQL_FornecedoresFornecedor_Estado.Text;
                     Fornecedores02.EditContato.Text           := ConexaoBD.SQL_FornecedoresFornecedor_Contato.Text;
                     Fornecedores02.EditEmail.Text             := ConexaoBD.SQL_FornecedoresFornecedor_Email.Text;
                     Fornecedores02.EditFone_Comercial.Text    := ConexaoBD.SQL_FornecedoresFornecedor_Fone_Comercial.Text;
                     Fornecedores02.EditFone_Celular.Text      := ConexaoBD.SQL_FornecedoresFornecedor_Fone_Celular.Text;
                     Fornecedores02.EditFone_Fax.Text          := ConexaoBD.SQL_FornecedoresFornecedor_Fone_Fax.Text;
                  End;
               End;
         End;
      End;

      End
    Else If Trim(Acao) = 'Proximo' Then
      Begin

      If Trim(Tabela) = 'Produtos' Then
         Begin

         Achou_Produto := False;

         //*** Obtem a Posição Inicial ***

         ConexaoBD.SQL_Produtos.Close;
         ConexaoBD.SQL_Produtos.SQL.Clear;
         ConexaoBD.SQL_Produtos.SQL.Add('Select * From Produtos Order By produto_codigo');
         ConexaoBD.SQL_Produtos.Open;

         If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
            Begin
            ConexaoBD.SQL_Produtos.First;
            Str_Cod_Prod_Ini := ConexaoBD.SQL_ProdutosProduto_Codigo.Text;
            End
         Else
            Begin
            Str_Cod_Prod_Ini := '0';
         End;

         //*** Obtem a Posição Final ***

         ConexaoBD.SQL_Produtos.Close;
         ConexaoBD.SQL_Produtos.SQL.Clear;
         ConexaoBD.SQL_Produtos.SQL.Add('Select * From Produtos Order By produto_codigo Desc');
         ConexaoBD.SQL_Produtos.Open;

         If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
            Begin
            ConexaoBD.SQL_Produtos.First;
            Str_Cod_Prod_Fim := ConexaoBD.SQL_ProdutosProduto_Codigo.Text;
            End
         Else
            Begin
            Str_Cod_Prod_Fim := '0';
         End;

         //*** Para na Posição Correta ***

         Nro_Cod_Prod := StrToInt(Produtos02.lblCodigo.Caption);
         Str_Cod_Prod := IntToStr(Nro_Cod_Prod);

         While Not Achou_Produto Do
               Begin
               Nro_Cod_Prod := (Nro_Cod_Prod + 1);
               Str_Cod_Prod := IntToStr(Nro_Cod_Prod);

               If Nro_Cod_Prod > StrToInt(Str_Cod_Prod_Fim) Then
                  Begin
                  Str_Cod_Prod := Str_Cod_Prod_Fim;
               End;

               If ((StrToInt(Str_Cod_Prod) >= StrToInt(Str_Cod_Prod_Ini)) And (StrToInt(Str_Cod_Prod) <= StrToInt(Str_Cod_Prod_Fim))) Then
                  Begin
                  ConexaoBD.SQL_Produtos.Close;
                  ConexaoBD.SQL_Produtos.SQL.Clear;
                  ConexaoBD.SQL_Produtos.SQL.Add('Select * From Produtos Where produto_codigo = ' + Trim(Str_Cod_Prod) );
                  ConexaoBD.SQL_Produtos.Open;

                  If ConexaoBD.SQL_Produtos.RecordCount > 0 Then
                     Begin
                     ConexaoBD.SQL_Produtos.First;

                     Achou_Produto := True;

                     Produtos02.lblCodigo.Caption         := ConexaoBD.SQL_ProdutosProduto_Codigo.Text;

                     Produtos02.EditDescricao.Text        := ConexaoBD.SQL_ProdutosProduto_Descricao.Text;
                     Produtos02.EditDescricao_Curta.Text  := ConexaoBD.SQL_ProdutosProduto_Descricao_Curta.Text;

                     Produtos02.EditGrupo_Ant.Text        := ConexaoBD.SQL_ProdutosProduto_Grupo.Text;
                     Produtos02.EditFor_Cod_Ant.Text      := ConexaoBD.SQL_ProdutosProduto_Fornecedor_Cod.Text;
                     Produtos02.EditFor_Desc_Ant.Text     := ConexaoBD.SQL_ProdutosProduto_Fornecedor_Desc.Text;

                     Carrega_Grupos('Produtos02');
                     Carrega_Fornecedores('Produtos02');

                     Produtos02.EditCod_Barra.Text        := ConexaoBD.SQL_ProdutosProduto_Cod_Barra.Text;
                     Produtos02.Edit_Cod_Barra.Text       := ConexaoBD.SQL_ProdutosProduto_Cod_Barra.Text;

                     If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'UN' Then
                        Begin
                        Produtos02.EditUnidade.ItemIndex   := 0;
                        End
                     Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'PT' Then
                        Begin
                        Produtos02.EditUnidade.ItemIndex   := 1;
                        End
                     Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'CX' Then
                        Begin
                        Produtos02.EditUnidade.ItemIndex   := 2;
                        End
                     Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'FD' Then
                        Begin
                        Produtos02.EditUnidade.ItemIndex   := 3;
                        End
                     Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'MT' Then
                        Begin
                        Produtos02.EditUnidade.ItemIndex   := 4;
                        End
                     Else If ConexaoBD.SQL_ProdutosProduto_Unidade.Text = 'RL' Then
                        Begin
                        Produtos02.EditUnidade.ItemIndex   := 5;
                     End;

                     Produtos02.EditEstoque.Text          := ConexaoBD.SQL_ProdutosProduto_Estoque_Atual.Text;
                     Produtos02.EditMinimo.Text           := ConexaoBD.SQL_ProdutosProduto_Estoque_Minimo.Text;
                     Produtos02.EditCusto.Text            := ConexaoBD.SQL_ProdutosProduto_Custo.Text;
                     Produtos02.EditLucro.Text            := ConexaoBD.SQL_ProdutosProduto_Margem_Lucro.Text;
                     Produtos02.EditPreco.Text            := ConexaoBD.SQL_ProdutosProduto_Preco_Varejo.Text;
                     Produtos02.CodProdFornecedor.Text    := ConexaoBD.SQL_ProdutosProduto_Pedido_Codigo_Fornecedor.Text;
                     Produtos02.EditNCM.Text              := ConexaoBD.SQL_ProdutosProduto_NCM.Text;

                     //*** Carrega a Tabela Nutricional ***
                     Produtos02.EditValorEnergeticoG.Text   := ConexaoBD.SQL_ProdutosProduto_TN_Valor_Energetico_C1.Text;
                     Produtos02.EditCarboidratosG.Text      := ConexaoBD.SQL_ProdutosProduto_TN_Carboidratos_C1.Text;
                     Produtos02.EditProteinasG.Text         := ConexaoBD.SQL_ProdutosProduto_TN_Proteinas_C1.Text;
                     Produtos02.EditGordurasTotaisG.Text    := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Totais_C1.Text;
                     Produtos02.EditGordurasSaturadasG.Text := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Sat_C1.Text;
                     Produtos02.EditGordurasTransG.Text     := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Trans_C1.Text;
                     Produtos02.EditFibrasG.Text            := ConexaoBD.SQL_ProdutosProduto_TN_Fibras_C1.Text;
                     Produtos02.EditSodioG.Text             := ConexaoBD.SQL_ProdutosProduto_TN_Sodio_C1.Text;

                     Produtos02.EditValorEnergeticoP.Text   := ConexaoBD.SQL_ProdutosProduto_TN_Valor_Energetico_C2.Text;
                     Produtos02.EditCarboidratosP.Text      := ConexaoBD.SQL_ProdutosProduto_TN_Carboidratos_C2.Text;
                     Produtos02.EditProteinasP.Text         := ConexaoBD.SQL_ProdutosProduto_TN_Proteinas_C2.Text;
                     Produtos02.EditGordurasTotaisP.Text    := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Totais_C2.Text;
                     Produtos02.EditGordurasSaturadasP.Text := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Sat_C2.Text;
                     Produtos02.EditGordurasTransP.Text     := ConexaoBD.SQL_ProdutosProduto_TN_Gorduras_Trans_C2.Text;
                     Produtos02.EditFibrasP.Text            := ConexaoBD.SQL_ProdutosProduto_TN_Fibras_C2.Text;
                     Produtos02.EditSodioP.Text             := ConexaoBD.SQL_ProdutosProduto_TN_Sodio_C2.Text;
                  End;

                  If Str_Cod_Prod = Str_Cod_Prod_Fim Then
                  Begin
                     MSG_Erro('Este é o último produto cadastrado!');
                  End;
               End;
         End;
         End

      Else If Trim(Tabela) = 'Grupos' Then
         Begin

         Achou_Produto := False;

         //*** Obtem a Posição Inicial ***

         ConexaoBD.SQL_Grupos.Close;
         ConexaoBD.SQL_Grupos.SQL.Clear;
         ConexaoBD.SQL_Grupos.SQL.Add('Select * From Grupos Order By grupo_numero');
         ConexaoBD.SQL_Grupos.Open;

         If ConexaoBD.SQL_Grupos.RecordCount > 0 Then
            Begin
            ConexaoBD.SQL_Grupos.First;
            Str_Cod_Prod_Ini := ConexaoBD.SQL_GruposGrupo_Numero.Text;
            End
         Else
            Begin
            Str_Cod_Prod_Ini := '0';
         End;

         //*** Obtem a Posição Final ***

         ConexaoBD.SQL_Grupos.Close;
         ConexaoBD.SQL_Grupos.SQL.Clear;
         ConexaoBD.SQL_Grupos.SQL.Add('Select * From Grupos Order By grupo_numero Desc');
         ConexaoBD.SQL_Grupos.Open;

         If ConexaoBD.SQL_Grupos.RecordCount > 0 Then
            Begin
            ConexaoBD.SQL_Grupos.First;
            Str_Cod_Prod_Fim := ConexaoBD.SQL_GruposGrupo_Numero.Text;
            End
         Else
            Begin
            Str_Cod_Prod_Fim := '0';
         End;

         //*** Para na Posição Correta ***

         Nro_Cod_Prod := StrToInt(Grupos02.lblCodigo.Caption);
         Str_Cod_Prod := IntToStr(Nro_Cod_Prod);

         While Not Achou_Produto Do
               Begin
               Nro_Cod_Prod := (Nro_Cod_Prod + 1);
               Str_Cod_Prod := IntToStr(Nro_Cod_Prod);

               If Nro_Cod_Prod > StrToInt(Str_Cod_Prod_Fim) Then
                  Begin
                  Str_Cod_Prod := Str_Cod_Prod_Fim;
               End;

               If ((StrToInt(Str_Cod_Prod) >= StrToInt(Str_Cod_Prod_Ini)) And (StrToInt(Str_Cod_Prod) <= StrToInt(Str_Cod_Prod_Fim))) Then
                  Begin
                  ConexaoBD.SQL_Grupos.Close;
                  ConexaoBD.SQL_Grupos.SQL.Clear;
                  ConexaoBD.SQL_Grupos.SQL.Add('Select * From Grupos Where grupo_numero = ' + Trim(Str_Cod_Prod) );
                  ConexaoBD.SQL_Grupos.Open;

                  If ConexaoBD.SQL_Grupos.RecordCount > 0 Then
                     Begin
                     ConexaoBD.SQL_Grupos.First;

                     Achou_Produto := True;

                     Grupos02.lblCodigo.Caption  := ConexaoBD.SQL_GruposGrupo_Numero.Text;
                     Grupos02.EditDescricao.Text := ConexaoBD.SQL_GruposGrupo_Descricao.Text;
                  End;
               End;
         End;
         End

      Else If Trim(Tabela) = 'Fornecedores' Then
         Begin

         Achou_Produto := False;

         //*** Obtem a Posição Inicial ***

         ConexaoBD.SQL_Fornecedores.Close;
         ConexaoBD.SQL_Fornecedores.SQL.Clear;
         ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Order By fornecedor_numero');
         ConexaoBD.SQL_Fornecedores.Open;

         If ConexaoBD.SQL_Fornecedores.RecordCount > 0 Then
            Begin
            ConexaoBD.SQL_Fornecedores.First;
            Str_Cod_Prod_Ini := ConexaoBD.SQL_FornecedoresFornecedor_Numero.Text;
            End
         Else
            Begin
            Str_Cod_Prod_Ini := '0';
         End;

         //*** Obtem a Posição Final ***

         ConexaoBD.SQL_Fornecedores.Close;
         ConexaoBD.SQL_Fornecedores.SQL.Clear;
         ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Order By fornecedor_numero Desc');
         ConexaoBD.SQL_Fornecedores.Open;

         If ConexaoBD.SQL_Fornecedores.RecordCount > 0 Then
            Begin
            ConexaoBD.SQL_Fornecedores.First;
            Str_Cod_Prod_Fim := ConexaoBD.SQL_FornecedoresFornecedor_Numero.Text;
            End
         Else
            Begin
            Str_Cod_Prod_Fim := '0';
         End;

         //*** Para na Posição Correta ***

         Nro_Cod_Prod := StrToInt(Fornecedores02.lblNumero.Caption);
         Str_Cod_Prod := IntToStr(Nro_Cod_Prod);

         While Not Achou_Produto Do
               Begin
               Nro_Cod_Prod := (Nro_Cod_Prod + 1);
               Str_Cod_Prod := IntToStr(Nro_Cod_Prod);

               If Nro_Cod_Prod > StrToInt(Str_Cod_Prod_Fim) Then
                  Begin
                  Str_Cod_Prod := Str_Cod_Prod_Fim;
               End;

               If ((StrToInt(Str_Cod_Prod) >= StrToInt(Str_Cod_Prod_Ini)) And (StrToInt(Str_Cod_Prod) <= StrToInt(Str_Cod_Prod_Fim))) Then
                  Begin
                  ConexaoBD.SQL_Fornecedores.Close;
                  ConexaoBD.SQL_Fornecedores.SQL.Clear;
                  ConexaoBD.SQL_Fornecedores.SQL.Add('Select * From Fornecedores Where fornecedor_numero = ' + Trim(Str_Cod_Prod) );
                  ConexaoBD.SQL_Fornecedores.Open;

                  If ConexaoBD.SQL_Fornecedores.RecordCount > 0 Then
                     Begin
                     ConexaoBD.SQL_Fornecedores.First;

                     Achou_Produto := True;

                     Fornecedores02.lblNumero.Caption          := ConexaoBD.SQL_FornecedoresFornecedor_Numero.Text;
                     Fornecedores02.EditCNPJ.Text              := ConexaoBD.SQL_FornecedoresFornecedor_CNPJ.Text;
                     Fornecedores02.EditInscricaoEstadual.Text := ConexaoBD.SQL_FornecedoresFornecedor_IE.Text;
                     Fornecedores02.EditRazaoSocial.Text       := ConexaoBD.SQL_FornecedoresFornecedor_Razao_Social.Text;
                     Fornecedores02.EditRamoAtividade.Text     := ConexaoBD.SQL_FornecedoresFornecedor_Ramo_Atividade.Text;
                     Fornecedores02.EditNomeFantasia.Text      := ConexaoBD.SQL_FornecedoresFornecedor_Nome_Fantasia.Text;
                     Fornecedores02.EditEndereco.Text          := ConexaoBD.SQL_FornecedoresFornecedor_Endereco.Text;
                     Fornecedores02.EditComplemento.Text       := ConexaoBD.SQL_FornecedoresFornecedor_Complemento.Text;
                     Fornecedores02.EditBairro.Text            := ConexaoBD.SQL_FornecedoresFornecedor_Bairro.Text;
                     Fornecedores02.EditCidade.Text            := ConexaoBD.SQL_FornecedoresFornecedor_Cidade.Text;
                     Fornecedores02.EditCep.Text               := ConexaoBD.SQL_FornecedoresFornecedor_Cep.Text;
                     Fornecedores02.CBEstado.Text              := ConexaoBD.SQL_FornecedoresFornecedor_Estado.Text;
                     Fornecedores02.EditContato.Text           := ConexaoBD.SQL_FornecedoresFornecedor_Contato.Text;
                     Fornecedores02.EditEmail.Text             := ConexaoBD.SQL_FornecedoresFornecedor_Email.Text;
                     Fornecedores02.EditFone_Comercial.Text    := ConexaoBD.SQL_FornecedoresFornecedor_Fone_Comercial.Text;
                     Fornecedores02.EditFone_Celular.Text      := ConexaoBD.SQL_FornecedoresFornecedor_Fone_Celular.Text;
                     Fornecedores02.EditFone_Fax.Text          := ConexaoBD.SQL_FornecedoresFornecedor_Fone_Fax.Text;
                  End;
               End;
         End;
      End;

    End;

    Seta();
End;

Procedure Registro_Vendas(Maquina, Vlr_Vendas, Vlr_Sangria, Vlr_Venda_Diaria: String);

Var
  Comando_SQL: String;

Begin
     If Trim(Maquina) = '' Then
        Begin
        Maquina := Trim(Numero_HD('C'));
     End;

     If Trim(Vlr_Vendas) = '' Then
        Begin
        Vlr_Vendas := '0';
     End;

     If Trim(Vlr_Sangria) = '' Then
        Begin
        Vlr_Sangria := '0';
     End;

     If Trim(Vlr_Venda_Diaria) = '' Then
        Begin
        Vlr_Venda_Diaria := '0';
     End;

     ConexaoBD.SQL_Fechamento_Caixa.Close;
     ConexaoBD.SQL_Fechamento_Caixa.SQL.Clear;
     ConexaoBD.SQL_Fechamento_Caixa.SQL.Add('Select * From Fechamentos_Caixas where Fechamento_Caixa_Maquina = '+#39+ Trim(Maquina) +#39 );
     ConexaoBD.SQL_Fechamento_Caixa.Open;

     If ConexaoBD.SQL_Fechamento_Caixa.RecordCount > 0 Then
        Begin
        Comando_SQL := 'Update Fechamentos_Caixas set ';

        If Trim(Vlr_Vendas) <> '' Then
           Begin
           Comando_SQL := Comando_SQL + 'Fechamento_Caixa_Vlr_Vendas = '+ Virgula_Ponto(Trim(Vlr_Vendas)) + ',';
        End;

        If Trim(Vlr_Sangria) <> '' Then
           Begin
           Comando_SQL := Comando_SQL + 'Fechamento_Caixa_Vlr_Sangria = '+ Virgula_Ponto(Trim(Vlr_Sangria)) + ',';
        End;

        If Trim(Vlr_Venda_Diaria) <> '' Then
           Begin
           Comando_SQL := Comando_SQL + 'Fechamento_Caixa_Vlr_Venda_Diaria = '+ Virgula_Ponto(Trim(Vlr_Venda_Diaria)) + ', ';
        End;

        Comando_SQL := Comando_SQL + 'Fechamento_Caixa_Qtde_Cupons = 0 ';
        Comando_SQL := Comando_SQL + 'Where ';
        Comando_SQL := Comando_SQL + ' Fechamento_Caixa_Maquina = ' + #39 + Trim(Maquina) +#39;
        End
     Else
        Begin
        Comando_SQL := 'Insert into Fechamentos_Caixas(';
        Comando_SQL := Comando_SQL + 'Fechamento_Caixa_Maquina,';
        Comando_SQL := Comando_SQL + 'Fechamento_Caixa_Vlr_Vendas,';
        Comando_SQL := Comando_SQL + 'Fechamento_Caixa_Vlr_Sangria,';
        Comando_SQL := Comando_SQL + 'Fechamento_Caixa_Vlr_Venda_Diaria)';
        Comando_SQL := Comando_SQL + ' Values(';
        Comando_SQL := Comando_SQL + #39 + Trim(Maquina)                   +#39+ ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(Vlr_Vendas))       + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(Vlr_Sangria))      + ',';
        Comando_SQL := Comando_SQL + Virgula_Ponto(Trim(Vlr_Venda_Diaria)) + ')';
     End;

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;

     ConexaoBD.SQL_Fechamento_Caixa.Close;
End;

Procedure Deleta_Registro_Vendas(Maquina: String);

Var
  Comando_SQL: String;

Begin
     Comando_SQL := 'Delete from Fechamentos_Caixas ';
     Comando_SQL := Comando_SQL + 'Where ';
     Comando_SQL := Comando_SQL + ' Fechamento_Caixa_Maquina = ' + #39 + Trim(Maquina) +#39;

     ConexaoBD.SQL_Comunitario.SQL.Clear;
     ConexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
     ConexaoBD.SQL_Comunitario.ExecSQL;
End;

end.

