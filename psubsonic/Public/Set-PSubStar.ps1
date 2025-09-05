function Set-PSubStar {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [string]
        $Id,

        [Parameter()]
        [switch]
        $Remove
    )

    process {
        $splat = @{
            Method             = $Remove ? 'unstar' : 'star'
            OptionalParameters = @{
                id = $Id
            }
        }
        $null = invokeApiMethod @splat
    }
}
