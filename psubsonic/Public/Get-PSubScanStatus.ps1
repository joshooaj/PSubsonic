function Get-PSubScanStatus {
    [CmdletBinding()]
    param ()

    process {
        $splat = @{
            Method = 'getScanStatus'
        }
        (invokeApiMethod @splat).scanStatus
    }
}
