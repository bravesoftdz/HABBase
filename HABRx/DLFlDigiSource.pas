unit DLFlDigiSource;

interface

uses SocketSource, Source, Habitat, HABDB, HABTypes;

type
  TDLFlDigiSource = class(TSocketSource)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    constructor Create(ID: Integer; Callback: TSourcePositionCallback; Settings: TSettings; Database: THABDB; Habitat: THabitatThread);
  end;

implementation

constructor TDLFlDigiSource.Create(ID: Integer; Callback: TSourcePositionCallback; Settings: TSettings; Database: THABDB; Habitat: THabitatThread);
begin
    inherited Create(ID, Callback, Settings, Database, Habitat);
end;

end.

