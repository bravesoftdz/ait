﻿{**
@Abstract(Интерфейс интерпретатора кода на языке AR)
@Author(Prof1983 prof1983@ya.ru)
@Created(02.01.2006)
@LastMod(24.04.2012)
@Version(0.5)
}
unit AiInterpretatorIntf;

// TODO: Delete safecall

interface

uses
  {AiFrame,} ANodeIntf;

type //** Интерфейс интерпретатора кода на языке AR
  IAiInterpretator = interface {(IAiFrame)}
    //function Run(): Integer; safecall;
    function RunCode(ACode: IProfNode): Integer; safecall;
    //function RunCodeA(ACode: IAICode): Integer; safecall;
    //function Start(): WordBool; safecall;
    //function Stop(): WordBool; safecall;
  end;

type //** Интерфейс интерпретатора кода на языке AR
  IAIInterpretator2 = interface(IAiInterpretator)
    function Run(): Integer; safecall;
    function Start(): WordBool; safecall;
    function Stop(): WordBool; safecall;
  end;

implementation

end.
