function Get-PSubAlbum {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $Id
    )

    process {
        $splat = @{
            Method             = 'getAlbum'
            OptionalParameters = @{
                id = $Id
            }
        }
        (invokeApiMethod @splat).album
    }
}
