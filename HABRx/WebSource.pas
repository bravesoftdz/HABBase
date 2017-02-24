unit WebSource;

interface

uses Source, Classes, SysUtils,
     IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TWebSource = class(TSource)
  private
    { Private declarations }
  protected
    { Protected declarations }
    function GetURL(URL: String): String;
  public
    { Public declarations }
  published
    constructor Create(ID: Integer; Callback: TSourcePositionCallback; Settings: TSettings);
  end;

implementation

constructor TWebSource.Create(ID: Integer; Callback: TSourcePositionCallback; Settings: TSettings);
begin
    inherited Create(ID, Callback, Settings);
end;

function TWebSource.GetURL(URL: String): String;
var
    responseStream : TMemoryStream;
    html: string;
    HTTP: TIdHTTP;
begin
    try
        try
            responseStream := TMemoryStream.Create;
            HTTP := TIdHTTP.Create(nil);
            // HTTP.OnWork:= HttpWork;
            HTTP.Request.ContentType := 'text/xml; charset=utf-8';
            HTTP.Request.ContentEncoding := 'utf-8';
            HTTP.HTTPOptions := [hoForceEncodeParams];
            // HTTP.Request.CharSet := 'utf-8';
            HTTP.Get(url, responseStream);
            SetString(html, PAnsiChar(responseStream.Memory), responseStream.Size);
            result := html;
        except
            on E: Exception do
                // Global.LogError(E, 'ProcessHttpRequest');
        end;
    finally
        try
            HTTP.Disconnect;
        except
        end;
    end;
end;

end.

