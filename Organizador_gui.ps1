Add-Type -AssemblyName PresentationFramework, System.Windows.Forms

# ===========================
# DEFINICIÓN DE LA VENTANA MODAL ACERCA DE
# ===========================

$xamlAbout = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Acerca de"
        Width="450"
        Height="350"
        WindowStartupLocation="CenterOwner"
        Background="#F5F5F5"
        Foreground="#000000"
        FontFamily="Segoe UI"
        FontSize="12"
        ResizeMode="NoResize">
    
    <Grid>
        <StackPanel Margin="25" VerticalAlignment="Top">
            <TextBlock Text="Organizador de Archivos por Extensión" 
                       FontSize="18" 
                       FontWeight="Bold" 
                       Foreground="#0078D4"
                       Margin="0,0,0,15"/>
            
            <TextBlock Text="Una herramienta para organizar archivos automáticamente por tipo o extensión." 
                       TextWrapping="Wrap"
                       Foreground="#333333"
                       Margin="0,0,0,20"/>
            
            <TextBlock FontWeight="Bold" Foreground="#1F1F1F" Margin="0,0,0,10">Autores:</TextBlock>
            
            <TextBlock Text="👨‍💻 Creado por: De Zitterkopf" Foreground="#555555" Margin="10,0,0,5"/>
            <TextBlock Text="🎨 Interfaz: KalDovah" Foreground="#555555" Margin="10,0,0,5"/>
            <TextBlock Text="🤝 Colaborador: Mati Cueto" Foreground="#555555" Margin="10,0,0,15"/>
            
            <TextBlock Foreground="#666666" Margin="0,0,0,15">
                <Run Text="📂 Repositorio: "/>
                <Hyperlink x:Name="LinkAboutRepo" 
                           Foreground="#0078D4" 
                           TextDecorations="Underline"
                           NavigateUri="https://github.com/QADovah/FileExtensionOrganizer">
                    FileExtensionOrganizer
                </Hyperlink>
            </TextBlock>
            
            <Button x:Name="BtnCerrarAbout" 
                    Content="Cerrar" 
                    Padding="15,8" 
                    FontSize="12"
                    Background="#0078D4" 
                    Foreground="White"
                    Cursor="Hand"
                    HorizontalAlignment="Right"
                    Width="100"/>
        </StackPanel>
    </Grid>
</Window>
"@

# ===========================
# DEFINICIÓN DE LA INTERFAZ XAML PRINCIPAL
# ===========================

