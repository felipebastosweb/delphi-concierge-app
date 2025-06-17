unit Forms.MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Effects, FMX.Ani,
  FMX.ListBox, FMX.Layouts;

type
  TMainForm = class(TForm)
    VertScrollBox1: TVertScrollBox;
    Label3: TLabel;
    Layout1: TLayout;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    Layout2: TLayout;
    RoundRect1: TRoundRect;
    Label1: TLabel;
    GradientAnimation1: TGradientAnimation;
    ShadowEffect1: TShadowEffect;
    RoundRect2: TRoundRect;
    Label2: TLabel;
    GradientAnimation2: TGradientAnimation;
    ShadowEffect2: TShadowEffect;
    Label4: TLabel;
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
