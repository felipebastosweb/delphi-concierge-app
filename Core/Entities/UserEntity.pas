unit UserEntity;

interface

type TUser = class
  UserId : Integer;
  Username : String;
  Password : String;
  Email : String;
  Telephone : String;
  KeepConnected : Boolean;
  CreationDate : TDateTime;
end;


type TProfile = class
    ProfileId : Integer;
    UserId : Integer;
    CompleteName : String;
    AboutMe : String;
    Address : String;
    Email : String;
    Telephone : String;
  end;

implementation

end.
