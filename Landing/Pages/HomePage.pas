unit HomePage;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Header, FMX.ListBox, FMX.Layouts,
  FMX.Controls.Presentation,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.Objects;

type
  THomePage = class(TForm)
    HeaderSection: TLayout;
    VertScrollBox1: TVertScrollBox;
    OrganizationLayout: TLayout;
    ComboBox1: TComboBox;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Button2: TButton;
    procedure ListBoxItem1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HomePage1: THomePage;

implementation

{$R *.fmx}

procedure THomePage.ListBoxItem1Click(Sender: TObject);
begin
  // TODO: Save UserLogged in SessionManager
end;

end.

