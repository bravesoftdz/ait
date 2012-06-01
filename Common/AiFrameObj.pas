﻿{**
@Abstract(Базовые типы для AI)
@Author(Prof1983 prof1983@ya.ru)
@Created(26.04.2006)
@LastMod(25.05.2012)
@Version(0.5)

Prototype: org.framerd.OID
Каждый фрейм является некоторой сущностью.
}
unit AiFrameObj;

interface

uses
  SysUtils,
  ABase, ABaseUtils2, AConfigObj, ALogObj, ATypes, AXmlObj,
  AiBase, AiBaseTypes, AiConnectsObj, AiDataObj, AiTypes;

type
  AUInt64 = Int64;

type
    // Recovered
  TAiSlot2004 = class
  public
    function GetAsString(): string;
    function GetAsUInt32(): AUInt32;
    function GetAsUInt64(): AUInt64;
    function GetValeAsHandle(): AInt32;
    function GetValueAsString(): APascalString;
    procedure SetAsString(const Value: string);
    procedure SetAsUInt32(Value: AUInt32);
    procedure SetAsUInt64(Value: AUInt64);
    procedure SetValueAsString(const Value: APascalString);
  public
    property AsString: string read GetAsString write SetAsString;
    property AsUInt032: AUInt32 read GetAsUInt32 write SetAsUInt32;
    property AsUInt064: AUInt64 read GetAsUInt64 write SetAsUInt64;
    property ValueAsHandle: AInt32 read GetValeAsHandle;
    property ValueAsString: APascalString read GetValueAsString write SetValueAsString;
  end;

