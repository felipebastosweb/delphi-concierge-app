unit AddressEntity;

interface

type TCountry = class
  CountryId : Integer;
  Name : String;
  Code : String;
end;

type TZone = class
  ZoneId : Integer;
  Name : String;
  Code : String;
  CountryId : Integer;
end;

type TAddress = class
  AddressId : Integer;
  Address : String;
  Address2 : String;
  ZipCode : String;
  Observation : String;
  ZoneId : Integer;
end;

implementation

end.
