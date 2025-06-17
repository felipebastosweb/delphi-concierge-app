unit UserData;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat,
  SessionManager, UserEntity;

type
  TUserDataModule = class(TDataModule)
    FDQuery1: TFDQuery;
    FDTableAdapter1: TFDTableAdapter;
  private
    { Private declarations }
  public
    { Public declarations }
    function UserByEmail(Email : String) : TUser;
    function UsernameExists(Username : String) : Boolean;
    function UserRegisteredList : TList<TUser>;
    function UserRegister(Username : String; Password : String; Email : String; Telephone : String) : Boolean;
    function UserLogin(Username : String; Password : String; KeepConnected : Boolean) : TUser;
  end;

var
  UserDataModule1: TUserDataModule;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}
uses System.IOUtils;

function TUserDataModule.UserRegisteredList : TList<TUser>;
var userRegistered : TUser;
begin
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
  {$ENDIF}
  Result := TList<TUser>.Create();
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Text := 'SELECT * FROM Users;';
  FDQuery1.Active := True;

  if not FDQuery1.IsEmpty then
  begin
    while (not FDQuery1.Eof) do begin
      userRegistered := TUser.Create;
      userRegistered.UserId := FDQuery1.FieldByName('UserId').AsInteger;
      userRegistered.Username := FDQuery1.FieldByName('Username').AsString;
      userRegistered.Password := FDQuery1.FieldByName('Password').AsString;
      userRegistered.Email := FDQuery1.FieldByName('Email').AsString;
      userRegistered.Telephone := FDQuery1.FieldByName('Telephone').AsString;
      userRegistered.KeepConnected := FDQuery1.FieldByName('KeepConnected').AsInteger.ToBoolean;
      Result.Add(userRegistered);
      FDQuery1.Next;
    end;
  end;
end;

function TUserDataModule.UsernameExists(Username : String) : Boolean;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Text := 'SELECT * FROM Users WHERE Username = :Username;';
  FDQuery1.ParamByName('Username').AsString := Username;
  FDQuery1.Open;
  Result := not FDQuery1.IsEmpty;
end;

function TUserDataModule.UserByEmail(Email : String) : TUser;
begin
  Result := TUser.Create;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Text := 'SELECT * FROM Users WHERE Email = :Email;';
  FDQuery1.ParamByName('Email').AsString := Email;
  FDQuery1.Active := True;

  if not FDQuery1.IsEmpty then begin
    Result.UserId := FDQuery1.FieldByName('UserId').AsInteger;
    Result.Username := FDQuery1.FieldByName('Username').AsString;
    Result.Password := FDQuery1.FieldByName('Password').AsString;
    Result.Email := FDQuery1.FieldByName('Email').AsString;
    Result.Telephone := FDQuery1.FieldByName('Telephone').AsString;
    Result.KeepConnected := FDQuery1.FieldByName('KeepConnected').AsInteger.ToBoolean;
  end else begin
    Result := Nil;
  end;
end;

function TUserDataModule.UserRegister(Username : String; Password : String; Email : String; Telephone : String) : Boolean;
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('INSERT INTO Users (Username, Password, Email, Telephone, KeepConnected) ');
  FDQuery1.SQL.Add('VALUES (:Username, :Password, :Email, :Telephone, :KeepConnected);');
  FDQuery1.ParamByName('Username').AsString := Username;
  FDQuery1.ParamByName('Password').AsString := Password;
  FDQuery1.ParamByName('Email').AsString := Email;
  FDQuery1.ParamByName('Telephone').AsString := Telephone;
  FDQuery1.ParamByName('KeepConnected').AsInteger := False.ToInteger;
  FDQuery1.Open;
  Result := FDQuery1.RowsAffected > 0;
end;


function TUserDataModule.UserLogin(Username : String; Password : String; KeepConnected : Boolean) : TUser;
begin
  // assign user
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Text := 'SELECT * FROM Users WHERE Username = :Username AND Password = :Password;';
  FDQuery1.ParamByName('Username').AsString := Username;
  FDQuery1.ParamByName('Password').AsString := Password;
  FDQuery1.Active:= True;

  if not FDQuery1.IsEmpty then begin
    Result := TUser.Create;
    Result.UserId := FDQuery1.FieldByName('UserId').AsInteger;
    Result.Username := FDQuery1.FieldByName('Username').AsString;
    Result.Password := FDQuery1.FieldByName('Password').AsString;
    Result.Email := FDQuery1.FieldByName('Email').AsString;
    Result.Telephone := FDQuery1.FieldByName('Telephone').AsString;
    Result.KeepConnected := FDQuery1.FieldByName('KeepConnected').AsInteger.ToBoolean;
    // Update KeepConnected if not equal
    if KeepConnected <> FDQuery1.FieldByName('KeepConnected').AsBoolean then begin
      FDQuery1.SQL.Clear;
      FDQuery1.SQL.Text := 'UPDATE Users SET KeepConnected = :KeepConnected WHERE UserId = :UserId;';
      FDQuery1.ParamByName('UserId').AsInteger := FDQuery1.FieldByName('UserId').AsInteger;
      FDQuery1.ParamByName('KeepConnected').AsBoolean := KeepConnected;
      FDQuery1.Open;
      if FDQuery1.RowsAffected > 0 then begin
        Result.KeepConnected := KeepConnected;
      end;
    end;
    Session.UserLogged := Result;
  end else begin
    Result := Nil;
  end;
end;

end.


