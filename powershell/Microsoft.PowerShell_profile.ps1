Import-Module PSColor
Import-Module Pscx

# colorize version of ls
$ScriptPath = Split-Path -parent $PSCommandPath
. "$ScriptPath\Get-ChildItem-Color\Get-ChildItem-Color.ps1"
Set-Alias l Get-ChildItem-Color -option AllScope
Set-Alias ls Get-ChildItem-Format-Wide -option AllScope

# common programs alias
Set-Alias np notepad++.exe
Set-Alias iv i_view32.exe
Set-Alias pdf AcroRd32.exe
Set-Alias aa Atom
Set-Alias -Name cd -value cddash -Option AllScope
Set-Alias -Name hh -value cdhome -Option AllScope


# Load posh-git example profile
. 'C:\poshgit_ps\profile.example.ps1'

function prompt {
  $GREEN = [ConsoleColor]::Green
  $MAGENTA = [ConsoleColor]::Magenta

  write-host (Get-Date -UFormat "%a %x %R" ) -n -f $MAGENTA
  write-host ' {' -n -f $GREEN
  write-host (split-path (pwd) -Leaf) -n -f $GREEN
  write-host '}' -n -f $GREEN

  Write-VcsStatus

  write-host " "
  write-host "$([char]0x00BB)" -n -f $GREEN
  return " "
}

Rename-Item Function:\Prompt PoshGitPrompt -Force
function Prompt() {if(Test-Path Function:\PrePoshGitPrompt){++$global:poshScope; New-Item function:\script:Write-host -value "param([object] `$object, `$backgroundColor, `$foregroundColor, [switch] `$nonewline) " -Force | Out-Null;$private:p = PrePoshGitPrompt; if(--$global:poshScope -eq 0) {Remove-Item function:\Write-Host -Force}}PoshGitPrompt}

# ********************************************
# DIRECTORY SHORCUT FUNCTIONS
# ********************************************

# Shortcut to home
function cdhome {set-location $env:USERPROFILE}


# Function for changing to Github dir and ls
function gh{
$githubloc = [io.path]::combine($env:USERPROFILE, "Documents\Github", $args)
Set-Location $githubloc
ls
}


# Function to emulate cd -
function cddash {
	if ($args[0] -eq '-')
	{
		popd
	} else	{
		pushd $args[0]
	}
}


# Function for cd and ls
function cs {
if ($args[0])
    {
		pushd $args[0]	# to enable cd - to work on cs too
	    ls
	} else {
	    ls
	}
}


# ********************************************
# Git macros
# ********************************************
function Get-GitStatus { & git status -b $args }
New-Alias -Name gs -Value Get-GitStatus -Force -Option AllScope
function Get-GitCommit { & git commit -ev $args }
New-Alias -Name gc -Value Get-GitCommit -Force -Option AllScope
function Get-GitAdd { & git add --all $args }
New-Alias -Name ga -Value Get-GitAdd -Force -Option AllScope
function Get-GitTree { & git log --graph --oneline --decorate $args }
New-Alias -Name gl -Value Get-GitTree -Force -Option AllScope
function Get-GitPush { & git push $args }
New-Alias -Name gps -Value Get-GitPush -Force -Option AllScope
function Get-GitPull { & git pull $args }
New-Alias -Name gpl -Value Get-GitPull -Force -Option AllScope
function Get-GitFetch { & git fetch $args }
New-Alias -Name gf -Value Get-GitFetch -Force -Option AllScope
function Get-GitCheckout { & git checkout $args }
New-Alias -Name gck -Value Get-GitCheckout -Force -Option AllScope
function Get-GitBranch { & git branch $args }
New-Alias -Name gb -Value Get-GitBranch -Force -Option AllScope
function Get-GitRemote { & git remote -v $args }
New-Alias -Name gr -Value Get-GitRemote -Force -Option AllScope


