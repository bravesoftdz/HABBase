unit Source;

interface

type
  THABPosition = record
    PayloadID:  String;
    Counter:    Integer;
    TimeStamp:  TDateTime;
    Latitude:   Double;
    Longitude:  Double;
    Altitude:   Double;
  end;

type
  TSourcePositionCallback = procedure(ID, Channel: Integer; Line: String; Position: THABPosition) of object;

type
  TSource = class
  private
    { Private declarations }
  protected
    { Protected declarations }
    SourceID: Integer;
    SentenceCount: Integer;
  public
    { Public declarations }
    PositionCallback: TSourcePositionCallback;
    Enabled: Boolean;
    procedure Enable; virtual;
    procedure Disable; virtual;
  published
    constructor Create(ID: Integer; Callback: TSourcePositionCallback);
  end;

implementation

constructor TSource.Create(ID: Integer; Callback: TSourcePositionCallback);
begin
    SentenceCount := 0;
    SourceID := ID;
    PositionCallback := Callback;
    Enabled := True;
end;

procedure TSource.Enable;
begin
    Enabled := True;
end;

procedure TSource.Disable;
begin
    Enabled := False;
end;

end.
