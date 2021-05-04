Imports System
Imports System.Threading
Imports Tinkerforge

Module ExampleConfiguration
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change XYZ to the UID of your DC Bricklet 2.0

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim dc As New BrickletDCV2(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        dc.SetDriveMode(BrickletDCV2.DRIVE_MODE_DRIVE_COAST)
        dc.SetPWMFrequency(10000) ' Use PWM frequency of 10 kHz
        dc.SetMotion(4096, _
                     16384) ' Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping
        dc.SetVelocity(32767) ' Full speed forward (100 %)
        dc.SetEnabled(True) ' Enable motor power

        Console.WriteLine("Press key to exit")
        Console.ReadLine()

        dc.SetVelocity(0) ' Stop motor before disabling motor power
        Thread.Sleep(2000) ' Wait for motor to actually stop: velocity (100 %) / decceleration (50 %/s) = 2 s
        dc.SetEnabled(False) ' Disable motor power

        ipcon.Disconnect()
    End Sub
End Module
