{**
@Abstract(AiAgentProcess object)
@Author(Prof1983 prof1983@ya.ru)
@Created(04.07.2012)
@LastMod(04.07.2012)
@Version(0.5)
}
unit AiAgentProcessObj;

interface

uses
  AMessagesObj,
  AiAgentThread, AiProcessObj;

type
  //** ������� ���������� ������ ��� �������
  TAiAgentProcessObject = class(TAiProcessObject)
  public
    function GetMessages(): TAMessages;
    procedure SetMessages(Value: TAMessages);
  protected
    //** ����������� ��� ��������
    procedure DoCreate(); override;
  public
    //** ������� ���������
    property Messages: TAMessages read GetMessages write SetMessages;
  end;

implementation

{ TAiAgentProcessObject }

procedure TAiAgentProcessObject.DoCreate();
begin
  if not(Assigned(FThread)) then
    FThread := TAgentThread.Create();
  inherited DoCreate();
end;

function TAiAgentProcessObject.GetMessages(): TAMessages;
begin
  Result := TAgentThread(FThread).GetMessages();
end;

procedure TAiAgentProcessObject.SetMessages(Value: TAMessages);
begin
  TAgentThread(FThread).SetMessages(Value);
end;

end.
