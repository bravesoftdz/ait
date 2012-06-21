{**
@Abstract(AiNamedFrameObj)
@Author(Prof1983 prof1983@ya.ru)
@Created(21.11.2011)
@LastMod(21.06.2012)
@Version(0.5)
}
unit AiNamedFrameObj;

interface

uses
  AiFrameObj;

type
  {** ����� � ���������, ���������� � ��������� }
  TAiNamedFrameObject = class(TAiFrameObject)
  protected
    {** �������� ������ }
    FDescription: WideString;
    {** �������� �������� ������ }
    FName: WideString;
    {** ��������� ��� ����������� }
    FTitle: WideString;
  public
    //function LoadFromXml(Xml: IXmlNode): WordBool; override; deprecated; // Use AiNamedFrame_LoadFromXml()
    //function SaveToXml(Xml: IXmlNode): WordBool; override; deprecated; // Use AiNamedFrame_SaveToXml()
  published
    {** �������� ������ }
    property Description: WideString read FDescription write FDescription;
    {** �������� �������� ������ }
    property Name: WideString read FName write FName;
    {** ��������� ��� ����������� }
    property Title: WideString read FTitle write FTitle;
  end;
  TAiNamedFrame = TAiNamedFrameObject;
  TAiFreimNamed = TAiNamedFrameObject;

implementation

end.
 