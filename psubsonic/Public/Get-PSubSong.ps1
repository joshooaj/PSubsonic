function Get-PSubSong {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $Id
    )

    process {
        $splat = @{
            Method             = 'getSong'
            OptionalParameters = @{
                id = $Id
            }
        }
        (invokeApiMethod @splat).song
    }
}
