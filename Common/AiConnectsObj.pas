﻿{**
@Abstract AiConnects
@Author Prof1983 <prof1983@ya.ru>
@Created 12.03.2012
@LastMod 23.11.2012
}
unit AiConnectsObj;

interface

// TODO: Delete XmlIntf, AStreamObj, AXmlUtils, AiTypes

uses
  XmlIntf,
  ABase, AStreamObj, AXmlObj, AXmlUtils,
  AiBase, AiTypes;

type //** Связи
  TAiConnectsObject = class
  protected
      //** Связи
    FConnects: array of TAiId;
      //** ID фрейма владельца - Кому принадлежит список связей
    FOwnerId: TAId;
  public
      //** Добавить связь
    function AddConnect(Connect: TAId): Integer; virtual;
      //** Очистить
    function Clear(): AError; virtual;
      //** Удалить связь по идентификатору
    function DeleteConnect(Con: TAId): AError; virtual;
      //** Удалить связь по индексу
    function DeleteConnectByIndex(Index: Integer): AError; virtual;
      //** Возвращает идентификатор связи по индексу
    function GetConnect(Index: Integer): TAId; virtual;
      //** Возвращает индекс связи по идентификатору
    function GetConnectIndex(Connect: TAId): Integer; virtual;
      //** Возвращает колличество связей
    function GetCountConnects(): Integer; virtual;
      //** Возвращает идентификатор фрейма-владельца
    function GetFreimId(): TAId;
      //** Загрузить из файла
    function LoadFromFile(const FileName: WideString): AError; virtual;
      //** Загрузить из файла
    function LoadFromFileN(const FileName: String): AError; virtual;
      //** Загрузить список связей из XML (20050911)
    function LoadFromXml(Xml: TProfXml): AError; virtual;
      //** Загрузить список связей из XML
    function LoadFromXml20050819(Xml: IXmlNode): AError; virtual;
      //** Загрузить список связей из XML
    //function LoadFromXml(const AXml: IXmlNode): WordBool; virtual;
    //function LoadFromXml1(const AXml: TProfXmlNode1): WordBool; virtual;
      //** Сохранить в файл
    function SaveToFile(const FileName: WideString): WordBool; virtual;
      //** Сохранить в файл
    function SaveToFile2005(F: AStreamObj.TProfFile): AError; virtual;
      //** Сохранить в файл
    function SaveToFile20050911(F: AStreamObj.TProfFile): AError; virtual; deprecated; // Use SaveToFile2005()
      //** Сохранить в файл
    function SaveToFileN(FileName: String): AError; virtual;
      //** Сохранить список связей в XML (20050911)
    function SaveToXml(Xml: TProfXml): AError; virtual;
      //** Сохранить список связей в XML
    //function SaveToXml(const AXml: IXmlNode): WordBool; virtual;
    //function SaveToXml1(const AXml: TProfXmlNode1): WordBool; virtual;
      //** Сохранить список связей в XML
    function SaveToXml20050819(Xml: IXmlNode): AError; virtual;
      //** Задает Id связанного фрейма
    procedure SetConnect(Index: Integer; Value: TAId); virtual;
      //** Задать Id связанного фрейма
    function SetConnectA(Index: Integer; Value: TAId): AError; virtual;
      //** Задает идентификатор фрейма-владельца
    procedure SetFreimId(Value: TAId);
  public
    //** Колличество связей
    property Count: Integer read GetCountConnects;
    //** Идентификатор фрейма-владельца
    property FreimID: TAIID read GetFreimID write SetFreimID;
    //** Идетификаторы связвных фреймов
    property Connects[Index: Integer]: TAIID read GetConnect write SetConnect;
  end;

  TAiConnects = TAiConnectsObject;

implementation

{ TAiConnectsObject }

function TAiConnectsObject.AddConnect(Connect: TAIID): Integer;
begin
  Result := Length(FConnects);
  SetLength(FConnects, Result + 1);
  FConnects[Result] := Connect;
