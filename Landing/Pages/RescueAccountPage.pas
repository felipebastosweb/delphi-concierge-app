unit RescueAccountPage;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  FMX.Layouts,
  UserEntity, FMX.Effects, FMX.Objects;

type
  TRescueAccountPage1 = class(TForm)
    IdSMTP1: TIdSMTP;
    Layout1: TLayout;
    Label2: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    EmailEdit: TEdit;
    Button1: TButton;
    Button2: TButton;
    RoundRect1: TRoundRect;
    Label3: TLabel;
    ShadowEffect1: TShadowEffect;
    procedure Button2Click(Sender: TObject);
    procedure RoundRect1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RescueAccountPage1: TRescueAccountPage1;

implementation

{$R *.fmx}

uses UserData;


procedure TRescueAccountPage1.Button2Click(Sender: TObject);
begin
    self.Close;
end;

procedure TRescueAccountPage1.RoundRect1Click(Sender: TObject);
begin

    var userFinded : TUser := UserDataModule1.UserByEmail(EmailEdit.Text);
    if userFinded.Email = EmailEdit.Text then begin
      // TODO: Send email to user
      ShowMessage('Verify the instructions of account recovery in your e-mail account.');
      self.Close;
    end else begin
      ShowMessage('E-mail not found.');
    end;
end;

end.
