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

Page directory
Page instfiles

UninstPage uninstConfirm
UninstPage instfiles

Section "OutlookURLScheme (required)"
  SetOutPath $INSTDIR

  WriteRegStr HKLM "SOFTWARE\OutlookURLScheme" "Install_Dir" "$INSTDIR"

  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\OutlookURLScheme" "DisplayName" "Outlook URL Scheme"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\OutlookURLScheme" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\OutlookURLScheme" "NoModify" 1
  WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\OutlookURLScheme" "NoRepair" 1

  WriteRegStr HKCR "x-outlook" "" "URL:Outlook Open Shell"
  WriteRegStr HKCR "x-outlook" "URL Protocol" ""
  WriteRegStr HKCR "x-outlook\DefaultIcon" "" "C:\Windows\notepad.exe,1"
  WriteRegStr HKCR "x-outlook\shell\open\command" "" '"C:\Windows\notepad.exe"'

  WriteUninstaller "uninstall.exe"
SectionEnd

Section "Uninstall"
  Delete $INSTDIR\uninstall.exe

  DeleteRegKey HKCR "x-outlook"
  DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\OutlookURLScheme"
  DeleteRegKey HKLM "SOFTWARE\OutlookURLScheme"

  RMDir "$INSTDIR"
SectionEnd