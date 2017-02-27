unit HABTypes;

interface

uses Classes, Generics.Collections;

type
  TSettings = TDictionary<String, Variant>;

type
  TExtraFields = TDictionary<String, Variant>;

type
  TSignalValues = TDictionary<String, Variant>;

type
  THABPosition = record
    InUse:          Boolean;
    Channel:        Integer;
    PayloadID:      String;
    Counter:        Integer;
    TimeStamp:      TDateTime;
    Latitude:       Double;
    Longitude:      Double;
    Altitude:       Double;
    SignalValues:   TSignalValues;
    ExtraFields:    TExtraFields;
    SSDVPacket:     String;
  end;

type
  TSourcePositionCallback = procedure(ID: Integer; Connected: Boolean; Line: String; Position: THABPosition) of object;

implementation

end.
