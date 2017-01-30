# ConEmu optimized for Git-Win-SDK install instructions
## 1. Install [Git-sdk-windows](https://github.com/git-for-windows/build-extra/releases/tag/git-sdk-1.0.3)
* Install into `\\%USERPROFILE%\\Git` to avoid problems with white space

  - run `setup-git-sdk.bat` in the 7zip file in a cmd shell.
  - Run `pacman -S man-db` and any other additional packages. Also run `mandb -cd` post install
* **Add path for git and git-core, e.g. `~/Git/usr/bin` and `~/Git/mingw64/libexec/git-core` into Windows Path**
  - Run `git config --global credential.helper manager` to activate GCM
  - Test by `git config --list`, look for `credential.helper=manager`

## 2. Setup `bash` customizations
* Copy `dotfilesgit` folder to `~`, check that dotfiles like `.bashrc` and especially
`.git-prompt.sh` are in the root folder.
* If this is a first install, run this script to create symlinks to dotfiles and
 git p4merge wrapper tools:

     <a name="section5">`. ~/dotfilesgit/install.bash`</a>
* Install [p4merge visual merge tool](https://www.perforce.com/product/components /perforce-visual-merge-and-diff-tools)
  - Download only the visual merge tool
  - Check that `C:\Program Files\Perforce` is in PATH
  - [run `install.bash` script](#section5) and check that `extMerge` and `extDiff` is in `/usr/local/bin` after running script

## 3. Set up [dropbox remote](https://github.com/anishathalye/git-remote-dropbox) for git
* Install git dropbox helper `pip install git-remote-dropbox`
* Create an Oauth2 token on [Dropbox API developer console](https://www.dropbox.com/developers/apps),
 and save as ".git-remote-dropbox.json" in `dotfilesgit\dotfiles` folder where a
 symlink script will link it to home folder
  - connect to a repository, e.g. if dropbox repo is `dotfilesgit`
  - cd to home, then `git clone "dropbox://dotfilesgit" `
  - cd to the `dotfilesgit` folder, `git checkout master` to make working dir visible

## 4. Conemu install
* If ConEmu is not installed, `choco install conemu` or [download the full packages](http://www.fosshub.com/ConEmu.html)
* Import `conemu.xml`, check in Tasks for Startup that Anaconda2 is callled
 correctly

## 5. Powershell setup
* Copy `posh-git` folder to `%USERPROFILE%` to enable [poshgit](http://dahlbyk.github.io/posh-git/)
  - alternatively `git clone https://github.com/dahlbyk/posh-git.git` into the `%USERPROFILE%` folder
  - my Powershell $Profile has hardcoded location for `posh-git` as `$env:USERPROFILE\posh-git`
* Install [Powershell community extensions](https://chocolatey.org/packages/pscx) - `choco install pscx`
* Set up `$Profile`
  ```
  Set-ExecutionPolicy RemoteSigned
  New-Item -path $profile -type file -force
  ```
* Create a symlink for powershell `$PROFILE` to `dotfilesfit` folders
 ```
 new-symlink $HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 $HOME\dotfilesgit\powershell\Microsoft.PowerShell_profile.ps1
 ```
* Install [chocolatey](https://github.com/chocolatey/choco/wiki/Installation) with:
 ```
 iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
 ```

## 6. Install [Miniconda](https://conda.io/miniconda.html)
 - Preferably install to ~/Anaconda2
 - In the conda cmd shell, update the root environment to that defined by `.cmd/environment.yml`

  `conda env update -n root -f environment.yml`
 - cp `./cmd/activate.bat` and `./cmd/deactivate.bat` into `~\Anaconda2\Scripts`
  and `.cmd/alias.cmd` into `~`
 - Do not forget to add in `HKEY_CURRENT_USER\Software\Microsoft\Command Processor\AutoRun` with value `%USERPROFILE%\alias.cmd`

## 7. Add paths for notepad++, iview, acroread32 etc
* Also add putty and putty key (priv.ppk), dont forget to set auto-login as root under 'Connection->Data' and save session as "nas" to match Conemu startup tasks. Check that System Enviroment Variables (in Powershell `$Env:path` or `Get-PathVariable` if PSCX is installed)
