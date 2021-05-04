program ExampleConfiguration;

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
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your DC Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  dc := TBrickletDCV2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  dc.SetDriveMode(BRICKLET_DC_V2_DRIVE_MODE_DRIVE_COAST);
  dc.SetPWMFrequency(10000); { Use PWM frequency of 10 kHz }
  dc.SetMotion(4096,
               16384); { Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping }
  dc.SetVelocity(32767); { Full speed forward (100 %) }
  dc.SetEnabled(true); { Enable motor power }

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
