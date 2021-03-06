function Get-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Collections.Hashtable])]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$Name
	)

    $InstallState = (Get-WindowsFeature -Name $Name).InstallState

	$returnValue = @{
		Name = [System.String] $Name
		CurrentState = [System.String] $InstallState
	}

	$returnValue
}


function Set-TargetResource
{
	[CmdletBinding()]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$Name,

		[ValidateSet("Removed")]
		[System.String]
		$Ensure
	)

	Remove-WindowsFeature -Name $Name -Remove
}


function Test-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Boolean])]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$Name,

		[ValidateSet("Removed")]
		[System.String]
		$Ensure
	)

    $InstallState = (Get-WindowsFeature -Name $Name).InstallState
    Switch ($Ensure) {
        'Removed' {
            If ($InstallState -eq 'Removed') { $Result = $true }
            Else { $result = $false }
        }
        Default   { $Result = $false }
    }

    $result
}


Export-ModuleMember -Function *-TargetResource

