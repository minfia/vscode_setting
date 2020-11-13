@rem �{�X�N���v�g�͊Ǘ��Ҍ����Ŏ��s���邱��

@echo off
setlocal enabledelayedexpansion
cd /d %~dp0

set SCRIPT_DIR=%~dp0
set VSCODE_SETTING_DIR=%APPDATA%\Code\User
set VSCODE_EXTENTION_DIR=%USERPROFILE%\.vscode

@rem setting.json���V���{���b�N�����N�ɂ���
del %VSCODE_SETTING_DIR%\settings.json > nul 2>&1
mklink %VSCODE_SETTING_DIR%\settings.json %SCRIPT_DIR%\settings.json

@rem locale.json���V���{���b�N�����N�ɂ���
del %VSCODE_SETTING_DIR%\locale.json > nul 2>&1
mklink %VSCODE_SETTING_DIR%\locale.json %SCRIPT_DIR%\locale.json

@rem keybindings.json���V���{���b�N�����N�ɂ���
del %VSCODE_SETTING_DIR%\keybindings.json > nul 2>&1
mklink %VSCODE_SETTING_DIR%\keybindings.json %SCRIPT_DIR%keybindings.json

@rem install extention
set EXTENTIONS_FILE=%SCRIPT_DIR%extensions
for /f %%i in (%EXTENTIONS_FILE%) do (
  call code --install-extension %%i
)
call code --list-extensions > extensions

exit 0
