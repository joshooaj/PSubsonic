function Get-PSubIndex {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $FolderId,

        [Parameter()]
        [datetime]
        $ModifiedSince
    )

    process {
        $splat = @{
            Method = 'getIndexes'
            OptionalParameters = @{}
        }
        if ($PSBoundParameters.ContainsKey('FolderId')) {
            $splat.OptionalParameters['musicFolderId'] = $FolderId
        }
        if ($PSBoundParameters.ContainsKey('ModifiedSince')) {
            $splat.OptionalParameters['ifModifiedSince'] = [datetimeoffset]::new($ModifiedSince).ToUnixTimeMilliseconds()
        }
        (invokeApiMethod @splat).indexes
    }
}
