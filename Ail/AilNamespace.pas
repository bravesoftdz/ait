﻿{**
@Abstract(Ai lang namespace)
@Author(Prof1983 prof1983@ya.ru)
@Created(11.08.2007)
@LastMod(10.07.2012)
@Version(0.5)
}
unit AilNamespace;

interface

uses
  AilClass, AilIndividual; {AilMethodObj, AilProperty;}

type
  TAilNamespace = class
  private
    FClasses: array of TAilClass;
    FIndividuals: array of TAilIndividual;
    //FProperties: array of TAilProperty;
    //FMethods: array of TAilMethod;
  public
    Name: WideString;
    function AddClass(AssistantClass: TAilClass): Integer;
    function AddIndividual(Individual: TAilIndividual): Integer;
  end;

implementation

{ TAilNamespace }

function TAilNamespace.AddClass(AssistantClass: TAilClass): Integer;
begin
  Result := Length(FClasses);
  SetLength(FClasses, Result + 1);
  FClasses[Result] := AssistantClass;
end;

function TAilNamespace.AddIndividual(Individual: TAilIndividual): Integer;
begin
  Result := Length(FIndividuals);
  SetLength(FIndividuals, Result + 1);
  FIndividuals[Result] := Individual;
end;

end.
