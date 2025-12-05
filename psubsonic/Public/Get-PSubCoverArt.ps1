function Get-PSubCoverArt {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ParameterSetName = 'NowPlaying')]
        [ValidateScript({
            if ($_.coverArt -isnot [string]) {
                throw ([argumentexception]::new('The supplied parameter does not include a [string] property named "coverArt".', 'InputObject'))
            } elseif ([string]::IsNullOrEmpty($_.coverArt)) {
                throw ([argumentexception]::new('The "coverArt" property is empty.', 'InputObject'))
            }
            $true
        })]
        [object]
        $InputObject,

        [Parameter(Mandatory, ParameterSetName = 'Id')]
        [ValidateNotNullOrWhiteSpace()]
        [string]
        $Id,

        [Parameter()]
        [string]
        $Path
    )

    process {
        if ($PSCmdlet.ParameterSetName -eq 'NowPlaying') {
            $Id = $InputObject.coverArt
        }

        if ([string]::IsNullOrEmpty($Path)) {
            $Path = Join-Path ([io.path]::GetTempPath()) ([io.path]::GetRandomFileName() + '.jpg')
        }

        $splat = @{
            Method              = 'getCoverArt'
            ErrorAction         = 'Stop'
            OptionalParameters  = @{
                id = $Id
            }
            AdditionalIrmParams = @{
                OutFile = $Path
            }
        }
        $null = (invokeApiMethod @splat)

        $Path
    }
}
