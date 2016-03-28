Import-Module PSColor

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

# Load posh-git example profile
. 'C:\tools\posh-git\profile.example.ps1'

function global:prompt {
  $cdelim = [ConsoleColor]::Green
  $chost = [ConsoleColor]::Magenta
  $cloc = [ConsoleColor]::Green

  write-host "$ " -n -f $cloc
  write-host ' {' -n -f $cdelim
  write-host (split-path (pwd) -Leaf) -n -f $cloc
  write-host '}' -n -f $cdelim

  Write-VcsStatus

  $global:LASTEXITCODE = $realLASTEXITCODE
  return "`r`n> "
}

Rename-Item Function:\Prompt PoshGitPrompt -Force
function Prompt() {if(Test-Path Function:\PrePoshGitPrompt){++$global:poshScope; New-Item function:\script:Write-host -value "param([object] `$object, `$backgroundColor, `$foregroundColor, [switch] `$nonewline) " -Force | Out-Null;$private:p = PrePoshGitPrompt; if(--$global:poshScope -eq 0) {Remove-Item function:\Write-Host -Force}}PoshGitPrompt}


# alias function for changing to github dir
function gh{
$githubloc = [io.path]::combine($env:USERPROFILE, "Documents\Github", $args)
Set-Location $githubloc
} 

# git macros
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


