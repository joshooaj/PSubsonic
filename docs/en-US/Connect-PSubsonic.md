---
external help file: psubsonic-help.xml
Module Name: PSubsonic
online version:
schema: 2.0.0
---

# Connect-PSubsonic

## SYNOPSIS

Establishes or updates the module's connection to a Subsonic server and verifies connectivity.

## SYNTAX

```
Connect-PSubsonic [[-Address] <Uri>] [[-Credential] <PSCredential>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION

Authenticates with a Subsonic server using the provided address and credential
by calling the "ping.view" method. If successful, the address and credential are
stored in memory and reused in other commands in the module.

## EXAMPLES

### Example 1

```powershell
$cred = Get-Credential
Connect-PSubsonic -Address https://music.example.local -Credential $cred
```

Prompt for credentials, and then connect to a fictional Subsonic server.

## PARAMETERS

### -Address

The fully qualified URI of a Subsonic server, including the HTTP or HTTPS scheme
and the port number if not using the default for the provided scheme (80 or 443 respectively).

```yaml
Type: Uri
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential

The username and password used to authenticate with the Subsonic server.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

The response to the `ping.view` Subsonic API method.

## NOTES

## RELATED LINKS

[Subsonic API](https://subsonic.org/pages/api.jsp)
