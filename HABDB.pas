unit HABDB;

interface

uses Source, DB, MemDS, VirtualTable;

type
  THABTable = record
      PayloadID:    String;
      Table:        TVirtualTable;
  end;
  THABDB = class
  private
    { Private declarations }
    HABTables: Array of THABTable;
    function AddTable(PayloadID: String): TVirtualTable;
    function GetTableForPayload(PayloadID: String): TVirtualTable;
  protected
    { Protected declarations }
  public
    { Public declarations }
    function AddPosition(Position: THABPosition): Integer;
  published
    // constructor Create(FileNamePrefix: String);
  end;

implementation

//constructor TSource.Create(ID: Integer; Callback: TSourcePositionCallback);
//begin
//    SentenceCount := 0;
//    SourceID := ID;
//    PositionCallback := Callback;
//    Enabled := True;
//end;

function THABDB.AddTable(PayloadID: String): TVirtualTable;
var
    Table: TVirtualTable;
begin
    SetLength(HABTables, High(HABTables)+2);

    HABTables[High(HABTables)].PayloadID := PayloadID;
    Table := TVirtualTable.Create(nil);
    HABTables[High(HABTables)].Table := Table;

    Table.AddField('Counter',   ftInteger,  0, False);
    Table.AddField('TimeStamp', ftDateTime, 0, False);
    Table.AddField('Latitude',  ftFloat,    0, False);
    Table.AddField('Longitude', ftFloat,    0, False);
    Table.AddField('Altitude',  ftFloat,    0, False);

    Table.Open;

    Result := HABTables[High(HABTables)].Table
end;

function THABDB.GetTableForPayload(PayloadID: String): TVirtualTable;
var
    i: Integer;
begin
    for i := Low(HABTables) to High(HABTables) do begin
        if HABTables[i].PayloadID = PayloadID then begin
            Result := HABTables[i].Table;
            exit;
        end;
    end;

    Result := AddTable(PayloadID);
end;

function THABDB.AddPosition(Position: THABPosition): Integer;
var
    Table: TVirtualTable;
begin
    Table := GetTableForPayload(Position.PayloadID);
    with Table, Position do begin
        Append;
        FieldByName('Counter').AsInteger := Counter;
        FieldByName('TimeStamp').AsDateTime := TimeStamp;
        FieldByName('Latitude').AsFloat := Latitude;
        FieldByName('Longitude').AsFloat := Longitude;
        FieldByName('Altitude').AsFloat := Altitude;
        Post;
        Result := RecordCount;
    end;
end;

end.