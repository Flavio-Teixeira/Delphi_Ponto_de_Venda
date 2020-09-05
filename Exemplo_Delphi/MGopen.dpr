program MGopen;

uses
  Forms,
  Mgopen1 in 'Mgopen1.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'MGOPEN';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
