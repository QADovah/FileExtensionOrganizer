# Organizador de Archivos por Extensión

Una herramienta poderosa y versátil para organizar archivos automáticamente en carpetas, ya sea por extensión o por tipo de archivo.

## 🎯 Características

- ✨ **Interfaz gráfica moderna** - GUI desarrollada con WPF
- 📁 **Organización flexible** - Organiza por extensión o por tipo de archivo
- 🔄 **Dos modos de operación**:
  - **Copiar**: Copia archivos manteniendo los originales
  - **Mover**: Traslada archivos al destino
- 🌓 **Modo oscuro/claro** - Toggle para cambiar entre temas
- 📊 **Registro en tiempo real** - Visualiza todas las operaciones realizadas
- 🎨 **Categorización inteligente** - Agrupa archivos en 7 categorías principales:
  - 🖼️ Imágenes (jpg, png, gif, bmp, svg, webp, tiff, ico)
  - 📄 Documentos (pdf, doc, docx, xls, xlsx, ppt, pptx, txt, rtf, odt, ods, odp)
  - 🎬 Vídeos (mp4, avi, mkv, mov, flv, wmv, webm, m4v, 3gp, mpg, mpeg)
  - 🎵 Música (mp3, wav, flac, aac, ogg, wma, m4a, opus, aiff)
  - 📦 Comprimidos (zip, rar, 7z, tar, gz, bz2, iso)
  - ⚙️ Ejecutables (exe, msi, bat, sh, cmd, ps1, app, dmg)
  - 📋 Otros (extensiones no categorizadas)

## 🚀 Requisitos

- Windows 7 o superior
- PowerShell 5.1 o superior
- .NET Framework 4.5 o superior

## 📥 Instalación

1. Clona el repositorio:
```bash
git clone https://github.com/QADovah/FileExtensionOrganizer.git
cd FileExtensionOrganizer
```

2. Ejecuta el script:
```powershell
.\OrganizadorFinal_GUI.ps1
```

## 💻 Uso

### Interfaz Gráfica

1. **Seleccionar carpeta de origen**:
   - Haz clic en "Buscar…" junto a "Carpeta de Origen"
   - Selecciona la carpeta que deseas organizar

2. **Seleccionar carpeta de destino**:
   - Haz clic en "Buscar…" junto a "Carpeta de Destino"
   - Elige dónde deseas organizar los archivos

3. **Configurar opciones**:
   - ☑️ Marca "Conservar archivos en ubicación original" para copiar (por defecto mueve)
   - Elige el modo de organización:
     - **Por Extensión**: Crea carpetas con nombres de extensión (.jpg, .pdf, etc.)
     - **Por Tipo de Archivo**: Crea carpetas por categoría (Imágenes, Documentos, etc.)

4. **Iniciar organización**:
   - Haz clic en "Iniciar Organización"
   - Observa el registro de operaciones en tiempo real

### Script de línea de comandos

También puedes usar el script `OrganizadorLogica.ps1` directamente:

```powershell
.\OrganizadorLogica.ps1 -Origen "C:\Descargas" -Destino "C:\MisArchivos" -Conservar $true -OrdenarPorTipo $true
```

## 🎨 Tema

- Cambia entre **Modo Oscuro** y **Modo Claro** con el toggle en la barra superior
- Los cambios de tema se aplican instantáneamente a toda la interfaz

## ℹ️ Información

Haz clic en el botón **ℹ️** en la esquina superior derecha para ver:
- Información del proyecto
- Créditos de los autores
- Enlaces al repositorio en GitHub

## 👥 Autores

- **Creado por**: De Zitterkopf
- **Interfaz**: KalDovah
- **Colaboradores**: Mati Cueto

## 📂 Archivos del Proyecto

```
FileExtensionOrganizer/
├── OrganizadorFinal_GUI.ps1      # GUI principal (WPF)
├── OrganizadorLogica.ps1         # Lógica de organización
├── OrganizadorGrafico.bat        # Ejecutable batch para Windows
└── README.md                      # Este archivo
```

## 🔧 Funcionalidades Técnicas

### Validación en tiempo real
- Verifica que la carpeta de origen exista
- Comprueba que la ruta de destino no esté vacía
- El botón "Iniciar Organización" solo se habilita cuando la validación es correcta

### Manejo de errores
- Registro detallado de todas las operaciones
- Mensajes de error claros en caso de problemas
- Resumen de operaciones completadas

### Rendimiento
- Procesa archivos de forma recursiva
- Soporta carpetas con miles de archivos
- Feedback visual en tiempo real

## 💡 Ejemplos de uso

### Ejemplo 1: Organizar descargas por tipo
```
Origen: C:\Users\Usuario\Downloads
Destino: C:\Users\Usuario\Archivos_Organizados
Modo: Por Tipo de Archivo
Conservar: ✓ (Copia)
```

Resultado:
```
Archivos_Organizados/
├── Imágenes/
│   ├── foto1.jpg
│   ├── foto2.png
│   └── captura.bmp
├── Documentos/
│   ├── contrato.pdf
│   ├── presupuesto.xlsx
│   └── informe.docx
├── Vídeos/
│   └── tutorial.mp4
└── ...
```

### Ejemplo 2: Organizar por extensión
```
Origen: D:\Proyectos
Destino: D:\Proyectos_Organizados
Modo: Por Extensión
Conservar: ✗ (Mueve)
```

Resultado:
```
Proyectos_Organizados/
├── .jpg/
├── .pdf/
├── .mp4/
├── .zip/
└── ...
```

## 🐛 Solución de problemas

### La ventana no aparece
- Verifica que PowerShell se ejecute como administrador
- Comprueba que .NET Framework esté instalado

### No se pueden seleccionar carpetas
- Asegúrate de que tienes permisos de acceso
- Intenta ejecutar PowerShell como administrador

### El script se cierra sin completar
- Revisa que no haya caracteres especiales en las rutas
- Verifica que tengas suficiente espacio en disco

## 📝 Licencia

Este proyecto está disponible bajo licencia MIT.

## 🔗 Enlaces

- [GitHub Repository](https://github.com/QADovah/FileExtensionOrganizer)
- [Reportar problemas](https://github.com/QADovah/FileExtensionOrganizer/issues)

## 📞 Contacto

Para consultas o sugerencias, abre un issue en el repositorio de GitHub.

---

**Última actualización**: Noviembre 2025  
**Versión**: 1.0
