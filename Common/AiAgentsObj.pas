﻿{**
@Abstract Агенты
@Author Prof1983 <prof1983@ya.ru>
@Created 22.09.2005
@LastMod 17.12.2012
}
unit AiAgentsObj;

interface

uses
  ABase, ABaseUtils2, AConfigObj, ATypes,
  AiAgentObj, AiBase, AiConfigUtils, AiFrameObj, AiTypes;

type
  TAiRecAgent2005 = record
    Id: AId;
    Agent: TAiAgentObject;
  end;

type
    // Агенты
  TAiAgents2006 = class //(TAiFrameObject)
  protected // --- from TAiFrameObject ---
      //** Класс конфигураций (deprecated)
    FConfig: TConfig;
  protected
    FAgents: array of TAiRecAgent2005;
    FAgentsName: array of String;
  public
    function AddAgent(Value: TAiAgentObject): Int32;
    function ConfigureLoad(Config: TConfig; Prefix: String): AError;
    function ConfigureLoad1(): Boolean; {override;}
    function ConfigureSave(Config: TConfig; Prefix: String): AError; {override;}
    function ConfigureSave1(): Boolean; {override;}
    function DeleteAgent(Index: Int32): AError;
    function FreeAgent(Index: Int32): AError;
    function GetAgent(Index: UInt32): TAiAgentObject;
    function GetAgentById(Id: AId): TAiAgentObject;
    function GetAgentName(Index: Int32): String;
    function GetCountAgents(): UInt32;
    function SetAgentId(Index: UInt32; Value: AId): Boolean;
    function SetAgentName(Index: UInt32; Value: String): Boolean;
  public
    procedure Free; {override;}
  end;

  TAiAgents20050915 = TAiAgents2006;

    {Несколько связанных агентов}
  TAiAgents20050526 = class //(TAiAgentObject)
  private
    FItems: array of TAiAgentObject;
  public
    function AddAgent(Agent: TAiAgentObject): UInt32;
    function GetAgent(Index: UInt32): TAiAgentObject;
    function GetCountAgents: UInt32;
  end;

  TAiAgents_Rep = class //(TAiAgentObject)
  private
    FAgents: array of TAId;
  public
    function AddAgent(Agent: AId): AError;
    function Clear(): AError; {override;}
    function GetCountAgents: UInt32;
  public
    procedure Free; {override;}
  end;

  //TAiAgents = TAiAgents2006;

implementation

{ TAiAgents20050526 }

function TAiAgents20050526.AddAgent(Agent: TAiAgentObject): UInt32;
begin
  Result := Length(FItems);
  SetLength(FItems, Result + 1);
  FItems[Result] := Agent;
end;

function TAiAgents20050526.GetAgent(Index: UInt32): TAiAgentObject;
{var
  Source: AiSourceObj.TAiSource2005;}
begin
  if Index >= UInt32(Length(FItems)) then
    Result := nil
  else begin
    {Source := GetSource;
    if not(Assigned(FItems[Index])) and (Assigned(Source)) then begin
      FItems[Index].F := TAIAgent(Source.GetFreim(FItems[Index].Id));
    end;}
    Result := FItems[Index];
  end;
end;

function TAiAgents20050526.GetCountAgents(): UInt32;
begin
  Result := Length(FItems);
end;

{ TAiAgents2006 }

function TAiAgents2006.AddAgent(Value: TAiAgentObject): Int32;
begin
  Result := Length(FAgents);
  SetLength(FAgents, Result + 1);
  FAgents[Result].Id := Value.GetId;
  FAgents[Result].Agent := Value;
end;

function TAiAgents2006.ConfigureLoad(Config: TConfig; Prefix: String): AError;
var
  Agent: TAiAgentObject;
  AName: String; {Префикс для чтения имени и Id агента из конфигураций}
  {B: Boolean;}
  Count: Int32;  {Колличество агентов из конфигураций}
  I: Int32;
  Id: AId;    {Id агента из конфигураций}
  Name: String;  {Имя агента из конфигураций}
