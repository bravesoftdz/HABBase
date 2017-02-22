unit HabitatSource;

interface

uses Source;

type
  THabitatSource = class(TSource)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    constructor Create(ID: Integer; Callback: TSourcePositionCallback);
  end;

implementation

constructor THabitatSource.Create(ID: Integer; Callback: TSourcePositionCallback);
begin
    inherited Create(ID, Callback);
end;

end.

