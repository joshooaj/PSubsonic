function Get-PSubMusicFolder {
    [CmdletBinding()]
    param ()

    process {
        $splat = @{
            Method = 'getMusicFolders'
        }
        foreach ($folder in (invokeApiMethod @splat).musicFolders.musicFolder) {
            $folder
        }
    }
}
