unit LoginForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Objects, FMX.Ani,
  FMX.Edit, FMX.Effects;

type
  TLoginForm1 = class(TForm)
    Rectangle2: TRectangle;
    Label2: TLabel;
    ConfirmButton: TRoundRect;
    Label4: TLabel;
    CompanyNameBox: TRectangle;
    UsernameEdit: TEdit;
    CompanyNameLabel: TLabel;
    Rectangle3: TRectangle;
    CheckBox1: TCheckBox;
    Rectangle6: TRectangle;
    PasswordEdit: TEdit;
    Label7: TLabel;
    Label1: TLabel;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    ShadowEffect3: TShadowEffect;
    procedure ConfirmButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginForm1: TLoginForm1;

implementation

{$R *.fmx}

uses HomePage, UserData;

procedure TLoginForm1.ConfirmButtonClick(Sender: TObject);
begin
  var userLogged := UserDataModule1.UserLogin(UsernameEdit.Text, PasswordEdit.Text);
  if userLogged then
    begin
      HomeForm1.Show;
    end;
end;

end.
