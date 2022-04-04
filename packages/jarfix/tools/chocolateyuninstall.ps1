$shortcutPath = Join-Path $env:APPDATA "Microsoft\Windows\Start Menu\Programs\Jarfix.lnk"

Remove-Item -Path $shortcutPath -Force -ErrorAction SilentlyContinue