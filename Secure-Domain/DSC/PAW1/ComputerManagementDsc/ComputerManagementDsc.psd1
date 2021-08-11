@{
    # Version number of this module.
    moduleVersion        = '8.1.0'

    # ID used to uniquely identify this module
    GUID                 = 'B5004952-489E-43EA-999C-F16A25355B89'

    # Author of this module
    Author               = 'DSC Community'

    # Company or vendor of this module
    CompanyName          = 'DSC Community'

    # Copyright statement for this module
    Copyright            = 'Copyright the DSC Community contributors. All rights reserved.'

    # Description of the functionality provided by this module
    Description          = 'DSC resources for configuration of a Windows computer. These DSC resources allow you to perform computer management tasks, such as renaming the computer, joining a domain and scheduling tasks as well as configuring items such as virtual memory, event logs, time zones and power settings.'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion    = '4.0'

    # Minimum version of the common language runtime (CLR) required by this module
    CLRVersion           = '4.0'

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport    = @()

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport      = @()

    # Variables to export from this module
    VariablesToExport    = @()

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport      = @()

    # DSC resources to export from this module
    DscResourcesToExport = @(
        'Computer'
        'OfflineDomainJoin'
        'PendingReboot'
        'PowerPlan'
        'PowerShellExecutionPolicy'
        'RemoteDesktopAdmin'
        'ScheduledTask'
        'SmbServerConfiguration'
        'SmbShare'
        'SystemLocale'
        'TimeZone'
        'VirtualMemory'
        'WindowsEventLog'
        'WindowsCapability'
        'IEEnhancedSecurityConfiguration'
        'UserAccountControl'
    )

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData          = @{

        PSData = @{
            # Set to a prerelease string value if the release should be a prerelease.
            Prerelease   = ''

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags         = @('DesiredStateConfiguration', 'DSC', 'DSCResource')

            # A URL to the license for this module.
            LicenseUri   = 'https://github.com/dsccommunity/ComputerManagementDsc/blob/master/LICENSE'

            # A URL to the main website for this project.
            ProjectUri   = 'https://github.com/dsccommunity/ComputerManagementDsc'

            # A URL to an icon representing this module.
            IconUri      = 'https://dsccommunity.org/images/DSC_Logo_300p.png'

            # ReleaseNotes of this module
            ReleaseNotes = '## [8.1.0] - 2020-03-26

### Added

- ComputerManagementDsc
  - Added build task `Generate_Conceptual_Help` to generate conceptual help
    for the DSC resource.
  - Added build task `Generate_Wiki_Content` to generate the wiki content
    that can be used to update the GitHub Wiki.

### Changed

- ComputerManagementDsc
  - Updated CI pipeline files.
  - No longer run integration tests when running the build task `test`, e.g.
    `.\build.ps1 -Task test`. To manually run integration tests, run the
    following:
    ```powershell
    .\build.ps1 -Tasks test -PesterScript ''tests/Integration'' -CodeCoverageThreshold 0
    ```

### Fixed

- ScheduledTask:
  - Added missing ''NT Authority\'' domain prefix when testing tasks that use
    the BuiltInAccount property - Fixes [Issue #317](https://github.com/dsccommunity/ComputerManagementDsc/issues/317)

## [8.0.0] - 2020-02-14

### Added

- Added new resource IEEnhancedSecurityConfiguration (moved from module
  xSystemSecurity).
- Added new resource UserAccountControl (moved from module
  xSystemSecurity).

### Changed

- SmbShare:
  - Add parameter ScopeName to support creating shares in a different
    scope - Fixes [Issue #284](https://github.com/dsccommunity/ComputerManagementDsc/issues/284).
- Added `.gitattributes` to ensure CRLF is used when pulling repository - Fixes
  [Issue #290](https://github.com/dsccommunity/ComputerManagementDsc/issues/290).
- SystemLocale:
  - Migrated SystemLocale from [SystemLocaleDsc](https://github.com/PowerShell/SystemLocaleDsc).
- RemoteDesktopAdmin:
  - Correct Context messages in integration tests by adding ''When''.
- WindowsCapability:
  - Change `Test-TargetResource` to remove test for valid LogPath.
- BREAKING CHANGE: Changed resource prefix from MSFT to DSC.
- Updated to use continuous delivery pattern using Azure DevOps - Fixes
  [Issue #295](https://github.com/dsccommunity/ComputerManagementDsc/issues/295).

### Deprecated

- None

### Removed

- None

### Fixed

- WindowsCapability:
  - Fix `A parameter cannot be found that matches parameter name ''Ensure''.`
    error in `Test-TargetResource` - Fixes [Issue #297](https://github.com/dsccommunity/ComputerManagementDsc/issues/297).

### Security

- None

'
        } # End of PSData hashtable
    } # End of PrivateData hashtable
}





