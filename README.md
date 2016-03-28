## Install instructions
### 1. Do not forget to add in `regedit HKCU AutoRun` with value `%USERPROFILE%\alias.cmd`

### 2. Set up dropbox remote for git
Name of dropbox repo is `dotfilesgit`

* `git clone https://github.com/dropbox/dropbox-sdk-python.git`

    - install dropbox sdk python `python setup.py install`

* `git clone https://github.com/anishathalye/git-remote-dropbox.git`

    - move/cp `git-remote-dropbox` into `/usr/bin` in git folder

    - cp `bashrc\.git-remote-dropbox.json` into `~\`

* cd to root folder of choice, `git clone "dropbox://dotfilesgit" `

* cd to the `dotfilesgit` folder, `git checkout master` to make working dir visible

### 3. `cmd` Setup:

* Get **chocolatey** with:

    ```
    @powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin
    ```
* Then install Far Manager with `choco install far`
* cp `activate.bat` into `~\Anaconda2\Scripts` and `alias.cmd` into `~`

### 4. Powershell install:
* Move `tools` folder to `C:\` to enable `poshgit`
* Set up `$Profile`

    ```
    Set-ExecutionPolicy RemoteSigned
    New-Item -path $profile -type file -force

    ```
* Move any other folders like `Modules etc.` into $Profile root folder (most likely in `~\Documents\WindowsPowerShell`)

### 5.  `.bashrc` install:

* Install **git for windows**, choose **cmd with bash commands** option and **git credentials manager**
* copy dotfiles `.bashc, .git-prompt etc` to `~`

### 6. Conemu install

Import `conemu.xml`, check in Tasks for Startup and Anaconda that Anaconda/Miniconda option is correct

### 7. Add paths for notepad ++, iview, acroread32 etc.
Also add putty and putty key, dont forget to set auto-login as root undet 'Connection->Data' and save session as "nas" to match Conemu startup tasks
