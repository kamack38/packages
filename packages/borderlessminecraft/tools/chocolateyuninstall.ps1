$shortcutPath = Join-Path $env:APPDATA "Microsoft\Windows\Start Menu\Programs\BorderlessMinecraft.lnk"

Remove-Item -Path $shortcutPath -Force -ErrorAction SilentlyContinue