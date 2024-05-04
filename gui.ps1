##[Ps1 To Exe]
##
##Kd3HDZOFADWE8uO1
##Nc3NCtDXTlaDjofG5iZk2UPhTWUqUuGeqr2zy5GA0uv+ryzXBLgRW0F1k2TaC0S5FNATW/QbtZ9DAEtkJvEEgg==
##Kd3HFJGZHWLWoLaVvnQnhQ==
##LM/RF4eFHHGZ7/K1
##K8rLFtDXTiW5
##OsHQCZGeTiiZ4NI=
##OcrLFtDXTiW5
##LM/BD5WYTiiZ4tI=
##McvWDJ+OTiiZ4tI=
##OMvOC56PFnzN8u+Vs1Q=
##M9jHFoeYB2Hc8u+Vs1Q=
##PdrWFpmIG2HcofKIo2QX
##OMfRFJyLFzWE8uK1
##KsfMAp/KUzWJ0g==
##OsfOAYaPHGbQvbyVvnQX
##LNzNAIWJGmPcoKHc7Do3uAuO
##LNzNAIWJGnvYv7eVvnQX
##M9zLA5mED3nfu77Q7TV64AuzAgg=
##NcDWAYKED3nfu77Q7TV64AuzAgg=
##OMvRB4KDHmHQvbyVvnQX
##P8HPFJGEFzWE8tI=
##KNzDAJWHD2fS8u+Vgw==
##P8HSHYKDCX3N8u+Vgw==
##LNzLEpGeC3fMu77Ro2k3hQ==
##L97HB5mLAnfMu77Ro2k3hQ==
##P8HPCZWEGmaZ7/K1
##L8/UAdDXTlaDjoLH7DNl5EauZGEna9annrmow425w8nkqSrUTKY1WUR7nyr9EEKyV85DB6Fb5J9HBkt9YaNau47eFPOgQ6sJk/d2ZOuxrrclBV/KrZbs1nk=
##Kc/BRM3KXhU=
##
##
##fd6a9f26a06ea3bc99616d4851b372ba
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object Windows.Forms.Form
$form.Text = "MOZ sms"
$form.Size = New-Object Drawing.Size(500, 300)
$form.BackColor = '#000000'
$form.Icon = New-Object system.drawing.icon("C:\Users\hooma\Desktop\Martin-Berube-Food-Banana.256.ico")

$label = New-Object Windows.Forms.Label
$label.Text = "MOZ sms"
$label.AutoSize = $true
$label.ForeColor = "Green"
$label.Location = New-Object System.Drawing.Point(160, 20)
$label.Font = New-Object Drawing.Font("Microsoft Sans Serif", 24, [Drawing.FontStyle]::Bold)
$form.Controls.Add($label)

$label2 = New-Object Windows.Forms.Label
$label2.Text = "Enter Number"
$label2.ForeColor = "Gray"
$label2.AutoSize = $true
$label2.Location = New-Object System.Drawing.Point(190, 68)
$label2.Font = New-Object Drawing.Font("Microsoft Sans Serif", 10, [Drawing.FontStyle]::Bold)
$form.Controls.Add($label2)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(150, 100)
$textBox.Size = New-Object System.Drawing.Size(180)
$textBox.BackColor = 'white'
$textBox.Text = "+98"
$textBox.Font = New-Object Drawing.Font("Microsoft Sans Serif", 15, [Drawing.FontStyle]::Bold)
$form.Controls.Add($textBox)

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(180,150)
$Button.Size = New-Object System.Drawing.Size(120,50)
$Button.Font = New-Object Drawing.Font("Microsoft Sans Serif", 13, [Drawing.FontStyle]::Bold)
$Button.Padding = New-Object System.Windows.Forms.Padding(5)
$Button.Text = "Start"
$Button.ForeColor = 'black'
$Button.BackColor = 'white'
$Form.Controls.Add($Button)
$Button.Add_Click({
    $inp = +$textBox.Text
    Invoke-WebRequest -Uri https://api.torob.com/a/phone/send-pin/?phone_number=$inp
    [System.Windows.Forms.MessageBox]::Show("sending : $inp")
})

[Windows.Forms.Application]::Run($form)
