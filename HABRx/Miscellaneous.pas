unit Miscellaneous;

interface

function GetJSONString(Line: String; FieldName: String): String;
function GetJSONInteger(Line: String; FieldName: String): LongInt;
function GetJSONFloat(Line: String; FieldName: String): Double;
function GetString(var Line: String; Delimiter: String=','): String;

implementation

uses SysUtils;

function GetJSONString(Line: String; FieldName: String): String;
var
    Position: Integer;
begin
    // {"class":"POSN","payload":"NOTAFLIGHT","time":"13:01:56","lat":52.01363,"lon":-2.50647,"alt":5507,"rate":7.0}

    Position := Pos('"' + FieldName + '"', Line);

    Line := Copy(Line, Position + Length(FieldName) + 4, 999);
    Position := Pos('"', Line);

    Result := Copy(Line, 1, Position-1);
end;

function GetJSONFloat(Line: String; FieldName: String): Double;
var
    Position: Integer;
begin
    // {"class":"POSN","payload":"NOTAFLIGHT","time":"13:01:56","lat":52.01363,"lon":-2.50647,"alt":5507,"rate":7.0}

    Position := Pos('"' + FieldName + '"', Line);

    Line := Copy(Line, Position + Length(FieldName) + 3, 999);

    Position := Pos(',', Line);
    if Position = 0 then begin
        Position := Pos('}', Line);
    end;

    Line := Copy(Line, 1, Position-1);
    try
        Result := StrToFloat(Line);
    except
        Result := 0;
    end;
end;

function GetJSONInteger(Line: String; FieldName: String): LongInt;
var
    Position: Integer;
begin
    // {"class":"POSN","payload":"NOTAFLIGHT","time":"13:01:56","lat":52.01363,"lon":-2.50647,"alt":5507,"rate":7.0}

    Position := Pos('"' + FieldName + '"', Line);

    Line := Copy(Line, Position + Length(FieldName) + 3, 999);

    Position := Pos(',', Line);
    if Position = 0 then begin
        Position := Pos('}', Line);
    end;

    Line := Copy(Line, 1, Position-1);

    Result := StrToIntDef(Line, 0);
end;

function GetString(var Line: String; Delimiter: String=','): String;
var
    Position: Integer;
begin
    Position := Pos(Delimiter, string(Line));
    if Position > 0 then begin
        Result := Copy(Line, 1, Position-1);
        Line := Copy(Line, Position+Length(Delimiter), Length(Line));
    end else begin
        Result := Line;
        Line := '';
    end;
end;

end.
