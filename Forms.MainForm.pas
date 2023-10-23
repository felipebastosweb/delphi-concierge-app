unit Forms.MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TMainForm = class(TForm)
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
  MainForm: TMainForm;

implementation

{$R *.fmx}

uses MainData, Forms.HomeForm;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  MainDataModule := MainDataModule.Create(Self);
end;

procedure TMainForm.RoundRect1Click(Sender: TObject);
begin
  //if not Assign(FormForm) then

  HomeForm.Show;
  // fazer integração com sistema de ponto automaticamente - HR
end;

end.
