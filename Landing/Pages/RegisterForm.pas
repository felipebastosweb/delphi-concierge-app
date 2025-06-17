unit RegisterForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Objects, FMX.Edit,
  FMX.Effects;

type
  TRegisterForm1 = class(TForm)
    Rectangle2: TRectangle;
    Label1: TLabel;
    RoundRect1: TRoundRect;
    Label2: TLabel;
    CompanyNameBox: TRectangle;
    UsernameEdit1: TEdit;
    CompanyNameLabel: TLabel;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    EmailEdit1: TEdit;
    Label5: TLabel;
    Rectangle5: TRectangle;
    RepeatPasswordEdit1: TEdit;
    Label6: TLabel;
    Rectangle6: TRectangle;
    PasswordEdit1: TEdit;
    Label7: TLabel;
    CheckBox1: TCheckBox;
    Rectangle7: TRectangle;
    TelephoneEdit1: TEdit;
    Label4: TLabel;
    Label8: TLabel;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    ShadowEffect3: TShadowEffect;
    ShadowEffect4: TShadowEffect;
    ShadowEffect5: TShadowEffect;
    ShadowEffect6: TShadowEffect;
    procedure RoundRect1Click(Sender: TObject);
    procedure EmailEdit1Validate(Sender: TObject; var Text: string);
    procedure PasswordEdit1Validate(Sender: TObject; var Text: string);
    procedure RepeatPasswordEdit1Validate(Sender: TObject; var Text: string);
    procedure UsernameEdit1Validate(Sender: TObject; var Text: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegisterForm1: TRegisterForm1;

implementation

{$R *.fmx}

uses HomeForm, UserValidations, UserDataModule;

{
User Story
Como Visitante desejo informar meus dados cadastrais para poder utilizar o aplicativo.

Critérios de Aceitação:

}


procedure TRegisterForm1.EmailEdit1Validate(Sender: TObject; var Text: string);
begin
  // Expressão regular para validar um email
  if not TUserValidation.IsEmailValid(Text) then
    ShowMessage('Invalid email address.');

end;

procedure TRegisterForm1.PasswordEdit1Validate(Sender: TObject;
  var Text: string);
begin
  // Expressão regular para validar a senha
  if not TUserValidation.IsPasswordValid(Text) then
    ShowMessage('Invalid password.');
end;

procedure TRegisterForm1.RepeatPasswordEdit1Validate(Sender: TObject;
  var Text: string);
begin
  // Expressão regular para validar um email
  if not TUserValidation.IsRepeatPasswordValid(Text, PasswordEdit1.Text) then
    ShowMessage('RepeatPassword not equals to Password value.');
end;

procedure TRegisterForm1.RoundRect1Click(Sender: TObject);
begin
  HomeForm1.Show;
end;

procedure TRegisterForm1.UsernameEdit1Validate(Sender: TObject;
  var Text: string);
begin
  // Expressão regular para validar um email
  if not TUserValidation.IsUsernameValid(Text) then
    ShowMessage('Invalid username.');
end;

end.
