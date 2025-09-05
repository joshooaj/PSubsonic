function Set-PSubRating {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $Id,

        [Parameter(Mandatory)]
        [ValidateRange(0, 5)]
        $Rating
    )

    process {
        $splat = @{
            Method             = 'setRating'
            OptionalParameters = @{
                id = $Id
                rating = $Rating
            }
        }
        $null = invokeApiMethod @splat
    }
}
