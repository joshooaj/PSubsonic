function getAuthQueryParams {
    [CmdletBinding()]
    param (
        [Parameter()]
        [pscredential]
        $Credential
    )

    process {
        try {
            $md5 = [System.Security.Cryptography.MD5]::Create()
            $salt = (New-Guid).ToString('n')
            if ($null -eq $Credential) {
                if ($null -eq $script:SubsonicCredential) {
                    Write-Error -Message "Connect to a Subsonic server with Connect-PSubServer first."
                    return
                }
                $Credential = $script:SubsonicCredential
            }
            $hashBytes = $md5.ComputeHash([text.encoding]::UTF8.GetBytes("$($Credential.GetNetworkCredential().Password)$salt"))
            $hash = [System.BitConverter]::ToString($hashBytes).ToLower() -replace '-'
            $params = [System.Web.HttpUtility]::ParseQueryString('')
            $params.Add('u', $Credential.UserName)
            $params.Add('t', $hash)
            $params.Add('s', $salt)
            $params.Add('v', '1.16.1')
            $params.Add('c', 'psubsonic')
            Write-Output $params -NoEnumerate
        } finally {
            $null = $md5 ? $md5.Dispose() : $null
        }
    }
}
