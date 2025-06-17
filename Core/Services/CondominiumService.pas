unit CondominiumService;

interface

uses System.SysUtils, System.Classes, UserEntity;

type

TCondominiumService = class
  private
    FAuthor: TUser;
  public
    constructor Create;
    destructor Destroy; override;
    property Author: TUser read FAuthor write FAuthor;
  end;

var
  condominiumService: TCondominiumService;

implementation

constructor TCondominiumService.Create;
begin
  FAuthor := nil; // Inicializa o usuário logado como nulo
end;

destructor TCondominiumService.Destroy;
begin
  if Assigned(FAuthor) then
    FreeAndNil(FAuthor);
  inherited;
end;


initialization
  condominiumService := TCondominiumService.Create;

finalization
  FreeAndNil(condominiumService);

end.
