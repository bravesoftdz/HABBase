unit GatewaySource;

interface

uses Source, SysUtils, Extctrls, Windows, OverbyteIcsWndControl, OverbyteIcsWSocket;

type
  TGatewaySource = class(TSource)
  private
    { Private declarations }
    Socket: TWSocket;
    Timer: TTimer;
    Host: String;
    Port: Integer;
    PortNumber: Integer;
    Line: AnsiString;
    PreviousLines: Array[0..1] of String;
    procedure SocketSessionConnected(Sender: TObject; ErrCode: Word);
    procedure SocketDataAvailable(Sender: TObject; ErrCode: Word);
    procedure SocketError(Sender: TObject);
    procedure SocketSessionClosed(Sender: TObject; ErrCode: Word);
    procedure Reconnect(Sender: TObject);
    procedure ConnectSocket;
    function ProcessJSON(Line: String; var Channel: Integer): THABPosition;
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    constructor Create(ID: Integer; Callback: TSourcePositionCallback);
  end;

implementation

uses Miscellaneous;

constructor TGatewaySource.Create(ID: Integer; Callback: TSourcePositionCallback);   // Callback: TSourcePositionCallback);
begin
    inherited Create(ID, Callback);

    Socket := TWSocket.Create(nil);
    with Socket do begin
        OnSessionConnected := SocketSessionConnected;
        OnDataAvailable := SocketDataAvailable;
        OnSessionClosed := SocketSessionClosed;
        OnError := SocketError;
    end;

    Timer := TTimer.Create(nil);
    with Timer do begin
        Interval := 1000;
        OnTimer := Reconnect;
        Enabled := True;
    end;

    Host := 'LoRaGW5';
    Port := 6004;
end;

procedure TGatewaySource.Reconnect(Sender: TObject);
begin
    TTimer(Sender).Enabled := False;
    ConnectSocket;
end;

procedure TGatewaySource.ConnectSocket;
begin
    Socket.Addr := Host;
    Socket.Port := IntToStr(Port);
    Socket.Connect;
end;

procedure TGatewaySource.SocketSessionConnected(Sender: TObject; ErrCode: Word);
begin
    // Reconnect := False;
end;

procedure TGatewaySource.SocketError(Sender: TObject);
begin
    Timer.Enabled := True;
end;

procedure TGatewaySource.SocketSessionClosed(Sender: TObject; ErrCode: Word);
begin
    Timer.Enabled := True;
end;


procedure TGatewaySource.SocketDataAvailable(Sender: TObject; ErrCode: Word);
var
    i, Count, Channel: Integer;
    Rcvd: array[0..8191] of BYTE;
    Position: THABPosition;
begin
// {"class":"POSN","payload":"NOTAFLIGHT","time":"13:01:56","lat":52.01363,"lon":-2.50647,"alt":5507,"rate":7.0}
    with Sender as TWSocket do begin
        Count := Receive(@Rcvd[0], High(Rcvd));
        for i := 0 to Count-1 do begin
            case Rcvd[i]of
                Ord('{'): begin
                    Line := '';
                    // UpdateSourceFormSentence(Tag);
                end;

                10: begin
                    if Pos('"POSN"', Line) > 0 then begin
                        if Enabled then begin
                            Position := ProcessJSON(Line, Channel);
                            if Line <> PreviousLines[Channel] then begin
                                PreviousLines[Channel] := Line;
                                PositionCallback(SourceID, Channel, Line, Position);
                            end;
                        end;
                    end;
                    Line := '';
                end;

                else begin
                    Line := Line + Char(Rcvd[i]);
//                    UpdateSourceFormSentence(Tag);
                end;
            end;
        end;
    end;
end;

function TGatewaySource.ProcessJSON(Line: String; var Channel: Integer): THABPosition;
var
    PayloadIndex: Integer;
    TimeStamp: String;
    lat, lon, alt: Double;
    OK: Boolean;
    NewTime: TDateTime;
    Position: THABPosition;
begin
    ZeroMemory(@Position, sizeof(Position));

    // {"class":"POSN","payload":"NOTAFLIGHT","time":"13:01:56","lat":52.01363,"lon":-2.50647,"alt":5507,"rate":7.0}

    try
        Channel := GetJSONInteger(Line, 'channel');
        Position.PayloadID := GetJSONString(Line, 'payload');

        TimeStamp := GetJSONString(Line, 'time');
        if Length(TimeStamp) = 8 then begin
            Position.TimeStamp := EncodeTime(StrToIntDef(Copy(TimeStamp, 1, 2), 0),
                                             StrToIntDef(Copy(TimeStamp, 4, 2), 0),
                                             StrToIntDef(Copy(TimeStamp, 7, 2), 0),
                                             0);
        end;
        Position.Latitude := GetJSONFloat(Line, 'lat');
        Position.Longitude := GetJSONFloat(Line, 'lon');
        Position.Altitude := GetJSONFloat(Line, 'alt');
//        Position.PredictedLatitude := GetJSONFloat(Line, 'predlat');
//        Position.PredictedLongitude := GetJSONFloat(Line, 'predlon');

//        Position.Speed := GetJSONInteger(Line, 'speed');
//        Position.Heading := GetJSONInteger(Line, 'head');
//        Position.PredictedTime := GetJSONInteger(Line, 'pt');
//        Position.CompassActual := GetJSONInteger(Line, 'ca');
//        Position.CompassTarget := GetJSONInteger(Line, 'ct');
//        Position.AirDirection := GetJSONInteger(Line, 'ad');
//        Position.ServoLeft := GetJSONInteger(Line, 'sl');
//        Position.ServoRight := GetJSONInteger(Line, 'sr');
//        Position.ServoTime := GetJSONInteger(Line, 'st');
//        Position.FlightMode := GetJSONInteger(Line, 'fm');

//        Position.cda := GetJSONFloat(Line, 'cda');
//        Position.PredictedLandingSpeed := GetJSONFloat(Line, 'pls');
//        Position.AirSpeed := GetJSONFloat(Line, 'as');
//        Position.GlideRatio := GetJSONFloat(Line, 'gr');
    except
    end;

//    if PreviousTime > 0 then begin
//        if (Position.Time - PreviousTime) > 0 then begin
//            Position.Rate := (Position.Altitude - PreviousAltitude) / (86400 * (Position.Time - PreviousTime));
//        end;
//    end;

//    PreviousAltitude := Position.Altitude;

    Inc(SentenceCount);

    Result := Position
end;


end.

