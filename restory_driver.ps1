# Escolha a pasta do backup de driver

Add-Type -AssemblyName System.Windows.Forms
$dialog = New-Object System.Windows.Forms.FolderBrowserDialog
$dialog.Description = "Selecione a pasta desejada"

# Exibe a caixa de diálogo e captura o clique do usuário
if ($dialog.ShowDialog() -eq "OK") {
    $pastaSelecionada = $dialog.SelectedPath
    Write-Host "Pasta escolhida: $pastaSelecionada" -ForegroundColor Green
    pnputil /add-driver "$pastaSelecionada\*.inf" /subdirs /install
    
} else {
    Write-Host "Seleção cancelada." -ForegroundColor Red
}

    Pause