function Connect-PSubsonic {
    [CmdletBinding()]
    param (
        [Parameter()]
        [Uri]
        $Address,

        [Parameter()]
        [pscredential]
        $Credential
    )

    process {
        try {
            if (!$PSBoundParameters.ContainsKey('Address')) {
                $Address = $script:SubsonicUri
            }
            if (!$PSBoundParameters.ContainsKey('Credential')) {
                $Credential = $script:SubsonicCredential
            }

            $uriBuilder = [uribuilder]$Address
            if ($uriBuilder.Path -eq '/') {
                $uriBuilder.Path = '/rest/'
            }
            $script:SubsonicUri = $uriBuilder.Uri
            $script:SubsonicCredential = $Credential

            invokeApiMethod -Method 'ping.view'
        } catch {
            $script:SubsonicUri = $null
            $script:SubsonicCredential = $null
            throw
        }
    }
}