$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Organizador de Archivos por Extensión"
        Width="680"
        Height="750"
        MinWidth="680"
        MinHeight="500"
        WindowStartupLocation="CenterScreen"
        Background="#F5F5F5"
        Foreground="#000000"
        FontFamily="Segoe UI"
        FontSize="12">
    
    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
        </Grid.RowDefinitions>
        
        <!-- Barra Superior con Toggle Modo Oscuro -->
        <Border Grid.Row="0" Background="#FFFFFF" BorderBrush="#E0E0E0" BorderThickness="0,0,0,1" Padding="20,12">
            <Grid>
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="*"/>
                    <ColumnDefinition Width="Auto"/>
                </Grid.ColumnDefinitions>
                
                <TextBlock Grid.Column="0" Text="Organizador de Archivos por Extensión" 
                           FontSize="16" 
                           FontWeight="Bold" 
                           Foreground="#1F1F1F"
                           VerticalAlignment="Center"/>
                
                <StackPanel Grid.Column="1" Orientation="Horizontal" VerticalAlignment="Center">
                    <TextBlock Text="Modo Oscuro:" Foreground="#666666" VerticalAlignment="Center" Margin="0,0,8,0"/>
                    <ToggleButton x:Name="ToggleModoOscuro" 
                                  Width="50" 
                                  Height="24"
                                  Background="#D0D0D0"
                                  Foreground="White"
                                  FontSize="10"
                                  FontWeight="Bold"
                                  Content="OFF"
                                  Cursor="Hand"
                                  Margin="0,0,12,0"/>
                    <Button x:Name="BtnAcercaDe" 
                            Content="ℹ️" 
                            Padding="8,4" 
                            FontSize="14"
                            Background="#E8E8E8" 
                            Foreground="#0078D4"
                            Cursor="Hand"
                            Width="35"
                            Height="24"
                            ToolTip="Acerca de"/>
                </StackPanel>
            </Grid>
        </Border>
        
        <!-- Contenido Principal -->
        <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto">
            <StackPanel x:Name="MainStackPanel" Margin="20" VerticalAlignment="Top">
                
                <!-- Sección Carpeta Origen -->
                <Border BorderBrush="#E0E0E0" BorderThickness="1" CornerRadius="4" Padding="12" Margin="0,0,0,15" Background="#FFFFFF">
                    <StackPanel>
                        <TextBlock Text="Carpeta ORIGEN" FontWeight="SemiBold" Foreground="#0078D4" Margin="0,0,0,8"/>
                        <Grid>
                            <Grid.ColumnDefinitions>
                                <ColumnDefinition Width="*"/>
                                <ColumnDefinition Width="Auto"/>
                            </Grid.ColumnDefinitions>
                            <TextBox x:Name="TextBoxOrigen" 
                                     Grid.Column="0"
                                     Padding="10" 
                                     Background="#FFFFFF" 
                                     BorderBrush="#D0D0D0" 
                                     BorderThickness="1"
                                     VerticalAlignment="Center"
                                     Foreground="#1F1F1F"
                                     TextWrapping="Wrap"/>
                            <Button x:Name="BtnBuscarOrigen" 
                                    Grid.Column="1"
                                    Content="Buscar…" 
                                    Padding="15,5" 
                                    Margin="10,0,0,0"
                                    Background="#0078D4" 
                                    Foreground="White"
                                    FontWeight="SemiBold"
                                    Cursor="Hand"/>
                        </Grid>
                    </StackPanel>
                </Border>
                
                <!-- Sección Carpeta Destino -->
                <Border BorderBrush="#E0E0E0" BorderThickness="1" CornerRadius="4" Padding="12" Margin="0,0,0,15" Background="#FFFFFF">
                    <StackPanel>
                        <TextBlock Text="Carpeta DESTINO" FontWeight="SemiBold" Foreground="#0078D4" Margin="0,0,0,8"/>
                        <Grid>
                            <Grid.ColumnDefinitions>
                                <ColumnDefinition Width="*"/>
                                <ColumnDefinition Width="Auto"/>
                            </Grid.ColumnDefinitions>
                            <TextBox x:Name="TextBoxDestino" 
                                     Grid.Column="0"
                                     Padding="10" 
                                     Background="#FFFFFF" 
                                     BorderBrush="#D0D0D0" 
                                     BorderThickness="1"
                                     VerticalAlignment="Center"
                                     Foreground="#1F1F1F"
                                     TextWrapping="Wrap"/>
                            <Button x:Name="BtnBuscarDestino" 
                                    Grid.Column="1"
                                    Content="Buscar…" 
                                    Padding="15,5" 
                                    Margin="10,0,0,0"
                                    Background="#0078D4" 
                                    Foreground="White"
                                    FontWeight="SemiBold"
                                    Cursor="Hand"/>
                        </Grid>
                    </StackPanel>
                </Border>
                
                <!-- Checkbox Conservar Archivos y Radio Buttons -->
                <Border BorderBrush="#E0E0E0" BorderThickness="1" CornerRadius="4" Padding="12" Margin="0,0,0,15" Background="#FFFFFF">
                    <StackPanel>
                        <CheckBox x:Name="CheckBoxConservar" 
                                  Content="Conservar archivos en la ubicación original" 
                                  FontSize="12"
                                  IsChecked="True"
                                  Foreground="#1F1F1F"
                                  Margin="0,0,0,12"/>
                        <TextBlock Text="Modo de Organización" FontWeight="SemiBold" Foreground="#0078D4" Margin="0,0,0,8"/>
                        <RadioButton x:Name="RadioExtension" 
                                     Content="Ordenar por Extensión" 
                                     FontSize="12"
                                     IsChecked="True"
                                     Foreground="#1F1F1F"
                                     Margin="0,0,0,6"/>
                        <RadioButton x:Name="RadioTipo" 
                                     Content="Ordenar por Tipo de Archivo" 
                                     FontSize="12"
                                     Foreground="#1F1F1F"/>
                    </StackPanel>
                </Border>
                
                <!-- Área de Log -->
                <Border BorderBrush="#E0E0E0" BorderThickness="1" CornerRadius="4" Padding="0" Margin="0,0,0,15" Background="#FFFFFF">
                    <StackPanel>
                        <TextBlock Text="Log de Operaciones" FontWeight="SemiBold" Foreground="#0078D4" Margin="12,12,12,8"/>
                        <TextBox x:Name="TextBoxLog" 
                                 Padding="10"
                                 Background="#F8F8F8"
                                 BorderBrush="#D0D0D0"
                                 BorderThickness="0,1,0,0"
                                 VerticalScrollBarVisibility="Auto"
                                 IsReadOnly="True"
                                 Height="120"
                                 TextWrapping="Wrap"
                                 Foreground="#333333"
                                 FontFamily="Consolas"/>
                    </StackPanel>
                </Border>
                
                <!-- Botón Iniciar -->
                <Button x:Name="BtnIniciar" 
                        Content="Iniciar Organización" 
                        Padding="20,12" 
                        FontSize="14"
                        FontWeight="SemiBold"
                        Background="#C0C0C0" 
                        Foreground="#333333"
                        Cursor="Hand"
                        IsEnabled="False"
                        Margin="0,0,0,15"/>
            </StackPanel>
        </ScrollViewer>
    </Grid>
