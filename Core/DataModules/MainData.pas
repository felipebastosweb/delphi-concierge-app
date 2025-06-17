unit MainData;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TMainDataModule = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    CountriesTable: TFDTable;
    UsersTable: TFDTable;
    CountriesTableId: TAutoIncField;
    CountriesTableName: TStringField;
    CountriesTableCode: TStringField;
    CountriesTableActived: TBooleanField;
    UsersTableId: TAutoIncField;
    UsersTableUsername: TStringField;
    UsersTablePassword: TStringField;
    UsersTableEmail: TStringField;
    UsersTableTelephone: TStringField;
    UsersTableCreated_At: TDateTimeField;
    UsersTableUpdated_At: TDateTimeField;
    ZonesTable: TFDTable;
    AutoIncField1: TAutoIncField;
    StringField1: TStringField;
    StringField2: TStringField;
    ZonesTableCountryId: TReferenceField;
    ZonesTableActived: TBooleanField;
    AddressesTable: TFDTable;
    AddressesTableId: TAutoIncField;
    AddressesTableStreet1: TStringField;
    AddressesTableStreet2: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDConnection1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainDataModule: TMainDataModule;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}
uses System.IOUtils;

procedure TMainDataModule.DataModuleCreate(Sender: TObject);
begin
  FDConnection1.Connected := True;
  FDConnection1.ExecSQL('CREATE TABLE IF NOT EXISTS Users (UserId INTEGER NOT NULL AUTOINCREMENT PRIMARY KEY, Username TEXT UNIQUE NOT NULL, Password TEXT NOT NULL, Email TEXT NULL, Telephone TEXT NULL, DateCreation DATETIME);');

  FDConnection1.ExecSQL('CREATE TABLE IF NOT EXISTS Condominium (CondominiumId INTEGER NOT NULL AUTOINCREMENT PRIMARY KEY, Name TEXT UNIQUE NOT NULL, DateCreation DATETIME);');

  //FDConnection1.ExecSQL('CREATE TABLE IF NOT EXISTS Unit (UnitId INTEGER NOT NULL AUTOINCREMENT PRIMARY KEY, CondominiumId INTEGER NOT NULL, DateCreation DATETIME);');

  //FDConnection1.ExecSQL('CREATE TABLE IF NOT EXISTS AccessControl (AccessId INTEGER NOT NULL AUTOINCREMENT PRIMARY KEY, UnitId INTEGER NOT NULL, DateCreation DATETIME);');
end;

procedure TMainDataModule.FDConnection1BeforeConnect(Sender: TObject);
begin

  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
  FDConnection1.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'database.s3db');
  {$ENDIF}
end;

end.
