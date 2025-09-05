function Invoke-PSubMethod {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $Method,

        [Parameter()]
        [System.Collections.IDictionary]
        $OptionalParameters = @{}
    )

    process {
        invokeApiMethod -Method $Method -OptionalParameters $OptionalParameters
    }
}