</Window>
"@

# ===========================
# FUNCIONES AUXILIARES
# ===========================

function Add-LogMessage {
    param(
        [string]$Message,
        [string]$Color = "Black"
    )
    
    $timestamp = Get-Date -Format "HH:mm:ss"
    $fullMessage = "[$timestamp] $Message"
    
    $window.Dispatcher.Invoke({
        $textBoxLog.AppendText($fullMessage + "`n")
        $textBoxLog.ScrollToEnd()
    }, [System.Windows.Threading.DispatcherPriority]::Normal)
}

function Open-FolderDialog {
    param([string]$Title)
    
    $folderDialog = New-Object System.Windows.Forms.FolderBrowserDialog
    $folderDialog.Description = $Title
    $folderDialog.ShowNewFolderButton = $true
    
    $result = $folderDialog.ShowDialog()
    
    if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
        return $folderDialog.SelectedPath
    }
    return $null
}

function Validate-Origen {
    param([string]$Path)
    
    if ([string]::IsNullOrWhiteSpace($Path)) {
        return $false
    }
    
    if (-not (Test-Path -Path $Path -PathType Container)) {
        Add-LogMessage -Message "ERROR: La ruta '$Path' no es una carpeta válida o no existe."
        return $false
    }
    
    return $true
}

function Get-FileType {
    param([string]$Extension)
    
    $extension = $extension.ToLower()
    
    if ($extension -match '^(jpg|jpeg|png|gif|bmp|svg|webp|tiff|ico)$') {
        return "Imágenes"
    }
    if ($extension -match '^(pdf|doc|docx|xls|xlsx|ppt|pptx|txt|rtf|odt|ods|odp)$') {
        return "Documentos"
    }
    if ($extension -match '^(mp4|avi|mkv|mov|flv|wmv|webm|m4v|3gp|mpg|mpeg)$') {
        return "Vídeos"
    }
    if ($extension -match '^(mp3|wav|flac|aac|ogg|wma|m4a|opus|aiff|midi)$') {
        return "Música"
    }
    if ($extension -match '^(zip|rar|7z|tar|gz|bz2|iso)$') {
        return "Comprimidos"
    }
    if ($extension -match '^(exe|msi|bat|sh|cmd|ps1|app|dmg)$') {
        return "Ejecutables"
    }
    
    return "Otros"
}

function Update-ButtonState {
    $origen = $textBoxOrigen.Text.Trim()
    $destino = $textBoxDestino.Text.Trim()
    
    $origenExiste = -not [string]::IsNullOrWhiteSpace($origen) -and (Test-Path -Path $origen -PathType Container)
    $destinoExiste = -not [string]::IsNullOrWhiteSpace($destino)
    
    $btnIniciar.IsEnabled = ($origenExiste -and $destinoExiste)
}

