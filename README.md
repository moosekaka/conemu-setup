## ConEmu optimized for Git-Win-SDK install instructions
### 1. Install [Git-sdk-windows](https://github.com/git-for-windows/build-extra/releases/tag/git-sdk-1.0.3)
* Install into `\\%USERPROFILE%\\Git` to avoid problems with white space
* Run `pacman -Syuu` in the git-bash shell
* Install git credential manager folder or clone from [here](https://github.com/Microsoft/Git-Credential-Manager-for-Windows/releases). *download just the zip file!*. Expand the zip to where the git /bin folder is and run `install.cmd` from elevated cmd.exe. Run `git config --global credential.helper manager` to activate GCM and test by `git config --list`, look for `credential.helper=manager`.
* Run `pacman -Syuu man-db` and any other additional packages. Also run `mandb -cd` post install.
* If reinstalling, dropbox-sdk-python (#2) needs to be reinstalled.
* **Add path for Git , i.e.@ `git install folder/usr/bin` into Windows Path.**
* Do not forget to add in `regedit HKCU AutoRun` with value `%USERPROFILE%\alias.cmd`


### 2. Set up dropbox remote for git
For example, name of dropbox repo is `dotfilesgit`

* Install Dropbox API v2 for python

    `pip install dropbox`

* Install git dropbox helper

    `git clone https://github.com/anishathalye/git-remote-dropbox.git`

* Move/cp `git-remote-dropbox` into `\\%USERPROFILE%\\bin` home folder. _Also add this path to the system enviroment (Windows) path!_

* Create an Oauth2 token on [Dropbox API developer console](https://www.dropbox.com/developers/apps). and save as ".git-remote-dropbox.json"

* cd to home, then `git clone "dropbox://dotfilesgit" `

* cd to the `dotfilesgit` folder, `git checkout master` to make working dir visible.

### 3. `cmd` setup:

* Install [chocolatey](https://github.com/chocolatey/choco/wiki/Installation) with:

    ```
    @powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
    ```

* (Optional): Install Far Manager - `choco install far`
* cp `activate.bat` into `~\Anaconda2\Scripts` and `alias.cmd` into `~`

### 4. Powershell setup:
* Copy `posh-git` folder to `%USERPROFILE%` to enable [poshgit](http://dahlbyk.github.io/posh-git/), or alternatively `git clone https://github.com/dahlbyk/posh-git.git` into the `%USERPROFILE%` folder. My Powershell $Profile by default has hardcoded location of posh-git as `$env:USERPROFILE\posh-git`.
* Install [Powershell community extensions](https://chocolatey.org/packages/pscx) - `choco install pscx`.

* Set up `$Profile`
    ```
    Set-ExecutionPolicy RemoteSigned
    New-Item -path $profile -type file -force
    ```
* link powershell `$PROFILE` to `dotfilesfit` folders

    `new-symlink $HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 $HOME\dotfilesgit\powershell\Microsoft.PowerShell_profile.ps1`


### 5. Setup `bash` customizations:
* Copy `dotfilesgit` folder to `~`, check that .files like `.bashrc, .dir_colors etc` and especially [.git-prompt.sh \(like poshgit but for bash\)](https://github.com/lyze/posh-git-sh) are in the rootfolder.
* If this is a first install, install symlinks for the dotfiles:

    `. ~/dotfilesgit/install.bash`

### 6. Conemu install
* If ConEmu is not installed, `choco install conemu` or [download the full packages](http://www.fosshub.com/ConEmu.html).

* Import `conemu.xml`, check in Tasks for Startup and Anaconda that Anaconda/Miniconda option is correct

### 7. Add paths for notepad++, iview, acroread32 etc.
* Also add putty and putty key, dont forget to set auto-login as root under 'Connection->Data' and save session as "nas" to match Conemu startup tasks. Check that System Enviroment Variables (in Powershell `$Env:path` or `Get-PathVariable` if PSCX is installed.)
