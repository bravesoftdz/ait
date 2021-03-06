﻿{**
@Abstract(AiFact)
@Author(Prof1983 prof1983@ya.ru)
@Created(02.05.2007)
@LastMod(27.06.2012)
@Version(0.5)

Про TAIFact. Я думаю что в TAIFact должны быть свойства:
<субъект>   (Object)
<свойство>  (Slot)
<отношение> (Relation)
<значение>  (Value)
Что будет означать (в зависимости от <отношение>)
У <субъекта> определенное <свойство> равно <значение> - это факт.
У <субъекта> определенное <свойство> не равно <значение> - это факт.
У <субъекта> определенное <свойство> больше <значение> - это факт.
У <субъекта> определенное <свойство> меньше <значение> - это факт.
У <субъекта> определенное <свойство> больше или равно <значение> - это факт.
У <субъекта> определенное <свойство> меньше или равно <значение> - это факт.
У <субъекта> определенное <свойство> является частью <значение> - это факт.
У <субъекта> определенное <свойство> является целым для части <значение> - это факт.
У <субъекта> определенное <свойство> является подклассом <значение> - это факт.
У <субъекта> определенное <свойство> оказывает воздействие <значение> - это факт.
У <субъекта> определенное <свойство> похоже на <значение> - это факт.
}
unit AiFactImpl;

interface

uses
  AiFrameImpl, AiFrameIntf, AiSlotIntf;

type
  TAiRelation = Integer;
const
  AI_RELATION_EQUAL     = $01;
  AI_RELATION_NOT_EQUAL = $02;

type
  TAIFact = class(TAIFrame)
  private
    //** Определенный объект
    FObject: IAIFrame;
    FRelation: TAIRelation;
    //** Определенный слот объекта
    FSlot: IAISlot;
    //** Определенное значение слота
    FValue: Variant;
  public
    //** Определенный объект
    property Obj: IAIFrame read FObject write FObject;
    //** Определенный слот объекта
    property Slot: IAISlot read FSlot write FSlot;
    //** Определенное значение слота
    property Value: Variant read FValue write FValue;
  end;

implementation

end.
