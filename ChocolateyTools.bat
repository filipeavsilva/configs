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
choco install vim
choco install clipx
choco install autohotkey
choco install baretail

rem get my configs
"%programfiles(x86)%\Git\bin\git" clone https://github.com/Darchangel/configs.git %homepath%\configs
mkdir %homepath%\.vim
mklink /D %homepath%\vimfiles %homepath%\.vim
mklink %homepath%\_vimrc %homepath%\configs\vimrc
mklink %USERPROFILE%\Documents\Autohotkey.ahk %homepath%\configs\Autohotkey.ahk
