function Show-MessageBox
{
    <#

    .SYNOPSIS
        Shows a Windows Forms MessageBox

    .DESCRIPTION
        Shows a Windows Forms MessageBox with custom Titel & Text.
        Buttons and Style (e.g. Warning, Information ...) can be choosen

    .PARAMETER Text
        Specify the Text of the MessageBox

    .PARAMETER Title
        Specify the Title of the MessageBox

    .PARAMETER Style
        Specify the Style of the MessageBox
        Possible Styles 'Error', 'Information', 'Question', 'Warning'

    .PARAMETER Button
        Specify the Buttons that the MessageBox will have
        Possible Buttons 'Ok', 'Ok,Abort', 'Abort,Retry,Ignore', 'Yes,No,Abort', 'Yes,No', 'Retry,Abort'

    .OUTPUTS
        System.Windows.Forms.DialogResult

    .EXAMPLE
        Show-MessageBox -Title 'File not found' -Text 'The specified File does not exist.' -Style Error -Button Ok

    #>
	Param
	(
		[Parameter(Position = 0)]
        [ValidateLength(0,256)]
		[string]$Text,

		[Parameter(Position = 1)]
        [ValidateLength(0,256)]
		[string]$Title,

		[Parameter(Position = 2)]
		[ValidateSet('Error', 'Information', 'Question', 'Warning')]
		[string]$Style = 'Information',

		[Parameter(Position = 3)]
		[ValidateSet('Ok', 'Ok,Abort', 'Abort,Retry,Ignore', 'Yes,No,Abort', 'Yes,No', 'Retry,Abort')]
		[string]$Button = 'Ok'
	)
    Add-Type -AssemblyName System.Windows.Forms
	$btnMapping = @{ 'Ok' = 0; 'Ok,Abort' = 1; 'Abort,Retry,Ignore' = 2; 'Yes,No,Abort' = 3; 'Yes,No' = 4; 'Retry,Abort' = 5 }
	
	[System.Windows.Forms.MessageBox]::Show($Text, $Title, $btnMapping[$Button], $Style)
}