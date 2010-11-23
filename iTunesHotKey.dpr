program iTunesHotKey;

uses
  Forms,
  MainForm in 'MainForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.ShowMainForm := False;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'iTunes HotKey';
  Application.CreateForm(TMainForm, Form1);
  Application.Run;
end.
