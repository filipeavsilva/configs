rem install stuff
choco install git
choco install ConEmu
choco install winmerge
choco install python
choco install Everything
choco install greenshot
choco install putty
choco install spotify
choco install toastify
choco install notepadplusplus
choco install dropbox
choco install keepass
choco install 1password
choco install vim
choco install clipx
choco install autohotkey

rem get my configs
git clone https://github.com/Darchangel/configs.git %home%\configs
mklink %home%\configs\vimrc %home%\_vimrc
mklink %home%\configs\Autohotkey.ahk %USERPROFILE%\Documents\Autohotkey.ahk