end;

function TAiConnectsObject.Clear(): AError;
begin
  SetLength(FConnects, 0);
  Result := 0;
end;

function TAiConnectsObject.DeleteConnect(Con: TAIID): AError;
begin
  Result := -1;
end;

function TAiConnectsObject.DeleteConnectByIndex(Index: Integer): AError;
begin
  Result := -1;
end;

function TAiConnectsObject.GetConnect(Index: Integer): TAIID;
begin
  if (Index >= 0) and (Index < Length(FConnects)) then
    Result := FConnects[Index]
  else
    Result := 0;
end;

function TAiConnectsObject.GetConnectIndex(Connect: TAIID): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to High(FConnects) do
    if FConnects[i] = Connect then
    begin
      Result := i;
      Exit;
    end;
end;

function TAiConnectsObject.GetCountConnects(): Integer;
begin
  Result := Length(FConnects);
end;

function TAiConnectsObject.GetFreimID(): TAIID;
begin
  Result := FOwnerID;
end;

function TAiConnectsObject.LoadFromFile(const FileName: WideString): AError;
begin
  Result := -1;
end;

function TAiConnectsObject.LoadFromFileN(const FileName: String): AError;
begin
  Result := 1;
end;

function TAiConnectsObject.LoadFromXml(Xml: TProfXml): AError;
var
  Count: UInt32;
  I: Int32;
  Id: TAId;
  Param: TProfXml;
begin
  Result := -1;
  {
  if not(Assigned(Xml)) then Exit;
  Count := Xml.GetCountParams;
  for I := 0 to Count - 1 do begin
    Param := Xml.GetParam(I);
    if Param.GetName = 'Connect' then begin
      if Param.GetParamValueByNameAsUInt64('IdFreim', Id) then
        AddConnect(Id);
    end;
  end;
  Result := 0;
  }
end;

(*function TAiConnectsObject.LoadFromXml(const AXml: IXmlNode): WordBool;
var
  Count: Integer;
  I: Int32;
  ID: TAI_Id;
  Node: IXmlNode;
  Xml: IXmlNode;
begin
  Xml := AXml;
  Result := False;
  if not(Assigned(Xml)) then Exit;
  Count := Xml.Collection.Count;
  for I := 0 to Count - 1 do
  begin
    Node := Xml.Collection.Nodes[I];
    if Node.NodeName = 'Connect' then
    begin
      ID := 0;
      if ProfXmlUtils.ProfXmlNode_ReadInt64(Node, 'IdFreim', ID) then
        AddConnect(ID);
    end;
  end;
  Result := True;

  {Xml := AXml;
  Result := False;
  if not(Assigned(Xml)) then Exit;
  Count := Xml.Collection.Count;
  for I := 0 to Count - 1 do
  begin
    Node := Xml.Collection.Nodes[I];
    if Node.NodeName = 'Connect' then
    begin
      ID := 0;
      if ProfXmlUtils.ProfXmlNode_ReadInt64(Node, 'IdFreim', ID) then
        AddConnect(ID);
    end;
  end;
  Result := True;}
end;*)

(*function TAiConnectsObject.LoadFromXml1(const AXml: TProfXmlNode1): WordBool;
var
  Count: Integer;
  I: Int32;
  ID: TAIId;
  Node: TProfXmlNode1;
  Xml: TProfXmlNode1;
begin
  Xml := AXml;
  Result := False;
  if not(Assigned(Xml)) then Exit;
  Count := Xml.Collection.Count;
  for I := 0 to Count - 1 do
  begin
    Node := Xml.Collection.Nodes[I];
    if Node.NodeName = 'Connect' then
    begin
      ID := 0;
      if Node.ReadInt64('IdFreim', ID) then
        AddConnect(ID);
    end;
  end;
  Result := True;
end;*)