begin
  Result := 1;
  if not(Assigned(Config)) then Exit;
  if not(Config.ReadParamValueByNameAsInt32(Prefix + 'AgentsCount', Count)) then Exit;
  for I := 0 to Count - 1 do
  begin
    Id := 0;
    if (AiConfig_ReadParamValueByNameAsId(Config, AName + 'Name', Id) >= 0) then
      SetAgentId(I, Id);
    Agent := GetAgentById(Id);
    if not(Assigned(Agent)) then
    begin
      AName := Prefix + 'Agent[' + cInt32ToStr(I) + '].';
      {if Config.GetParamValueByNameAsUInt64(AName + 'Name', Id) then SetAgentId(I, Id);}
      if Config.ReadParamValueByName(AName + 'Name', Name) then SetAgentName(I, Name);
      Continue;
    end;
    //Agent.ConfigureLoad(Config, Prefix + 'Agent' + cInt32ToStr(I));

    {if Config.GetParamValueByNameAsBoolean(AName + 'Active', B) then Agent.SetActive(B);
    if Config.GetParamValueByNameAsBoolean(AName + 'Visible', B) then Agent.SetVisible(B);}
  end;
  Result := 0;
end;

function TAiAgents2006.ConfigureLoad1(): Boolean;
var
  Agent: TAiAgentObject;
  AName: String; {Префикс для чтения имени и Id агента из конфигураций}
  {B: Boolean;}
  Count: Int32;  {Колличество агентов из конфигураций}
  I: Int32;
  Id: AId;    {Id агента из конфигураций}
  Name: string;  {Имя агента из конфигураций}
begin
  Result := Assigned(FConfig); //inherited ConfigureLoad1();
  if not(Result) then Exit;
  if not(Assigned(FConfig)) then Exit;
  if not(FConfig.ReadInt32('', 'AgentsCount', Count)) then Exit;
  for I := 0 to Count - 1 do
  begin
    Id := 0;
    if (AiConfig_ReadParamValueByNameAsId(FConfig, AName + 'Name', Id) >= 0) then
      SetAgentId(I, Id);
    Agent := GetAgentById(Id);
    if not(Assigned(Agent)) then
    begin
      AName := 'Agent[' + cInt32ToStr(I) + '].';
      if FConfig.ReadString('', 'Name', Name) then SetAgentName(I, Name);
      Continue;
    end;
    //Agent.ConfigureLoad1();

    {if Config.GetParamValueByNameAsBoolean(AName + 'Active', B) then Agent.SetActive(B);
    if Config.GetParamValueByNameAsBoolean(AName + 'Visible', B) then Agent.SetVisible(B);}
  end;
  Result := True;
end;

function TAiAgents2006.ConfigureSave(Config: TConfig; Prefix: String): AError;
var
  AName: String;
  I: Int32;
begin
  if not(Assigned(FConfig)) then
  begin
    Result := -2;
    Exit;
  end;
  Result := 0; //inherited ConfigureSave(Config, Prefix);
  Config.SetParamValueByNameAsInt32(Prefix + 'Count', Length(FAgents));
  for I := 0 to High(FAgents) do begin
    if Assigned(FAgents[I].Agent) then
    begin
      //FAgents[I].Agent.ConfigureSave(Config, Prefix + 'Agent' + cInt32ToStr(I))
    end
    else
    begin
      AName := Prefix + 'Agent[' + cInt32ToStr(I) + ']';
      Config.SetParamValueByNameAsInt32(AName + '.Id', FAgents[I].Id);
      Config.SetParamValueByName(AName + '.Name', FAgentsName[I]);
    end;
  end;
end;

function TAiAgents2006.ConfigureSave1(): Boolean;
var
  AName: String;
  I: Int32;
