rem install stuff
choco install -y git
choco install -y ConEmu
choco install -y winmerge
choco install -y python
choco install -y Everything
choco install -y greenshot
choco install -y spotify
choco install -y toastify
choco install -y notepadplusplus
choco install -y dropbox
choco install -y keepass
choco install -y vim
choco install -y clipx
choco install -y autohotkey
choco install -y baretail
choco install -y sharpkeys

rem get my configs
"%programfiles(x86)%\Git\bin\git" clone https://github.com/Darchangel/configs.git %homepath%\configs
mkdir %homepath%\.vim
mklink /D %homepath%\vimfiles %homepath%\.vim
mklink %homepath%\_vimrc %homepath%\configs\vimrc
mklink %USERPROFILE%\Documents\Autohotkey.ahk %homepath%\configs\Autohotkey.ahk
mklink %homepath%\.gitconfig %homepath%\configs\gitconfig 
mklink %homepath%\.gitignore_global %homepath%\configs\gitignore_global