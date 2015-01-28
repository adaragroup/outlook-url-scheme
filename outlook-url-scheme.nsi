Name "Outlook URL Scheme"

OutFile "outlook-url-scheme_1.0.0.0.exe"

InstallDir "$PROGRAMFILES\OutlookURLScheme"
RequestExecutionLevel admin
InstallDirRegKey HKLM "SOFTWARE\OutlookURLScheme" "Install_Dir"

VIProductVersion "1.0.0.0"
VIAddVersionKey "ProductName" "Outlook URL Scheme"
VIAddVersionKey "LegalCopyright" "Outlook URL Scheme"
VIAddVersionKey "FileDescription" "Outlook URL Scheme"
VIAddVersionKey "FileVersion" "1.0.0.0"

Page instfiles
UninstPage instfiles

Var OUTLOOKDIR
Function .onInit
  SetRegView 64
  ReadRegStr $OUTLOOKDIR HKLM "SOFTWARE\Microsoft\Office\14.0\Outlook\InstallRoot" "Path"
  SetRegView 32
  IfErrors 0 +3
    MessageBox MB_OK "Microsoft Outlook not found."
    Abort
FunctionEnd

Section "OutlookURLScheme (required)"
  SetOutPath $INSTDIR

  WriteRegStr HKLM "SOFTWARE\OutlookURLScheme" "Install_Dir" "$INSTDIR"

  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\OutlookURLScheme" "DisplayName" "Outlook URL Scheme"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\OutlookURLScheme" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\OutlookURLScheme" "NoModify" 1
  WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\OutlookURLScheme" "NoRepair" 1

  SetRegView 64
  WriteRegStr HKCR "x-outlook" "" "URL:Outlook Open Shell"
  WriteRegStr HKCR "x-outlook" "URL Protocol" ""
  WriteRegStr HKCR "x-outlook\DefaultIcon" "" "$OUTLOOKDIR\OUTLOOK.EXE,-9403"
  WriteRegStr HKCR "x-outlook\shell\open\command" "" '"$OUTLOOKDIR\OUTLOOK.EXE"'
  SetRegView 32

  WriteUninstaller "uninstall.exe"
SectionEnd

Section "Uninstall"
  Delete $INSTDIR\uninstall.exe

  SetRegView 64
  DeleteRegKey HKCR "x-outlook"
  SetRegView 32

  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\OutlookURLScheme"
  DeleteRegKey HKLM "SOFTWARE\OutlookURLScheme"

  RMDir "$INSTDIR"
SectionEnd
