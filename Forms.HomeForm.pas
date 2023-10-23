unit Forms.HomeForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  THomeForm = class(TForm)
    Rectangle1: TRectangle;
    Label1: TLabel;
    ListView1: TListView;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HomeForm: THomeForm;

implementation

{$R *.fmx}

procedure THomeForm.FormCreate(Sender: TObject);
begin
  //
end;

procedure THomeForm.FormShow(Sender: TObject);
begin
  //
end;

end.