function TAiConnectsObject.LoadFromXml20050819(Xml: IXmlNode): AError;
var
  Count: UInt32;
  I: Int32;
  Id: Integer; //TAI_Id;
  Node: IXmlNode;
begin
  if not(Assigned(Xml)) then
  begin
    Result := -2;
    Exit;
  end;

  Node := ProfXmlNode_GetNodeByName(Xml, 'Connect');
  if not(Assigned(Node)) then
  begin
    Result := -3;
    Exit;
  end;

  if not(AXmlUtils.ProfXmlNode_ReadInt(Node, 'IdFreim', Id)) then
  begin
    Result := -3;
    Exit;
  end;
  AddConnect(Id);
  Result := 0;
end;

function TAiConnectsObject.SaveToFile(const FileName: WideString): WordBool;
begin
  Result := False;
end;

function TAiConnectsObject.SaveToFile2005(F: AStreamObj.TProfFile): AError;
begin
  Result := 1;
end;

function TAiConnectsObject.SaveToFile20050911(F: AStreamObj.TProfFile): AError;
begin
  Result := SaveToFile2005(F);
end;

function TAiConnectsObject.SaveToFileN(FileName: String): AError;
begin
  Result := 1;
end;

function TAiConnectsObject.SaveToXml(Xml: TProfXml): AError;
var
  Count: UInt32;
  I: Int32;
begin
  Result := -1;
  {
  if not(Assigned(Xml)) then Exit;
  Count := GetCountConnects;
  for I := 0 to Count - 1 do begin
    Xml.GetParamByName('Connect').SetParamValue('IdFreim', cUInt64ToStr(GetConnect(I)));
  end;
  Result := 0;
  }
end;

(*function TAiConnectsObject.SaveToXml(const AXml: IXmlNode): WordBool;
var
  Count: Integer;
  I: Int32;
  Xml: IXmlNode;
  //con: IXmlNode;
begin
  //Xml := TProfXmlNode(AXml);
  Xml := AXml;
  Result := False;
  if not(Assigned(Xml)) then Exit;
  Count := GetCountConnects;
  //con := TProfXmlNode.GetNodeByNameA(Xml, 'Connect');
  for I := 0 to Count - 1 do
  begin
    Xml.AddChild('Connect').NodeValue := GetConnect(I);
    //TProfXmlNode.WriteInt64(con, 'IdFreim', GetConnect(I));
  end;
  Result := True;
end;*)

(*function TAiConnectsObject.SaveToXml1(const AXml: TProfXmlNode1): WordBool;
var
  Count: Integer;
  I: Int32;
  Xml: TProfXmlNode1;
begin
  Xml := AXml;
  Result := False;
  if not(Assigned(Xml)) then Exit;
  Count := GetCountConnects;
  for I := 0 to Count - 1 do begin
    Xml.GetNodeByName('Connect').WriteUInt64('IdFreim', GetConnect(I));
  end;
  Result := True;
end;*)

function TAiConnectsObject.SaveToXml20050819(Xml: IXmlNode): AError;
var
  Count: UInt32;
  I: Int32;
  Node: IXmlNode;
begin
  Result := 1;
  if not(Assigned(Xml)) then Exit;
  Count := GetCountConnects;
  for I := 0 to Count - 1 do
  begin
    Node := AXmlUtils.ProfXmlNode_GetNodeByName(Xml, 'Connect');
    if Assigned(Node) then
    begin
      AXmlUtils.ProfXmlNode_WriteInt32(Node, 'IdFreim', GetConnect(I));
    end;
  end;
  Result := 0;
end;

procedure TAiConnectsObject.SetConnect(Index: Integer; Value: TAIID);
begin
  // ...
end;

function TAiConnectsObject.SetConnectA(Index: Integer; Value: TAId): AError;
begin
  Result := -1;
end;

procedure TAiConnectsObject.SetFreimID(Value: TAIID);
begin
  FOwnerID := Value;
end;

end.
