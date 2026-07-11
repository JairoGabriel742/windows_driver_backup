# Esse programa faz um backup dos seus drivers do pc para uma pasta escolhida pelo usuario

Add-Type -AssemblyName System.Windows.Forms
$dialog = New-Object System.Windows.Forms.FolderBrowserDialog
$dialog.Description = "Selecione a pasta desejada"

# Exibe a caixa de diálogo e captura o clique do usuário
if ($dialog.ShowDialog() -eq "OK") {
    $pastaSelecionada = $dialog.SelectedPath
    Write-Host "Pasta escolhida: $pastaSelecionada" -ForegroundColor Green
    Export-WindowsDriver -Online -Destination "$pastaSelecionada"
} else {
    Write-Host "Seleção cancelada." -ForegroundColor Red
}