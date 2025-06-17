program ConciergeApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  LoginForm in 'Landing\Pages\LoginForm.pas' {LoginForm1},
  SessionManager in 'Core\Services\SessionManager.pas',
  AddressEntity in 'Core\Entities\AddressEntity.pas',
  PersonEntity in 'Core\Entities\PersonEntity.pas',
  UserEntity in 'Core\Entities\UserEntity.pas',
  HomePage in 'Landing\Pages\HomePage.pas' {HomePage1},
  RegisterForm in 'Landing\Pages\RegisterForm.pas' {RegisterForm1},
  RescueAccountPage in 'Landing\Pages\RescueAccountPage.pas' {RescueAccountPage1},
  MainPage in 'Landing\Pages\MainPage.pas' {MainPage},
  MainData in 'Core\DataModules\MainData.pas' {MainDataModule: TDataModule},
  CondominiumService in 'Core\Services\CondominiumService.pas',
  IncidentData in 'Core\DataModules\IncidentData.pas' {IncidentDataModule1: TDataModule},
  UserData in 'Core\DataModules\UserData.pas' {UserDataModule: TDataModule};

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TMainPage1, MainPage1);
  Application.CreateForm(TLoginForm1, LoginForm1);
  Application.CreateForm(TRegisterForm1, RegisterForm1);
  Application.CreateForm(THomePage1, HomePage1);
  Application.CreateForm(TRegisterForm1, RegisterForm1);
  Application.CreateForm(TRescueAccountPage1, RescueAccountPage1);
  Application.CreateForm(TMainDataModule, MainDataModule);
  Application.CreateForm(TIncidentDataModule1, IncidentDataModule1);
  Application.Run;
end.
