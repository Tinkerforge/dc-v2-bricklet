Imports System
Imports System.Threading
Imports Tinkerforge

Module ExampleCallback
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change XYZ to the UID of your DC Bricklet 2.0

    ' Use velocity reached callback to swing back and forth
    ' between full speed forward and full speed backward
    Sub VelocityReachedCB(ByVal sender As BrickletDCV2, ByVal velocity As Short)
        If velocity = 32767 Then
            Console.WriteLine("Velocity: Full speed forward, now turning backward")
            sender.SetVelocity(-32767)
        Else If velocity = -32767 Then
            Console.WriteLine("Velocity: Full speed backward, now turning forward")
            sender.SetVelocity(32767)
        Else
            ' Can only happen if another program sets velocity
            Console.WriteLine("Error")
        End If
    End Sub

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim dc As New BrickletDCV2(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' The acceleration has to be smaller or equal to the maximum
        ' acceleration of the DC motor, otherwise the velocity reached
        ' callback will be called too early
        dc.SetMotion(4096, _
                     16384) ' Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping
        dc.SetVelocity(32767) ' Full speed forward (100 %)

        ' Register velocity reached callback to subroutine VelocityReachedCB
        AddHandler dc.VelocityReachedCallback, AddressOf VelocityReachedCB

        ' Enable motor power
        dc.SetEnabled(True)

        Console.WriteLine("Press key to exit")
        Console.ReadLine()

        dc.SetVelocity(0) ' Stop motor before disabling motor power
        Thread.Sleep(2000) ' Wait for motor to actually stop: velocity (100 %) / decceleration (50 %/s) = 2 s
        dc.SetEnabled(False) ' Disable motor power

        ipcon.Disconnect()
    End Sub
End Module
