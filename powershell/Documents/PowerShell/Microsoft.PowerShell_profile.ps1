# Options
$PSReadLineOptions = @{
	EditMode = "Emacs"
	BellStyle = "Visual"
}
Set-PSReadLineOption @PSReadLineOptions

# Keybinds
Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function ForwardChar
$scriptBlock = {
    [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptSuggestion()
}
Set-PSReadLineKeyHandler -Chord "Ctrl+e" -ScriptBlock $scriptBlock

# Aliases
function nvim-kickstart {
    param (
        [Parameter(ValueFromRemainingArguments=$true)]
        [string[]]$args
    )
    $env:NVIM_APPNAME = "nvim-kickstart"
    nvim @args
    Remove-Item Env:NVIM_APPNAME  # Optional: clean up the environment variable after use
}
Set-Alias -Name code -Value nvim-kickstart
