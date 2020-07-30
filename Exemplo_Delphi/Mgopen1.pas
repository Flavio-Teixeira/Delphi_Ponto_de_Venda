/////////////////////////////////////////////////////////
//      MENNO EQUIPAMENTOS PARA ESCRITORIO LTDA        //
/////////////////////////////////////////////////////////
// Código-fonte em Linguagem Delphi Object Pascal      //
// Objetivo: Demonstração de utilização das funções    //
//           da DLL ghdl32.dll que é responsável pelo  //
//           acionamento da GAVETA MENNO               //
//                                                     //
// Ultima revisão:  05/12/02                           //
// Observações: A DLL ghdl32.dll e libserial.dll devem //
//              estar no mesmo diretório do executável //
//              ou nos seguintes diretórios            //
//              \Windows  ou \Windows\system           //
//              \WinNT    ou \WinNT\system             //
////////////////////////////////////////////////////////'
//     Este codigo-fonte pode ser copiado livremente   //
//     e incorporado a softwares que utilizem as       //
//     GAVETAS MENNO MGI                               //
////////////////////////////////////////////////////////'

unit Mgopen1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,Ghdl32, Gauges;

type
  TForm1 = class(TForm)
    RadioGroup1: TRadioGroup;
    Button3: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Timer1: TTimer;
    Label8: TLabel;
    GroupBox_Funcao: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Gauge2: TGauge;
    Gauge1: TGauge;
    Label2: TLabel;
    Label7: TLabel;
    Image_Logo: TImage;
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Serial  : Integer;
  FUNCAO  : Integer;

Implementation

Function GavetaConfigura (pulso,min : Integer): Integer; stdcall; external 'Ghdl32.dll';
Function DriverGaveta (p,f : Integer) :Integer; stdcall; external 'Ghdl32.dll';

{$R *.DFM}

Procedure TForm1.RadioGroup1Click(Sender: TObject);
Var
    p1,m1: Integer;
Begin
    Serial := radiogroup1.itemindex + 1;
    DriverGaveta (Serial, Gaveta_Inicializa);
    p1:=150;
    m1:=3500;
    GavetaConfigura (p1,m1 );
    timer1.enabled := True;
End;

Procedure TForm1.Button3Click(Sender: TObject);
Begin
    Application.Terminate;
End;

Procedure TForm1.Button1Click(Sender: TObject);
Var
    x: Integer;
Begin
    Button1.Enabled := False;
    DriverGaveta (Serial,Gaveta_Abre);
    Button1.Enabled := True;
End;

Procedure TForm1.Timer1Timer(Sender: TObject);
Var
    FUNCAO : Integer;
Begin
    FUNCAO := DriverGaveta(Serial, GAVETA_ESTADO);
    If FUNCAO = GAVETA_FECHADA Then
      Label4.Caption := ' FECHADA '
    Else
      Label4.Caption := ' ABERTA ';
End;

Procedure TForm1.Button2Click(Sender: TObject);
Var
    Quantidade : Integer;
    x          : Integer;
    Aberturas  : Integer;
Begin
    gauge1.progress := 0;
    gauge2.progress := 0;
    Quantidade      := 0;
    Aberturas       := 0;

    Timer1.Enabled  := False;
    Button1.Enabled := False;
    Button2.Enabled := False;
    Button3.Enabled := False;
    Button4.Enabled := False;

    While Quantidade < 100 do
      Begin

        Inc(Quantidade);
        FUNCAO := DriverGaveta (Serial,Gaveta_Abre);

        If FUNCAO < 0 then
          Begin
            gauge2.Progress := gauge2.Progress +1;
        End;

        x := 0;
        While x < 20000000 do
          Begin
              Inc(x);
        End;

        FUNCAO := DriverGaveta (Serial, Gaveta_Estado);

        If FUNCAO = 1 then
          Begin
            Inc(Aberturas);
            gauge1.Progress := gauge1.Progress +1;
        End;
    End;

    Timer1.Enabled  := True;
    Button1.Enabled := True;
    Button2.Enabled := True;
    Button3.Enabled := True;
    Button4.Enabled := True;
End;

Procedure TForm1.FormCreate(Sender: TObject);
Begin
    DriverGaveta (Serial, Gaveta_Inicializa);
End;

Procedure TForm1.Button4Click(Sender: TObject);
Begin
    FUNCAO := DriverGaveta (Serial, Gaveta_Estado);
    If FUNCAO = 2 Then
      label4.Caption := ' ABERTA '
    Else
      label4.Caption := ' FECHADA ';
End;
End.
