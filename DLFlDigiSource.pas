unit DLFlDigiSource;

interface

uses Source;

type
  TDLFlDigiSource = class(TSource)
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

constructor TDLFlDigiSource.Create(ID: Integer; Callback: TSourcePositionCallback);   // Callback: TSourcePositionCallback);
begin
    inherited Create(ID, Callback);
end;

end.

