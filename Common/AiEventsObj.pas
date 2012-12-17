{**
@Abstract ������� ��� ������� AI
@Author Prof1983 <prof1983@ya.ru>
@Created 11.10.2006
@LastMod 17.12.2012
}
unit AiEventsObj;

interface

uses
  ABase, AEventObj, ATypes,
  AiFrameObj;

type
  TAiProc = TProcMessageStr;
  TAiProc2006 = function(Sender, Params, Results: AId): AError of object;

type
  TEventAI = class(TAEvent)
    // ����������� �� ��������� �������
    function Connect(Proc: TAIProc): WordBool;
    // ���������� �� �������
    function Disconnect(Proc: TAIProc): WordBool;
    function Run(const AMsg: WideString): WordBool;
  end;

  {** ������� }
  TAiEvent = class(TAiFrameObject)
  protected
    {** ��� �������� �� ���������� ��� ������������� ������� }
    FItems: array of TAiProc;
    {** ��� �������� �� ���������� ��� ������������� ������� }
    FItems2: array of TAiProc2006;
    FEvent: TEventAI;
  public
    function GetCount(): UInt32;
    function GetCount2(): UInt32;
    function GetItem(Index: UInt32): TAiProc;
    function GetItem2(Index: UInt32): TAiProc2006;
    function Run(const AMsg: WideString): WordBool;
    function Run2(Sender: AId): AError;
    function Sign(Proc: TAiProc): AError;
    function Sign2(Proc: TAiProc2006): AError;
    function UnSign(Proc: TAiProc): AError;
    function UnSign2(Proc: TAiProc2006): AError;
  end;

  {** ������� }
  TAiEvents = TAiFrameObject;

  {** �������������� ������� }
  TAiExceptions = TAiFrameObject;

implementation

{ TAiEvent }

function TAiEvent.GetCount(): UInt32;
begin
  Result := Length(FItems);
end;

function TAiEvent.GetCount2(): UInt32;
begin
  Result := Length(FItems2);
end;

function TAiEvent.GetItem(Index: UInt32): TAIProc;
begin
  if Index >= UInt32(Length(FItems)) then
    Result := nil
  else
    Result := FItems[Index];
end;

function TAiEvent.GetItem2(Index: UInt32): TAiProc2006;
begin
  if Index >= UInt32(Length(FItems2)) then
    Result := nil
  else
    Result := FItems2[Index];
end;

function TAiEvent.Run(const AMsg: WideString {Sender: TAI_Id}): WordBool;
// Sender - ������������� �������, ������� ������ ��� �������
var
  I: Int32;
begin
  for I := 0 to High(FItems) do
  begin
    FItems[I](AMsg);
  end;
  Result := True;
end;

function TAiEvent.Run2(Sender: AId): AError;
{Sender - ������������� �������, ������� ������ ��� �������}
var
  I: Int32;
begin
  for I := 0 to High(FItems2) do
  begin
    FItems2[I](Sender, 0, 0);
  end;
  Result := 0;
end;

function TAiEvent.Sign(Proc: TAIProc): AError;
{�������� �� �������}
var
  I: Int32;
begin
  if not(Assigned(Proc)) then
  begin
    Result := -2;
    Exit;
  end;
  I := Length(FItems);
  SetLength(FItems, I + 1);
  FItems[I] := Proc;
  Result := 0;
end;

function TAiEvent.Sign2(Proc: TAiProc2006): AError;
{�������� �� �������}
var
  I: Int32;
begin
  if not(Assigned(Proc)) then
  begin
    Result := -1;
    Exit;
  end;
  I := Length(FItems2);
  SetLength(FItems2, I + 1);
  FItems2[I] := Proc;
  Result := 0;
end;

function TAiEvent.UnSign(Proc: TAIProc): AError;
{������� �� �������}
{var
  I: Int32;}
begin
  Result := -1;
  {if not(Assigned(Proc)) then Exit;
  for I := 0 to High(FItems) do begin
    if Proc = FItems[I] then begin
      FItems[I] := FItems[High(FItems)];
      SetLength(FItems, High(FItems));
      Result := 0;
    end;
  end;}
end;

function TAiEvent.UnSign2(Proc: TAiProc2006): AError;
{������� �� �������}
{var
  I: Int32;}
begin
  Result := -1;
  {if not(Assigned(Proc)) then Exit;
  for I := 0 to High(FItems) do begin
    if Proc = FItems[I] then begin
      FItems[I] := FItems[High(FItems)];
      SetLength(FItems, High(FItems));
      Result := 0;
    end;
  end;}
end;

// TEventAI --------------------------------------------------------------------

function TEventAI.Connect(Proc: TAIProc): WordBool;
begin
  // ...
  Result := False;
end;

function TEventAI.Disconnect(Proc: TAIProc): WordBool;
begin
  // ...
  Result := False;
end;

function TEventAI.Run(const AMsg: WideString): WordBool;
begin
  // ...
  Result := False;
end;

end.