function Start-FileOrganization {
    param(
        [string]$Origen,
        [string]$Destino,
        [bool]$Conservar,
        [bool]$OrdenarPorTipo
    )
    
    Add-LogMessage -Message "Iniciando la organización de archivos (buscando en subcarpetas)..."
    
    $archivosMovidos = 0
    $archivosCopiados = 0
    
    try {
        $archivos = Get-ChildItem -Path $Origen -File -Recurse -ErrorAction Stop
        
        if ($archivos.Count -eq 0) {
            Add-LogMessage -Message "No se encontraron archivos en la carpeta origen."
            return
        }
        
        foreach ($archivo in $archivos) {
            $extension = $archivo.Extension -replace "\.", ""
            
            if ([string]::IsNullOrWhiteSpace($extension)) {
                $extension = "SIN_EXTENSION"
            }
            
            if ($OrdenarPorTipo) {
                $carpetaDestino = Get-FileType -Extension $extension
            } else {
                $carpetaDestino = $extension
            }
            
            $carpetaExtension = Join-Path -Path $Destino -ChildPath $carpetaDestino
            
            if (-not (Test-Path -Path $carpetaExtension)) {
                New-Item -ItemType Directory -Path $carpetaExtension | Out-Null
            }
            
            try {
                if ($Conservar) {
                    Copy-Item -Path $archivo.FullName -Destination $carpetaExtension -Force
                    $archivosCopiados++
                    Add-LogMessage -Message "Copiado: $($archivo.Name) → $carpetaDestino"
                } else {
                    Move-Item -Path $archivo.FullName -Destination $carpetaExtension -Force
                    $archivosMovidos++
                    Add-LogMessage -Message "Movido: $($archivo.Name) → $carpetaDestino"
                }
            } catch {
                Add-LogMessage -Message "ERROR al procesar $($archivo.Name): $_"
            }
        }
        
        Add-LogMessage -Message ""
        if ($Conservar) {
            Add-LogMessage -Message "✓ Se copiaron $archivosCopiados archivo(s)"
        } else {
            Add-LogMessage -Message "✓ Se movieron $archivosMovidos archivo(s)"
        }
        Add-LogMessage -Message "¡Organización de archivos completada!"
        
    } catch {
        Add-LogMessage -Message "ERROR en la operación: $_"
    }
}

# ===========================
# CARGAR LA INTERFAZ XAML
# ===========================

$xmlReader = [System.Xml.XmlReader]::Create([System.IO.StringReader]::new($xaml))
$window = [System.Windows.Markup.XamlReader]::Load($xmlReader)

# Cargar ventana modal Acerca de
$xmlReaderAbout = [System.Xml.XmlReader]::Create([System.IO.StringReader]::new($xamlAbout))
$windowAbout = [System.Windows.Markup.XamlReader]::Load($xmlReaderAbout)

# Obtener referencias a los controles
$textBoxOrigen = $window.FindName("TextBoxOrigen")
$textBoxDestino = $window.FindName("TextBoxDestino")
$textBoxLog = $window.FindName("TextBoxLog")
$checkBoxConservar = $window.FindName("CheckBoxConservar")
$radioExtension = $window.FindName("RadioExtension")
$radioTipo = $window.FindName("RadioTipo")
$btnBuscarOrigen = $window.FindName("BtnBuscarOrigen")
$btnBuscarDestino = $window.FindName("BtnBuscarDestino")
$btnIniciar = $window.FindName("BtnIniciar")
$btnAcercaDe = $window.FindName("BtnAcercaDe")
$toggleModoOscuro = $window.FindName("ToggleModoOscuro")
$mainStackPanel = $window.FindName("MainStackPanel")

# Controles de la ventana modal
$btnCerrarAbout = $windowAbout.FindName("BtnCerrarAbout")
$linkAboutRepo = $windowAbout.FindName("LinkAboutRepo")

# ===========================
# FUNCIÓN PARA CAMBIAR TEMA
# ===========================

