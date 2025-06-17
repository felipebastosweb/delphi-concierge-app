unit MainPage;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TMainPage = class(TForm)
    RoundRect1: TRoundRect;
    Label1: TLabel;
    procedure RoundRect1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainPage1: TMainPage;

implementation

{$R *.fmx}

uses MainData, HomePage;

procedure TMainPage.FormCreate(Sender: TObject);
begin
  MainDataModule := MainDataModule.Create(Self);
end;

procedure TMainPage.RoundRect1Click(Sender: TObject);
begin
  //if not Assign(FormForm) then

  HomePage1.Show;
  // fazer integra��o com sistema de ponto automaticamente - HR
end;

end.
