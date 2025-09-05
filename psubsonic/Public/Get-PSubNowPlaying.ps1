function Get-PSubNowPlaying {
    [CmdletBinding()]
    param ()

    process {
        $splat = @{
            Method = 'getNowPlaying'
        }
        foreach ($entry in (invokeApiMethod @splat).nowPlaying.entry) {
            $entry
        }
    }
}
