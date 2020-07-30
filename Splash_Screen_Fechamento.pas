unit Splash_Screen_Fechamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TSplashScreenFechamento = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    LBL_Registro_Status: TLabel;
    LBL_Registro: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplashScreenFechamento: TSplashScreenFechamento;

implementation

{$R *.dfm}

end.
