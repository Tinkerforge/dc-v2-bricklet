program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletDCV2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    dc: TBrickletDCV2;
  public
    procedure VelocityReachedCB(sender: TBrickletDCV2; const velocity: smallint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your DC Bricklet 2.0 }

var
  e: TExample;

{ Use velocity reached callback to swing back and forth
  between full speed forward and full speed backward }
procedure TExample.VelocityReachedCB(sender: TBrickletDCV2; const velocity: smallint);
begin
  if (velocity = 32767) then begin
    WriteLn('Velocity: Full speed forward, now turning backward');
    sender.SetVelocity(-32767);
  end
  else if (velocity = -32767) then begin
    WriteLn('Velocity: Full speed backward, now turning forward');
    sender.SetVelocity(32767);
  end
  else begin
    WriteLn('Error'); { Can only happen if another program sets velocity }
  end;
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  dc := TBrickletDCV2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { The acceleration has to be smaller or equal to the maximum
    acceleration of the DC motor, otherwise the velocity reached
    callback will be called too early }
  dc.SetMotion(4096,
               16384); { Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping }
  dc.SetVelocity(32767); { Full speed forward (100 %) }

  { Register velocity reached callback to procedure VelocityReachedCB }
  dc.OnVelocityReached := {$ifdef FPC}@{$endif}VelocityReachedCB;

  { Enable motor power }
  dc.SetEnabled(true);

  WriteLn('Press key to exit');
  ReadLn;

  dc.SetVelocity(0); { Stop motor before disabling motor power }
  Sleep(2000); { Wait for motor to actually stop: velocity (100 %) / decceleration (50 %/s) = 2 s }
  dc.SetEnabled(false); { Disable motor power }

  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