type //** Фрейм
  TAiFrameObject = class
  protected
      //** Идентификатор (см. TProfEntity)
    FId: TAId;
      //** True, если инициализирован
    FInitialized: Boolean;
  protected
      //** Класс конфигураций (deprecated)
    FConfig: TConfig;
      //** Связи - объект источника. Если источника нет - локальный объект (deprecated)
    FConnects: TAiConnectsObject;
      //** Данные - объект источника. Если источника нет - локальный объект
    FData: TAiDataObject;
      //** Дата создания
    FDateCreate: TDateTime; //FDateTimeCreate: TDateTime;
      //** Дата изменения
    FDateModify: TDateTime;
      //** Тип фрейма
    FFreimType: TAId; //FType: TAI_Id;
      //** Класс логирования (deprecated)
    FLog: TLog;
      //** Функция добавления в log (deprecated)
    FOnAddToLog: TAddToLog;
      //** Путь расположения программы (deprecated)
    FPath: String;
      //** Префикс для конфигураций и логирования (deprecated)
    FPrefix: String;
      //** Пул (Источник)
    //FPool: IAIFramePool;
      //** Источник
    FSource: AiSource2005;
      //** Версия фрейма
    FVersion: TAiVersion;
  protected
    //** Возвращает объект работы с данными
    function Get_Data(): TAiDataObject; virtual; safecall;
    //** Возвращает дату создания
    function Get_DateTimeCreate(): TDateTime; safecall;
    //** Возвращает ID фрейма
    function Get_FrameID(): TAId; safecall;
    //** Возвращает имя фрейма
    function Get_FrameName(): WideString; safecall;
    //** Возвращает тип фрейма
    function Get_FrameType(): TAId; safecall;
    function Get_IsReadOnly(): WordBool; safecall;
    //** Возвращает источник
    //function Get_Pool(): IAIFramePool; safecall;
    {**
      Зачитывает из пула данные фрейма.

    }
    //function GetValue(): IAiValue; safecall;
    //** Установыть дату создания
    procedure Set_DateTimeCreate(Value: TDateTime); safecall;
    //** Установить Id. Если не инициализирован.
    procedure Set_FrameID(Value: TAId); safecall;
    //** Установить тип
    procedure Set_FrameType(Value: TAId); safecall;
    //** Установить источник. Только если не инициализирован.
    //procedure Set_Pool(const Value: IAIFramePool); safecall;
    {**
      Заменяет значение ассоциируемого с фреймом



  public // IAIFrame
    function Get_Connects(): TAiConnectsObject;
    //function Get_Source(): IAISource2; safecall;
  public // IProfObject
    //function GetConfig(): IProfNode; safecall;
  protected
      //** Срабатывает при создании
    procedure DoCreate(); virtual;
  public
      //** Очистить объект
    function Clear(): WordBool; virtual;
      //** Финализировать. Разорвать связь объекта с источником.
    function Finalize(): TProfError; virtual;
      //** Free
    procedure Free(); virtual;
      //** Возвращает класс работы со связями
    function GetConnects(): TAiConnectsObject;
      //** Возвращает класс работы с данными
    function GetData(): TAiDataObject;
      //** Возвращает дату создания
    function GetDateTimeCreate(): TDateTime;
      //** Возвращает тип фрейма
    function GetFreimType(): TAId;
      //** Инициализирован?
    function GetInitialized(): Boolean;
      //** Возвращает источник
    function GetSource(): AiSource2005;
      //** Возвращает фрейм в виде XML строки
    function GetXml(): WideString; virtual;
      //** Произвести инициализацию. Установить связь с источником.
    function Initialize(): TProfError; virtual;
    {**
      Load from source
      Загрузить из источника
    }
    function Load(): TProfError; virtual;
      //** Загрузить из AIData
    function LoadFromData(Data: TAiDataObject): TAiError; virtual;
      //** Загрузить из файла
    function LoadFromFile(const AFileName: WideString): TProfError; virtual;
      //** Зарегистрировать тип фрейма в источнике
    function Regist(): Boolean; virtual;
    {**
      Save to source
      Сохранить в источник
    }
    function Save(): TProfError; virtual;
      //** Сохранить в файл
    function SaveToFile(const AFileName: WideString): WordBool; virtual;
      //** Сохранить список связей в XML
    //function SaveToXml(Xml: IXmlNode): WordBool; virtual;
      //** Задать дату и время создания фрейма
    procedure SetDateTimeCreate(Value: TDateTime);
      //** Установить тип
    procedure SetFreimType(Value: TAId);
      //** Задаем фрейм в виде XML строки
    procedure SetXml(Value: WideString);
  public
    constructor Create(Source: AiSource2005 = 0; Id: TAI_Id = 0);
  public
    property Connects: TAiConnectsObject read GetConnects;
      //** Данные
    property Data: TAiDataObject read GetData;
      //** Дата и время создания фрейма
    property DateCreate: TDateTime read GetDateTimeCreate write SetDateTimeCreate;
      //** Дата и время изменения фрейма
    property DateModify: TDateTime read FDateModify write FDateModify;
      //** ID фрейма
    property FrameID: TAId read Get_FrameID write Set_FrameID;
      //** Тип фрейма
    property FrameType: TAId read Get_FrameType write Set_FrameType;
      //** ID фрейма
    property FreimId: TAId read FId write FId;
      //** Тип фрейма
    property FreimType: TAI_ID read GetFreimType write SetFreimType;
      //** ID фрейма
    property Id: TAId read Get_FrameID write Set_FrameID;
    //property ID: TAI_ID read FID write FID;
      //** Только для чтения?
    property IsReadOnly: WordBool read Get_IsReadOnly;
      //** Функция добавления в log (deprecated)
    property OnAddToLog: TAddToLog read FOnAddToLog write FOnAddToLog;
      //** Пул (Источник) фрейма
    //property Pool: IAIFramePool read Get_Pool write Set_Pool;
      //** Источник фрейма
    //property Source: IAISource2 read Get_Source;
    {**
      Зачитывает или записывает данные из пула.

      The implementation of value loading actually occurs in FramerD
    }
    //property Value: IAIValue read GetValue write SetValue; //public FDType value;
      //** Версия фрейма
    property Version: TAiVersion read FVersion write FVersion;
      //** Фрейм в виде XML строки
    property Xml: WideString read GetXml write SetXml;
  end;
  //TAIFrame4 = TAiFrameObject;
  TAiFrame = TAiFrameObject;

// TODO: Rename TAiFrame2004 -> TAiFrameObject2004
  // Recovered
  TAiFrame2004 = class
  public
    function ConnectGet(Index: AInt): AInt64;
    function GetConnectCount(): AInt32;
    function GetHandle(): AInt32;
    function GetTyp(): AInt32;
    function P(const Name: string): TAiSlot2004;
    procedure Save();
  public
    property ConnectCount: AInt32 read GetConnectCount;
    property Handle: AInt32 read GetHandle;
    property Typ: AInt32 read GetTyp;
  end;

// TODO: Rename TAiFrame2005 -> TAiFrameObject2005
  TAiFrame2005 = class(TAiFrameObject)
  public
      // Очистить объект
    function Clear(): TError; virtual;
      // Загрузить конфигурации
    function ConfigureLoad(Config: TConfig; Prefix: String): TError; virtual;
      // Загрузить конфигурации
    function ConfigureLoad1(): Boolean; virtual;
      // Сохранить конфигурации
    function ConfigureSave(Config: TConfig; Prefix: String): TError; virtual;
      // Сохранить конфигурации
    function ConfigureSave1(): Boolean; virtual;
      // Возвращает дату создания
    function GetDateTimeCreate(): TDateTime;
      // Возвращает Id
    function GetId(): TAI_Id;
      // Инициализирован?
    function GetInitialized(): Boolean;
      // Возвращает источник
    function GetSource(): AiSourceObject2005;
      // Возвращает тип фрейма
    function GetType(): TAI_Id;
      // Произвести инициализацию с установкой параметров
    function Init(Path: String; Log: TLog; Config: TConfig; Prefix: String): TError; virtual;
    function LoadFromRecF64(Rec: TAIFreimRecF64): TError;
    function LoadFromXml(Xml: TProfXml): TError; virtual;
    //function LoadFromXml(Xml: TMyXml): TError; virtual;
      // Зарегистрировать тип фрейма в источнике
    function Regist(): TError; virtual;
    function SaveToRecF64(var Rec: TAIFreimRecF64): TError;
    function SaveToXml(Xml: TProfXml): TError; virtual;
    //function SaveToXml(Xml: TMyXml): TError; virtual;
    function SetDateTimeCreate(Value: TDateTime): TError;
      // Установить Id. Если не инициализирован.
    function SetId(Value: TAI_Id): TError;
      // Инициализировать/Финализировать
    function SetInitialized(Value: Boolean): TError;
      // Установить источник. Только если не инициализирован.
    function SetSource(Value: AiSource2005): TError;
      // Установить тип
    function SetType(Value: TAI_Id): TError;
  end;
  TAiFrameObject2005 = TAiFrame2005;

  TAiFrameObject20050819 = TAiFrameObject2005;
  TAiFrameObject20050911 = TAiFrameObject2005;

type // Фрейм
  TAiFreimObject = class(TAiFrameObject2005)
  protected // IAIFreim
    function Get_Connects(): TAiConnectsObject;
    function Get_DateTimeCreate(): TDateTime;
    function Get_FreimName(): WideString;
    function Get_FreimType(): TAId;
    //function Get_Source(): TAiSource;
    procedure Set_DateTimeCreate(Value: TDateTime);
    procedure Set_FreimType(Value: TAId);
    //procedure Set_Source(const Value: IAISource);
    //function AddToLog(AGroup: TLogGroupMessage; AType: TLogTypeMessage; const AStrMsg: string; AParams: array of const): Boolean;
    //function ToLog(AGroup: TLogGroupMessage; AType: TLogTypeMessage; const AStrMsg: WideString; AParams: array of const): Integer;
  protected
    function GetDateTimeCreate(): TDateTime;  // Возвращает дату создания
    function GetID(): TAId;                   // Возвращает Id
    function GetInitialized(): Boolean;       // Инициализирован?
    procedure SetDateTimeCreate(Value: TDateTime);
    procedure SetId(Value: TAId);             // Установить Id. Если не инициализирован.
    procedure SetInitialized(Value: Boolean); // Инициализировать/Финализировать
    //procedure SetSource(Value: IAISource);    // Установить источник. Только если не инициализирован.
    procedure SetXml(Value: WideString);
  public // IAIFreim
    function LoadFromRecF64(Rec: TAIFreimRecF64): WordBool;
  public
    constructor Create(Source: AiSource2005 = 0; Id: TAId = 0);
  public
    //function LoadFromXml(Xml: IXmlNode): WordBool; virtual;
    function SaveToRecF64(var Rec: TAIFreimRecF64): Boolean;
      //** Сохранить список связей в XML
    //function SaveToXml(Xml: IXmlNode): WordBool; virtual;
  public
    property DateTimeCreate: TDateTime read GetDateTimeCreate write SetDateTimeCreate;
    property Xml: WideString read GetXml write SetXml;
  end;
  TAiFreim = TAiFreimObject;

implementation

uses
  AiSourceObj;

{ TAiFrameObject }

function TAiFrameObject.Clear(): WordBool;
begin
  if Assigned(FConnects) then
  begin
    FConnects.Free();
    FConnects := nil;
  end;
  if Assigned(FData) then
  begin
    FData.Free();
    FData := nil;
  end;
  FDateCreate := 0;
  FId := 0;
  FInitialized := False;
  //FPool := nil;
  //FSource := nil;
  FFreimType := 0;
  Result := True;
end;

constructor TAiFrameObject.Create(Source: AiSource2005; Id: TAI_Id);
begin
  inherited Create;
  FConnects := nil;
  FData := nil;
  FDateCreate := 0;
  FId := Id;
  FInitialized := False;
  FSource := Source;
  FFreimType := 0;
  if (Source <> 0) and (Id > 0) then
    Load();
end;

procedure TAiFrameObject.DoCreate();
begin
//  FConnects := nil;
  FData := nil;
  FDateCreate := 0;
  FID := 0;
  FInitialized := False;
  //FPool := nil;
  FFreimType := 0;
end;

function TAiFrameObject.Finalize(): TProfError;
begin
  if (FSource <> 0) then
  begin
    if Assigned(FConnects) then
    begin
      FConnects.Free;
      FConnects := nil;
    end;
    if Assigned(FData) then
    begin
      FData.Free;
      FData := nil;
    end;
  end;

  //if not(Assigned(FPool)) then
  begin
    {if Assigned(FConnects) then
    begin
      FConnects.Free;
      FConnects := nil;
    end;}
    if Assigned(FData) then
    begin
      //FData.Free;
      FData := nil;
    end;
  end;
  FInitialized := False;
  Clear;
  Result := 0;
end;

procedure TAiFrameObject.Free();
begin
  Finalize();
  inherited Free();
end;

function TAiFrameObject.GetConnects(): TAiConnectsObject;
begin
  if not(Assigned(FConnects)) then
  begin
    if (FInitialized) and (FSource <> 0) then
      FConnects := (TObject(FSource) as TAiSourceObject).GetFreimConnects(FId);
    if not(Assigned(FConnects)) then
      FConnects := TAiConnectsObject20050819.Create();
  end;
  Result := FConnects;
end;

function TAiFrameObject.GetData(): TAiDataObject;
begin
  if not(Assigned(FData)) then
  begin
    if (FInitialized) and (FSource <> 0) then
    try
      FData := (TObject(FSource) as TAiSourceObject).GetFreimData(FId);
    except
      FData := nil;
    end;
    if not(Assigned(FData)) then
    try
      FData := TAiDataObject2005.Create(FId, dtNone);
    except
      FData := nil;
    end;
  end;
  Result := FData;
end;

function TAiFrameObject.GetDateTimeCreate(): TDateTime;
begin
  Result := FDateCreate;
end;

function TAiFrameObject.GetFreimType(): TAId;
begin
  Result := FFreimType;
end;

function TAiFrameObject.GetInitialized(): Boolean;
begin
  Result := FInitialized;
end;

function TAiFrameObject.GetSource(): AiSource2005;
begin
  Result := FSource;
end;

{function TAiFrameObject.GetValue(): IAIValue;
begin
  Result := nil;
end;}

function TAiFrameObject.GetXml(): WideString;
{var
  Xml: TProfXmlNode;}
begin
  (*Result := '<Freim>'+#13#10+
    '  <Id>'+cInt64ToStr(FId)+'</Id>'+#13#10+
    '  <Type>'+cInt32ToStr(FType)+'</Type>'+#13#10+
    '  <DateTimeCreate>'+cDateTimeToStr(FDateTimeCreate)+'</DateTimeCreate>'+#13#10+
    {FConnects.Xml+#13#10+
    FData.Xml+#13#10+}
    '</Freim>';*)

  {Result := '';
  Xml := TProfXmlNode.Create(nil);
  if not(SaveToXml(Xml)) then Exit;
  Result := Xml.Xml;
  Xml.Free;}

  {Result := False;
  if not(Assigned(Xml)) then Exit;
  GetConnects.SaveToXml(Xml.GetNodeByName('Connects'));
  Node := Xml.GetNodeByName('Data');
  GetData.SaveToXml(Node);
  Xml.WriteString('DateTimeCreate', DateTimeToStr(FDateTimeCreate));
  Xml.WriteString('Id', IntToStr(FId));
  Xml.WriteString('Type', IntToStr(FFreimType));
  Result := True;}
end;

function TAiFrameObject.Get_Connects(): TAiConnectsObject;
begin
  Result := GetConnects();
end;

function TAiFrameObject.Get_Data(): TAiDataObject;
begin
  Result := GetData();
end;

function TAiFrameObject.Get_DateTimeCreate(): TDateTime;
begin
  Result := FDateCreate;
end;

function TAiFrameObject.Get_FrameID(): TAIID;
begin
  Result := FID;
end;

function TAiFrameObject.Get_FrameName(): WideString;
begin
  Result := IntToStr(FId);
end;

function TAiFrameObject.Get_FrameType(): TAIID;
begin
  Result := FFreimType;
end;

function TAiFrameObject.Get_IsReadOnly(): WordBool;
begin
  Result := False;
end;

{function TAiFrameObject.Get_Pool(): IAIFramePool;
begin
  Result := FPool;
end;}

{function TAiFrameObject.Get_Source(): IAISource2;
begin
  Result := nil;
end;}

function TAiFrameObject.Initialize(): TProfError;
begin
  Result := 0;
  if FInitialized then Exit;
  FInitialized := True;
  Result := Load();
end;

function TAiFrameObject.Load(): TProfError;
begin
  if (LoadFromData(Get_Data()) >= 0) then
  begin
    Result := 0;
    Exit;
  end;

  if not(FInitialized) then
  begin
    Result := -2;
    Exit;
  end;
  if (FSource = 0) then
  begin
    Result := -3;
    Exit;
  end;
  if (FId <= 0) then
  begin
    Result := -3;
    Exit;
  end;
  FDateCreate := (TObject(FSource) as TAiSourceObject).GetFreimDateTimeCreate(FId);
  if (FDateCreate = 0) then
    FDateCreate := dtNow();
  FFreimType := (TObject(FSource) as TAiSourceObject).GetFreimType(FId);
  Result := 0;
end;

function TAiFrameObject.LoadFromData(Data: TAiDataObject): TAiError;
begin
  Result := -1;
end;

function TAiFrameObject.LoadFromFile(const AFileName: WideString): TProfError;
begin
  Result := -1; //False;
end;

{function TAIFreim.LoadFromXml(Xml: IXmlNode): WordBool;
begin
  Result := False;
  if not(Assigned(Xml)) then Exit;
  Clear();
  FID := TProfXmlNode.ReadInt64Def(Xml, 'ID');
  FDateTimeCreate := TProfXmlNode.ReadDateTimeDef(Xml, 'DateTimeCreate');
  FFreimType := TProfXmlNode.ReadInt64Def(Xml, 'Type');
  GetConnects.LoadFromXml(TProfXmlNode.GetNodeByNameA(Xml, 'Connects'));
  //GetData.LoadFromXml(Xml.GetNodeByName('Data'));
  Result := True;
end;}

function TAiFrameObject.Regist(): Boolean;
begin
  Result := False;
  //AddToLog(lgGeneral, ltError, stNotOverrideA);
end;

function TAiFrameObject.Save(): TProfError;
begin
  if (FInitialized) and (FSource <> 0) and (FId > 0) then
  begin
    (TObject(FSource) as TAiSourceObject).SetFreimType(FId, FFreimType);
    Result := 0;
  end
  else
    Result := -1;
end;

function TAiFrameObject.SaveToFile(const AFileName: WideString): WordBool;
begin
  Result := False;
end;

(*function TAiFrameObject.SaveToXml(Xml: IXmlNode): WordBool;
{var
  con: TAiConnects;}
begin
  {Result := Assigned(Xml);
  if not(Result) then Exit;
  TProfXmlNode.WriteIntegerA(Xml, 'ID', FID);
  TProfXmlNode.WriteDateTimeA(Xml, 'DateTimeCreate', FDateTimeCreate);
  TProfXmlNode.WriteIntegerA(Xml, 'Type', FFreimType);
  con := Connects;
  if Assigned(con) then
    con.SaveToXml(TProfXmlNode.GetNodeByNameA(Xml, 'Connects'));
  //Data.SaveToXml(Xml.GetNodeByName('Data'));}
end;*)

procedure TAiFrameObject.SetDateTimeCreate(Value: TDateTime);
begin
  if FInitialized then Exit;
  FDateCreate := Value;
end;

procedure TAiFrameObject.SetFreimType(Value: TAId);
begin
  if FInitialized then Exit;
  FFreimType := Value;
end;

{procedure TAiFrameObject.SetValue(Value: IAIValue);
begin
  // ...
end;}

procedure TAiFrameObject.SetXml(Value: WideString);
//var
//  Xml: IProfXmlNode;
begin
  {Xml := TProfXmlNode.Create(nil, nil, nil);
  Xml.Xml := Value;
  LoadFromXml(Xml);
  Xml.Free();}
end;

procedure TAiFrameObject.Set_DateTimeCreate(Value: TDateTime);
begin
  FDateCreate := Value;
end;

procedure TAiFrameObject.Set_FrameID(Value: TAIID);
begin
  if FInitialized then Exit;
  FID := Value;
end;

procedure TAiFrameObject.Set_FrameType(Value: TAIID);
begin
  if FInitialized then Exit;
  FFreimType := Value;
end;

{procedure TAiFrameObject.Set_Pool(const Value: IAIFramePool);
begin
  FPool := Value;
end;}

{ TAiFrame2004 }

function TAiFrame2004.ConnectGet(Index: AInt): AInt64;
begin
  Result := 0;
end;

function TAiFrame2004.GetConnectCount(): AInt32;
begin
  Result := 0;
end;

function TAiFrame2004.GetHandle(): AInt32;
begin
  Result := 0;
end;

function TAiFrame2004.GetTyp(): AInt32;
begin
  Result := 0;
end;

function TAiFrame2004.P(const Name: string): TAiSlot2004;
begin
  Result := nil;
end;

procedure TAiFrame2004.Save();
begin
end;

{ TAiFrame2005 }

function TAiFrame2005.Clear(): TError;
begin
  FConnects.Free;
  FConnects := nil;
  FData.Free;
  FData := nil;
  FDateCreate := 0;
  FId := 0;
  FInitialized := False;
  FSource := 0;
  FFreimType := 0;
  Result := 0;
end;

function TAiFrame2005.ConfigureLoad(Config: TConfig; Prefix: String): TError;
begin
  Result := 1;
  if not(Assigned(Config)) then Exit;
  Result := 0;
end;

function TAiFrame2005.ConfigureLoad1(): Boolean;
begin
  Result := (ConfigureSave(Self.FConfig, Self.FPrefix) >= 0);
end;

function TAiFrame2005.ConfigureSave(Config: TConfig; Prefix: String): TError;
begin
  Result := 1;
  if not(Assigned(Config)) then Exit;
  Result := 0;
end;

function TAiFrame2005.ConfigureSave1(): Boolean;
begin
  Result := (ConfigureSave(Self.FConfig, Self.FPrefix) >= 0);
end;

function TAiFrame2005.GetDateTimeCreate(): TDateTime;
begin
  Result := FDateCreate;
end;

function TAiFrame2005.GetId(): TAI_Id;
begin
  Result := FId;
end;

function TAiFrame2005.GetInitialized(): Boolean;
begin
  Result := FInitialized;
end;

function TAiFrame2005.GetSource(): AiSourceObject2005;
begin
  Result := FSource;
end;

function TAiFrame2005.GetType(): TAI_Id;
begin
  Result := FFreimType;
end;

function TAiFrame2005.Init(Path: String; Log: TLog; Config: TConfig; Prefix: String): TError;
begin
  FConfig := Config;
  FLog := Log;
  FPath := Path;
  FPrefix := Prefix;
  Result := Initialize;
end;

function TAiFrame2005.LoadFromRecF64(Rec: TAIFreimRecF64): TError;
begin
  FId := Rec.Id;
  FFreimType := Rec.Typ;
  FDateCreate := Rec.DTCreate;
  Result := 0;
end;

function TAiFrame2005.LoadFromXml(Xml: TProfXml): TError;
begin
  Result := 1;
  {
  if not(Assigned(Xml)) then Exit;
  Clear;
  Xml.GetParamValueByNameAsUInt64('Id', FId);
  Xml.GetParamValueByNameAsDateTime('DateTimeCreate', FDateTimeCreate);
  Xml.GetParamValueByNameAsUInt64('Type', FType);
  GetConnects.LoadFromXml(Xml.GetParamByName('Connects'));
  GetData.LoadFromXml(Xml.GetParamByName('Data'));
  Result := 0;
  }
end;
{function TAI_Freim.LoadFromXml(Xml: TMyXml): TError;
begin
  Clear;
  FId := cStrToUInt64(Xml.GetParamValueByName('Id'));
  FDateTimeCreate := cStrToDateTime(Xml.GetParamValueByName('DateTimeCreate'));
  GetConnects.LoadFromXml(Xml.GetParamByName('Connects'));
  GetData.LoadFromXml(Xml.GetParamByName('Data'));
  FType := cStrToUInt64(Xml.GetParamValueByName('Type'));
  Result := 0;
end;}

function TAiFrame2005.Regist(): TError;
begin
  Result := 0;
end;

function TAiFrame2005.SaveToRecF64(var Rec: TAIFreimRecF64): TError;
begin
  Rec.Id := FId;
  Rec.Typ := FFreimType;
  Rec.DTCreate := FDateCreate;
  Rec.DataSize := GetData.GetSize;
  {if GetData.GetType = dtStream then
    Rec.DataSize := GetData.GetStream.GetSize
  else
    Rec.DataSize := 0;}
  Rec.ConnectCount := GetConnects.GetCountConnects;
  Result := 0;
end;

function TAiFrame2005.SaveToXml(Xml: TProfXml): TError;
begin
  Result := -1;
  if not(Assigned(Xml)) then Exit;
  {
  GetConnects.SaveToXml(Xml.GetParamByName('Connects'));
  GetData.SaveToXml(Xml.GetParamByName('Data'));
  Xml.SetParamValue('DateTimeCreate', cDateTimeToStr(FDateTimeCreate));
  Xml.SetParamValue('Id', cUInt64ToStr(FId));
  Xml.SetParamValue('Type', cUInt64ToStr(FType));
  Result := 0;
  }
end;
(*function TAI_Freim.SaveToXml(Xml: TMyXml): TError;
begin
  Result := 1;
  if not(Assigned(Xml)) then Exit;
  {with Xml.NewParam('Freim', '') do begin}
    GetConnects.SaveToXml(Xml.NewParam('Connects', ''));
    GetData.SaveToXml(Xml.NewParam('Data', ''));
    Xml.NewParam('DateTimeCreate', cDateTimeToStr(FDateTimeCreate));
    Xml.NewParam('Id', cUInt64ToStr(FId));
    Xml.NewParam('Type', cUInt64ToStr(FType));
  {end;}
  Result := 0;
end;*)

function TAiFrame2005.SetDateTimeCreate(Value: TDateTime): TError;
begin
  Result := 1;
  if FInitialized then Exit;
  FDateCreate := Value;
  Result := 0;
end;

function TAiFrame2005.SetId(Value: TAI_Id): TError;
begin
  Result := -1;
  if FInitialized then Exit;
  FId := Value;
  Result := 0;
end;

function TAiFrame2005.SetInitialized(Value: Boolean): TError;
begin
  FInitialized := Value;
  Result := 0;
end;

function TAiFrame2005.SetSource(Value: AiSource2005): TError;
begin
  Result := -1;
  if FInitialized then Exit;
  FSource := Value;
  Result := 0;
end;

function TAiFrame2005.SetType(Value: TAI_Id): TError;
begin
  Result := -1;
  if FInitialized then Exit;
  FFreimType := Value;
  Result := 0;
end;

{ TAiFreimObject }

constructor TAiFreimObject.Create(Source: AiSource2005 = 0; Id: TAId = 0);
begin
  inherited Create(Source, Id);
  FConnects := nil;
  FData := nil;
  FDateCreate := 0;
  FId := 0; //AId;
  FInitialized := False;
  //FSource := ASource;
  FFreimType := 0;
  {if Assigned(Source) and (Id > 0) then Load;}
end;

function TAiFreimObject.GetDateTimeCreate(): TDateTime;
begin
  Result := FDateCreate;
end;

function TAiFreimObject.GetID(): TAI_ID;
begin
  Result := FId;
end;

function TAiFreimObject.GetInitialized(): Boolean;
begin
  Result := FInitialized;
end;

{function TAiFreimObject.GetSource(): IAISource;
begin
  Result := FSource;
end;}

function TAiFreimObject.LoadFromRecF64(Rec: TAIFreimRecF64): WordBool;
begin
  FId := Rec.Id;
  FFreimType := Rec.Typ;
  FDateCreate := Rec.DTCreate;
  Result := True;
end;

{function TAiFreimObject.LoadFromXml(Xml: IXmlNode): WordBool;
var
  Connects: IXmlNode;
begin
  Result := False;
  if not(Assigned(Xml)) then Exit;
  Clear();
  ProfXmlUtils.ProfXmlNode_ReadInt64(Xml, 'ID', FId);
  ProfXmlUtils.ProfXmlNode_ReadDateTime(Xml, 'DateTimeCreate', FDateTimeCreate);
  ProfXmlUtils.ProfXmlNode_ReadInt64(Xml, 'Type', FFreimType);
  Connects := ProfXmlUtils.ProfXmlNode_GetNodeByName(Xml, 'Connects');
  GetConnects.LoadFromXml(Connects);
  //GetData.LoadFromXml(Xml.GetNodeByName('Data'));
  Result := True;
end;}

function TAiFreimObject.SaveToRecF64(var Rec: TAIFreimRecF64): Boolean;
begin
  {Rec.Id := FId;
  Rec.Typ := FFreimType;
  Rec.DTCreate := FDateTimeCreate;
  if GetData.GetType = dtStream then
    Rec.DataSize := GetData.GetStream.GetSize
  else
    Rec.DataSize := 0;
  Rec.ConnectCount := GetConnects.GetCountConnects;
  Result := True;}
  Result := False;
end;

{function TAiFreimObject.SaveToXml(Xml: IXmlNode): WordBool;
var
  Connects: IXmlNode;
begin
  Result := Assigned(Xml);
  if not(Result) then Exit;
  ProfXmlUtils.ProfXmlNode_WriteInt64(Xml, 'ID', FId);
  ProfXmlUtils.ProfXmlNode_WriteDateTime(Xml, 'DateTimeCreate', FDateTimeCreate);
  ProfXmlUtils.ProfXmlNode_WriteInt64(Xml, 'Type', FFreimType);
  Connects := ProfXmlUtils.ProfXmlNode_GetNodeByName(Xml, 'Connects');
  GetConnects.SaveToXml(Connects);
  //Data.SaveToXml(Xml.GetNodeByName('Data'));
end;}

procedure TAiFreimObject.SetDateTimeCreate(Value: TDateTime);
begin
  if FInitialized then Exit;
  FDateCreate := Value;
end;

procedure TAiFreimObject.SetId(Value: TAI_Id);
begin
  if FInitialized then Exit;
  FId := Value;
end;

procedure TAiFreimObject.SetInitialized(Value: Boolean);
begin
  FInitialized := Value;
end;

{procedure TAiFreimObject.SetSource(Value: IAISource);
begin
  if FInitialized then Exit;
  FSource := Value;
end;}

procedure TAiFreimObject.SetXml(Value: WideString);
{var
  Xml: IProfXmlNode;}
begin
  {Xml := TProfXmlNode.Create(nil, nil, nil);
  Xml.Xml := Value;
  LoadFromXml(Xml);
  Xml.Free();}
end;

function TAiFreimObject.Get_Connects(): TAiConnectsObject;
begin
  Result := FConnects;
end;

function TAiFreimObject.Get_DateTimeCreate(): TDateTime;
begin
  Result := FDateCreate;
end;

procedure TAiFreimObject.Set_DateTimeCreate(Value: TDateTime);
begin
  FDateCreate := Value;
end;

function TAiFreimObject.Get_FreimName(): WideString;
begin
  Result := IntToStr(FId);
end;

function TAiFreimObject.Get_FreimType(): TAId;
begin
  Result := FFreimType;
end;

procedure TAiFreimObject.Set_FreimType(Value: TAId);
begin
  FFreimType := Value;
end;

{function TAiFreimObject.Get_Source(): IAISource;
begin
  Result := IAISource(FSource);
end;}

{procedure TAiFreimObject.Set_Source(const Value: IAISource);
begin
  FSource := IAISource(Value);
end;}

{function TAIFreim.AddToLog(AGroup: TLogGroupMessage; AType: TLogTypeMessage; const AStrMsg: string; AParams: array of const): Boolean;
begin
  Result := False;
  if Assigned(FOnAddToLog) then try
    Result := FOnAddToLog(AGroup, AType, AStrMsg, AParams);
  except
  end;
end;}

{function TAIFreim.ToLog(AGroup: TLogGroupMessage; AType: TLogTypeMessage; const AStrMsg: WideString; AParams: array of const): Integer;
begin
  AddToLog(AGroup, AType, AStrMsg, AParams);
  Result := 0;
end;}

{ TAIFreimNamed }

{function TAIFreimNamed.LoadFromXml(Xml: IXmlNode): WordBool;
begin
  Result := inherited LoadFromXml(Xml);
  if not(Result) then Exit;
  TProfXmlNode.ReadStringA(Xml, 'Description', FDescription);
  TProfXmlNode.ReadStringA(Xml, 'Name', FName);
  TProfXmlNode.ReadStringA(Xml, 'Title', FTitle);
end;}

{function TAIFreimNamed.SaveToXml(Xml: IXmlNode): WordBool;
begin
  Result := inherited SaveToXml(Xml);
  if not(Result) then Exit;
  TProfXmlNode.WriteStringA(Xml, 'Description', FDescription);
  TProfXmlNode.WriteStringA(Xml, 'Name', FName);
  TProfXmlNode.WriteStringA(Xml, 'Title', FTitle);
end;}

{ TAiSlot2004 }

function TAiSlot2004.GetAsString(): string;
begin
  Result := '';
end;

function TAiSlot2004.GetAsUInt32(): AUInt32;
begin
  Result := 0;
end;

function TAiSlot2004.GetAsUInt64(): AUInt64;
begin
  Result := 0;
end;

function TAiSlot2004.GetValeAsHandle(): AInt32;
begin
  Result := 0;
end;

function TAiSlot2004.GetValueAsString(): APascalString;
begin
  Result := '';
end;

procedure TAiSlot2004.SetAsString(const Value: string);
begin
end;

procedure TAiSlot2004.SetAsUInt32(Value: AUInt32);
begin
end;

procedure TAiSlot2004.SetAsUInt64(Value: AUInt64);
begin
end;

procedure TAiSlot2004.SetValueAsString(const Value: APascalString);
begin
end;

end.