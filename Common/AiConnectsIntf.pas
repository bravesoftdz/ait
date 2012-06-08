{**
@Abstract(AiConnects interface)
@Author(Prof1983 prof1983@ya.ru)
@Created(08.06.2012)
@LastMod(08.06.2012)
@Version(0.5)
}
unit AiConnectsIntf;

interface

uses
  XmlIntf,
  ATypes, AiBase;

type
  {** ��������� ��� ������ �� ������� ������ }
  IAiConnects = interface
      {** �������� Id ��������� ������ }
    function GetConnect(AIndex: Integer): TAId;
      {** �������� ����������� ������ }
    function GetCountConnects(): Integer;
      {** �������� Id ������-��������� }
    function GetFreimId(): TAId;
      {** ������ Id ���������� ������ }
    procedure SetConnect(AIndex: Integer; Value: TAId);
      {** ������ Id ���������� ������ }
    function SetConnectA(Index: Integer; Value: TAId): TError;
      {** ������ Id ������-��������� }
    procedure SetFreimId(Id: TAId);

      {** �������� ����� }
    function AddConnect(Connect: TAId): Integer;
      {** �������� ������ ������ }
    function Clear(): TError;
      {** ������� ����� �� Id }
    function DeleteConnect(Id: TAId): TError;
      {** ������� ����� �� ������� }
    function DeleteConnectByIndex(Index: Integer): TError;
      {** �������� ������ ����� �� Id }
    function GetConnectIndex(Id: TAId): Integer;
      {** ��������� ������ ������ �� ����� }
    function LoadFromFile(const FileName: WideString): TError;
      {** ��������� ������ ������ �� XML }
    function LoadFromXml(const AXml: IXmlNode): WordBool;
      {** ��������� ������ ������ � ���� }
    function SaveToFile(const FileName: WideString): WordBool;
      {** ��������� ������ ������ � XML }
    function SaveToXml(const AXml: IXmlNode): WordBool;

    property Connects[AIndex: Integer]: TAId read GetConnect write SetConnect;
    property FreimId: TAId read GetFreimId write SetFreimId;
  end;

implementation

end.
