{**
@Abstract(�������� ��� ������������� ����, ��� ������ � ���������� ������)
@Author(Prof1983 prof1983@ya.ru)
@Created(07.06.2006)
@LastMod(21.06.2012)
@Version(0.5)
}
unit AiPropertyObj;

interface

uses
  ABase, ATypes,
  AiFrameObj, AiSourceUtils;

type
  {** �������� ��� ������������� ����, ��� ������ � ���������� ������ }
  TAiProperty = class(TAiFrameObject)
  protected
    {** �������� ��� ���������. ��������: LayerCount }
    FName: WideString;
    FValue: Variant;
    FValueFreim: TAiFrameObject;
    FValueFreimId: AId;
    function GetName(): WideString;
    function GetValueFreim(): TAiFrameObject;
    procedure SetName(Value: WideString);
    procedure SetValueFreim(Value: TAiFrameObject);
  public
    constructor Create();
  public
    property Name: WideString read GetName write SetName;
    property Value: Variant read FValue;
    property ValueFreim: TAiFrameObject read GetValueFreim write SetValueFreim;
  end;

  {** �������� }
  TAiProperty2006 = class(TAiProperty)
  protected
    {** ������������ �������� ���������. ��������: ����������� ����� � ��������� }
    FCaption: String;
    {** ��� �������� (TAIType) }
    FValueType: AId;
    FValueDefault: TArrayByte;
    {FAId: TAIFreimId;            {������������� ���������(��������) ������� �������. ��� ������������� � ��� �� �������������. ���� <> 0, �� ��������� ��������� �� �����������.}
    {ACount: UIntPtr;            {������ �������. ������ ��� �� �������������.}
    {AName: String;              {��� ���������-�������. ������ ��� ������������� �������.}
  public
    property Caption: String read FCaption write FCaption;
    property ValueType: AId read FValueType write FValueType;
    property ValueDefault: TArrayByte read FValueDefault write FValueDefault;
  end;

  {** �������� ��� �������������� ���� }
  TAiPropertys = class(TAiFrameObject)
  protected
    FParams: array of TAiProperty;
    {** �������� }
    //FPropertys: array of TAiProperty2006;
  protected
    function GetCountParams(): Integer;
    function GetParam(Index: Integer): TAiProperty;
    procedure SetParam(Index: Integer; Param: TAiProperty);
  public
    function AddParam(Param: TAiProperty): Int32;
  public
    property ParamCount: Integer read GetCountParams;
    property Params[Index: Integer]: TAiProperty read GetParam write SetParam;
  end;

  TAiPropertys2006 = array of string;

implementation

{ TAiProperty }

constructor TAiProperty.Create();
begin
  inherited Create();
  FValueFreimId := 0;
end;

function TAiProperty.GetName(): WideString;
begin
  Result := FName;
end;

function TAiProperty.GetValueFreim(): TAiFrameObject;
begin
  if not(Assigned(FValueFreim)) then
  begin
    if (FValueFreimId = 0) or not(Assigned(FValueFreim)) then
    begin
      FValueFreim := TAiFrameObject.Create;
      Result := FValueFreim;
    end
    else
    begin
      FValueFreim := AiSource_GetFrameById(FSource, FValueFreimId);
      Result := FValueFreim;
    end;
  end else Result := FValueFreim;
end;

procedure TAiProperty.SetName(Value: WideString);
begin
  FName := Value;
end;

procedure TAiProperty.SetValueFreim(Value: TAiFrameObject);
begin
  // ...
end;

{ TAiPropertys }

function TAiPropertys.AddParam(Param: TAiProperty): Int32;
begin
  Result := Length(FParams);
  SetLength(FParams, Result + 1);
  FParams[Result] := Param;
end;

function TAiPropertys.GetCountParams(): Integer;
begin
  Result := Length(FParams);
end;

function TAiPropertys.GetParam(Index: Integer): TAiProperty;
begin
  if Index >= UInt32(Length(FParams)) then
    Result := nil
  else
    Result := FParams[Index];
end;

procedure TAiPropertys.SetParam(Index: Integer; Param: TAiProperty);
begin
  if (Index >= 0) and (Index < Length(FParams)) then
    FParams[Index] := Param;
end;

end.
