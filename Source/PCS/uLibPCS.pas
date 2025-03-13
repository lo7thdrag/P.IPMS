unit uLibPCS;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Math;

type
  TBtnPower = class

  public
    isOn : Boolean;
    isOff  : Boolean;

  constructor Create();


end;
//----------------------------------------------------------------

  TPCSInterface = class
    public
      Alarm_Accept, Stop_Horn, Lamp_Test, MCR_PS, MCR_SB,
      Bridge_PS, Bridge_SB, Transit, Manoeuvre : TBtnPower;

    constructor Create();
  end;
//-----------------------------------------------------------------
  TPCSManager = class
    public
      ThePCS : TPCSInterface;


    constructor Create();
  end;
//--------------------------------------------------------------------

implementation

uses uGeneralPanel,uPSPanel, uSBPanel;


constructor TBtnPower.Create ();
begin
  isOn  := False;
  isOff := False;
end;


constructor TPCSInterface.create ();
begin

end;

constructor TPCSManager.create ();
begin

end;

end.
