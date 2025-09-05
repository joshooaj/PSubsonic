function Get-PSubArtist {
    [CmdletBinding()]
    param (
        [Parameter(ParameterSetName = 'FolderId')]
        [string]
        $FolderId,

        [Parameter(Mandatory, ParameterSetName = 'ArtistId')]
        [string]
        $ArtistId
    )

    process {
        $splat = @{
            Method = 'getArtists'
            OptionalParameters = @{}
        }
        if ($PSBoundParameters.ContainsKey('FolderId')) {
            $splat.OptionalParameters['musicFolderId'] = $FolderId
        }
        if ($PSBoundParameters.ContainsKey('ArtistId')) {
            $splat.Method = 'getArtist'
            $splat.OptionalParameters['id'] = $ArtistId
        }
        $response = invokeApiMethod @splat
        if ($PSBoundParameters.ContainsKey('ArtistId')) {
            $response.artist
        } else {
            $response.artists.index.artist
        }
    }
}
