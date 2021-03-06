unit Habitat;

interface

uses Classes, SysUtils, SyncObjs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, HABTypes;

type
    THabitatThread = class(TThread)
private
    SSDVPackets: TStringList;
    CritSSDV, CritHabitat: TCriticalSection;
    HabitatSentence: String;
    procedure UploadSentence(Telemetry: String);
    procedure UploadSSDV(Packets: TStringList);
  public
    procedure SaveTelemetryToHabitat(Sentence: String);
    procedure SaveSSDVToHabitat(Line: String);
    // procedure SaveSSDVToHabitat(Packet: String);
    procedure Execute; override;
  published
    constructor Create();
end;

implementation

procedure THabitatThread.SaveTelemetryToHabitat(Sentence: String);
begin
    CritHabitat.Enter;
    try
        HabitatSentence := Sentence;
    finally
        CritHabitat.Leave;
    end;
end;

procedure THabitatThread.SaveSSDVToHabitat(Line: String);
begin
    CritSSDV.Enter;
    try
        SSDVPackets.Add(Line);
    finally
        CritSSDV.Leave;
    end;
end;


procedure THabitatThread.UploadSentence(Telemetry: String);
var
    URL, FormAction, Callsign, Temp: String;
    Params: TStringList;
    IdHTTP1: TIdHTTP;
begin
    URL := 'http://habitat.habhub.org/transition';
    FormAction := 'payload_telemetry';
    Callsign := 'M0RPI';

    // Parameters
    Params := TStringList.Create;
    // Params.Add('Submit=' + FormAction);
    Params.Add('callsign=' + Callsign);
    Params.Add('string=' + Telemetry + #10);
    Params.Add('string_type=ascii');
    Params.Add('metadata={}');
    Params.Add('time_created=');

    // Post it
    IdHTTP1 := TIdHTTP.Create(nil);
    try
        IdHTTP1.Request.ContentType := 'application/x-www-form-urlencoded';
        IdHTTP1.Response.KeepAlive := False;
        Temp := IdHTTP1.Post(URL + '/' + FormAction, Params);
    finally
        IdHTTP1.Free;
    end;

    Params.Free;
end;


procedure THabitatThread.UploadSSDV(Packets: TStringList);
var
    URL, FormAction, Callsign, Temp, json: String;
    JsonToSend: TStringStream;
    i: Integer;
    IdHTTP1: TIdHTTP;
begin
    URL := 'http://ssdv.habhub.org/api/v0';
    FormAction := 'packets';
    Callsign := 'M0RPI';

    // Create json with the base64 data in hex, the tracker callsign and the current timestamp
    json :=
            '{' +
                '"type": "packets",' +
                '"packets":[';

    for i := 0 to Packets.Count-1 do begin
        if i > 0 then json := json + ',';

        json := json +
                     '{' +
                        '"type": "packet",' +
                        '"packet":' + '"' + Packets[i] + '",' +
                        '"encoding": "hex",' +
                        '"received": "' + FormatDateTime('yyyy-mm-dd"T"hh:nn:ss"Z"', Now) + '",' +
                        '"receiver": "' + Callsign + '"' +
                     '}';
    end;

    json := json + ']}';

    // Need the JSON as a stream
    JsonToSend := TStringStream.Create(Json, TEncoding.UTF8);

    // Post it
    try
        IdHTTP1 := TIdHTTP.Create(nil);
        IdHTTP1.Request.ContentType := 'application/json';
        IdHTTP1.Request.ContentEncoding := 'UTF-8';
        IdHTTP1.Response.KeepAlive := False;
        Temp := IdHTTP1.Post(URL + '/' + FormAction, JsonToSend);
    finally
        IdHTTP1.Free;
        JsonToSend.Free;
    end;
    // Params.Free;
end;


procedure THabitatThread.Execute;
var
    Packets: TStringList;
    Sentence: String;
    UploadedSomething: Boolean;
begin
    Packets := TStringList.Create;

    while not Terminated do begin
        UploadedSomething := False;

        // Telemetry
        Sentence := '';
        CritHabitat.Enter;
        try
            if HabitatSentence <> '' then begin
                Sentence := HabitatSentence;
                HabitatSentence := '';
            end;
        finally
            CritHabitat.Leave;
        end;
        if Sentence <> '' then begin
            UploadSentence(Sentence);
            UploadedSomething := True;
        end;

        // SSDV
        Packets.Clear;
        CritSSDV.Enter;
        try
            if SSDVPackets.Count > 0 then begin
                Packets.Assign(SSDVPackets);
                SSDVPackets.Clear;
            end;
        finally
            CritSSDV.Leave;
        end;
        if Packets.Count > 0 then begin
            UploadSSDV(Packets);
            UploadedSomething := True;
        end;

        // So we don't gobble up the CPU
        if not UploadedSomething then begin
            sleep(100);
        end;
    end;
end;

constructor THabitatThread.Create();
begin
    CritHabitat := TCriticalSection.Create;
    CritSSDV := TCriticalSection.Create;
    SSDVPackets := TStringList.Create;

    inherited Create(False);
end;


end.