begin
  Result := Assigned(FConfig); //inherited ConfigureSave1();
  if not(Result) then Exit;
  FConfig.WriteInt32('', 'Count', Length(FAgents));
  for I := 0 to High(FAgents) do
  begin
    {if Assigned(FAgents[I].Agent) then
      FAgents[I].Agent.ConfigureSave(Config, Prefix + 'Agent' + cInt32ToStr(I))
    else begin
      AName := Prefix + 'Agent[' + cInt32ToStr(I) + ']';
      Config.WriteInt32('.Id', FAgents[I].Id);
      Config.WriteString('.Name', FAgentsName[I]);
    end;}
  end;
end;

function TAiAgents2006.DeleteAgent(Index: Int32): AError;
var
  I: Int32;
begin
  Result := 1;
  if (Index < 0) or (Index >= Length(FAgents)) then Exit;
  if Assigned(FAgents[Index].Agent) then FAgents[Index].Agent.Free;
  for I := Index to High(FAgents) - 1 do begin
    FAgents[I] := FAgents[I + 1];
    FAgentsName[I] := FAgentsName[I + 1];
  end;
  SetLength(FAgents, High(FAgents));
  SetLength(FAgentsName, High(FAgentsName));
end;

procedure TAiAgents2006.Free;
var
  I: Int32;
begin
  ConfigureSave1();
  for I := 0 to High(FAgents) do if Assigned(FAgents[I].Agent) then FAgents[I].Agent.Free;
  SetLength(FAgents, 0);
  inherited Free;
end;

function TAiAgents2006.FreeAgent(Index: Int32): AError;
begin
  Result := 1;
  if (Index < 0) or (Index >= Length(FAgents)) then Exit;
  if Assigned(FAgents[Index].Agent) then begin
    FAgents[Index].Agent.Free;
    FAgents[Index].Agent := nil;
  end;
  Result := 0;
end;

function TAiAgents2006.GetAgent(Index: UInt32): TAiAgentObject;
begin
  if (Index >= UInt32(Length(FAgents))) then
    Result := nil
  else
    Result := FAgents[Index].Agent;
end;

function TAiAgents2006.GetAgentById(Id: AId): TAiAgentObject;
var
  I: Int32;
begin
  Result := nil;
  if (Id <= 0) then Exit;
  for I := 0 to High(FAgents) do if FAgents[I].Id = Id then begin
    Result := FAgents[I].Agent;
    Exit;
  end;
end;

function TAiAgents2006.GetAgentName(Index: Int32): String;
begin
  Result := '';
  if (Index < 0) or (Index >= Length(FAgents)) then Exit;
  if Assigned(FAgents[Index].Agent) then
    Result := FAgents[Index].Agent.GetName
  else if (FAgentsName[Index] <> '') then
    Result := FAgentsName[Index]
  else if (FAgents[Index].Id <> 0) then
    Result := '(' + cUInt64ToStr(FAgents[Index].Id) + ')'
  else
    Result := '[' + cInt32ToStr(Index) + ']';
end;

function TAiAgents2006.GetCountAgents(): UInt32;
begin
  Result := Length(FAgents);
end;

function TAiAgents2006.SetAgentId(Index: UInt32; Value: AId): Boolean;
begin
  Result := False;
  if Index >= Length(FAgents) then Exit;
  if Assigned(FAgents[Index].Agent) then Exit;
  FAgents[Index].Id := Value;
  Result := True;
end;

function TAiAgents2006.SetAgentName(Index: UInt32; Value: String): Boolean;
begin
  Result := False;
  if (Index >= Length(FAgents)) then Exit;
  if Assigned(FAgents[Index].Agent) then begin
    FAgents[Index].Agent.SetName(Value);
    Result := True;
  end else
    FAgentsName[Index] := Value;
end;

{ TAiAgents_Rep }

function TAiAgents_Rep.AddAgent(Agent: AId): AError;
begin
  Result := -1;
end;

function TAiAgents_Rep.Clear(): AError;
begin
  SetLength(FAgents, 0);
  Result := 0;
end;

procedure TAiAgents_Rep.Free();
begin
  Clear();
  inherited Free();
end;

function TAiAgents_Rep.GetCountAgents(): UInt32;
begin
  Result := Length(FAgents);
end;

end.
 