function invokeApiMethod {
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
        if ($null -eq $script:SubsonicUri -or $null -eq $script:SubsonicCredential) {
            Write-Error -Message 'Not connected to a Subsonic server. Use Connect-PSubsonic.'
            return
        }

        $uriBuilder = [uribuilder]$script:SubsonicUri
        $uriBuilder.Path += $Method

        $params = getAuthQueryParams -ErrorAction Stop
        foreach ($key in $OptionalParameters.Keys.GetEnumerator()) {
            $params.Add($key, $OptionalParameters[$key])
        }
        $uriBuilder.Query = $params.ToString()

        $response = (Invoke-RestMethod $uriBuilder.Uri -ErrorAction Stop).'subsonic-response'
        if ($null -ne $response.error) {
            Write-Error -Message "Subsonic API returned error code $($response.error.code): $($response.error.Message)"
            return
        }
        
        $response
    }
}