function Switch-Theme {
    param([bool]$EsModoOscuro)
    
    if ($EsModoOscuro) {
        $window.Background = "#1E1E1E"
        $window.Foreground = "#FFFFFF"
        $toggleModoOscuro.Background = "#0078D4"
        $toggleModoOscuro.Content = "ON"
        
        foreach ($control in $mainStackPanel.Children) {
            if ($control -is [System.Windows.Controls.Border]) {
                $control.Background = "#2D2D2D"
                $control.BorderBrush = "#404040"
                foreach ($child in $control.Child.Children) {
                    if ($child -is [System.Windows.Controls.TextBlock]) {
                        $child.Foreground = "#FFFFFF"
                    }
                    if ($child -is [System.Windows.Controls.TextBox]) {
                        $child.Background = "#3D3D3D"
                        $child.Foreground = "#FFFFFF"
                        $child.BorderBrush = "#505050"
                    }
                    if ($child -is [System.Windows.Controls.CheckBox]) {
                        $child.Foreground = "#FFFFFF"
                    }
                    if ($child -is [System.Windows.Controls.RadioButton]) {
                        $child.Foreground = "#FFFFFF"
                    }
                    if ($child -is [System.Windows.Controls.Button]) {
                        $child.Background = "#C0C0C0"
                        $child.Foreground = "#333333"
                    }
                }
            }
        }
    } else {
        $window.Background = "#F5F5F5"
        $window.Foreground = "#000000"
        $toggleModoOscuro.Background = "#D0D0D0"
        $toggleModoOscuro.Content = "OFF"
        
        foreach ($control in $mainStackPanel.Children) {
            if ($control -is [System.Windows.Controls.Border]) {
                $control.Background = "#FFFFFF"
                $control.BorderBrush = "#E0E0E0"
                foreach ($child in $control.Child.Children) {
                    if ($child -is [System.Windows.Controls.TextBlock]) {
                        $child.Foreground = "#1F1F1F"
                    }
                    if ($child -is [System.Windows.Controls.TextBox]) {
                        $child.Background = "#FFFFFF"
                        $child.Foreground = "#1F1F1F"
                        $child.BorderBrush = "#D0D0D0"
                    }
                    if ($child -is [System.Windows.Controls.CheckBox]) {
                        $child.Foreground = "#1F1F1F"
                    }
                    if ($child -is [System.Windows.Controls.RadioButton]) {
                        $child.Foreground = "#1F1F1F"
                    }
                    if ($child -is [System.Windows.Controls.Button]) {
                        $child.Background = "#C0C0C0"
                        $child.Foreground = "#333333"
                    }
                }
            }
        }
    }
}

# ===========================
# EVENTOS
# ===========================

$toggleModoOscuro.Add_Click({
    Switch-Theme -EsModoOscuro $toggleModoOscuro.IsChecked
})

# Botón Acerca de
$btnAcercaDe.Add_Click({
    $windowAbout.Owner = $window
    $windowAbout.ShowDialog() | Out-Null
})

# Cerrar ventana modal
$btnCerrarAbout.Add_Click({
    $windowAbout.Close()
})


# Hipervínculo en la ventana modal
$linkAboutRepo.Add_RequestNavigate({
    param($sender, $e)
    Start-Process $e.Uri.AbsoluteUri
    $e.Handled = $true
})

$textBoxOrigen.Add_TextChanged({ Update-ButtonState })
$textBoxDestino.Add_TextChanged({ Update-ButtonState })

$btnBuscarOrigen.Add_Click({
    $ruta = Open-FolderDialog -Title "Selecciona la Carpeta ORIGEN"
    if ($ruta) {
        if (Validate-Origen -Path $ruta) {
            $textBoxOrigen.Text = $ruta
            Add-LogMessage -Message "Carpeta origen seleccionada: $ruta"
            Update-ButtonState
        } else {
            $textBoxOrigen.Text = ""
            Update-ButtonState
        }
    }
})

$btnBuscarDestino.Add_Click({
    $ruta = Open-FolderDialog -Title "Selecciona la Carpeta DESTINO"
    if ($ruta) {
        $textBoxDestino.Text = $ruta
        Add-LogMessage -Message "Carpeta destino seleccionada: $ruta"
        Update-ButtonState
    }
})

$btnIniciar.Add_Click({
    $origen = $textBoxOrigen.Text
    $destino = $textBoxDestino.Text
    $conservar = $checkBoxConservar.IsChecked
    $ordenarPorTipo = $radioTipo.IsChecked
    
    Add-LogMessage -Message "=========================================="
    Add-LogMessage -Message "CONFIRMACIÓN"
    Add-LogMessage -Message "Origen: $origen"
    Add-LogMessage -Message "Destino: $destino"
    Add-LogMessage -Message "=========================================="
    
    Add-LogMessage -Message "Modo: $(if ($conservar) { 'COPIAR (se conservarán en el origen)' } else { 'MOVER (se eliminarán del origen)' })"
    Add-LogMessage -Message "Organización: $(if ($ordenarPorTipo) { 'POR TIPO DE ARCHIVO' } else { 'POR EXTENSIÓN' })"
    Add-LogMessage -Message ""
    
    $btnIniciar.IsEnabled = $false
    Start-FileOrganization -Origen $origen -Destino $destino -Conservar $conservar -OrdenarPorTipo $ordenarPorTipo
    $btnIniciar.IsEnabled = $true
    
    Add-LogMessage -Message ""
    Add-LogMessage -Message "Operación finalizada. Puedes realizar otra organización si lo deseas."
})

# ===========================
# MOSTRAR VENTANA
# ===========================

Add-LogMessage -Message "Aplicación iniciada. Selecciona las carpetas para comenzar."

$window.ShowDialog() | Out-Null
