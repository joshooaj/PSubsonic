function Start-PSubScan {
    [CmdletBinding()]
    param(
        [Parameter()]
        [switch]
        $Full
    )

    process {
        $splat = @{
            Method = 'startScan'
        }
        if ($Full) {
            $splat['fullScan'] = $true
        }
        invokeApiMethod @splat
    }
}
