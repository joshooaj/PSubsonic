function Get-PSubLyrics {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $Artist,

        [Parameter()]
        [string]
        $Title
    )

    process {
        $splat = @{
            Method             = 'getLyrics'
            OptionalParameters = @{}
        }
        foreach ($parameter in @('artist', 'title')) {
            if ($PSBoundParameters.ContainsKey($parameter)) {
                $splat.OptionalParameters.Add($parameter, $PSBoundParameters[$parameter])
            }
        }

        $response = invokeApiMethod @splat
        if ([string]::IsNullOrEmpty($response.lyrics)) {
            Write-Error -Message "No lyrics found matching artist '$Artist' and title '$Title'"
            return
        }

        foreach ($record in (invokeApiMethod @splat).lyrics) {
            $record
        }
    }
}
