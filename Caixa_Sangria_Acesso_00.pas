unit Caixa_Sangria_Acesso_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TCaixa_Sangria_Acesso00 = class(TForm)
    Panel_Botoes: TPanel;
    BT_Sair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Caixa_Sangria_Acesso00: TCaixa_Sangria_Acesso00;

implementation

uses Caixa_Sangria_00, Caixa_Sangria_02;

{$R *.dfm}

procedure TCaixa_Sangria_Acesso00.BitBtn1Click(Sender: TObject);
begin
    Application.CreateForm(TCaixa_Sangria00,Caixa_Sangria00);
    Caixa_Sangria00.ShowModal;
    Caixa_Sangria00.Destroy;
    Caixa_Sangria_Acesso00.Close;
end;

procedure TCaixa_Sangria_Acesso00.BitBtn2Click(Sender: TObject);
begin
    Application.CreateForm(TCaixa_Sangria02,Caixa_Sangria02);
    Caixa_Sangria02.ShowModal;
    Caixa_Sangria02.Destroy;
    Caixa_Sangria_Acesso00.Close;
end;

procedure TCaixa_Sangria_Acesso00.BT_SairClick(Sender: TObject);
begin
    Caixa_Sangria_Acesso00.Close;
end;

procedure TCaixa_Sangria_Acesso00.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #27 Then Caixa_Sangria_Acesso00.Close;
end;

end.
