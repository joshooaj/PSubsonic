function Get-PSubCoverArt {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $Id
    )

    process {
        $splat = @{
            Method              = 'getCoverArt'
            ErrorAction         = 'Stop'
            OptionalParameters  = @{
                id = $Id
            }
            AdditionalIrmParams = @{
                OutFile = Join-Path ([io.path]::GetTempPath()) ([io.path]::GetRandomFileName() + '.jpg')
            }
        }
        $null = (invokeApiMethod @splat)
        $splat.AdditionalIrmParams.OutFile
    }
}
