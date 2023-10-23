program ConciergeApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  Forms.MainForm in 'Forms.MainForm.pas' {MainForm},
  Forms.HomeForm in 'Forms.HomeForm.pas' {HomeForm},
  MainData in 'DataModules\MainData.pas' {MainDataModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(THomeForm, HomeForm);
  Application.Run;
end.
