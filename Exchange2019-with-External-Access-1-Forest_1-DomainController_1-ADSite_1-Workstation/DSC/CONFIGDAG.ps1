﻿configuration CONFIGDAG
{
   param
   (
        [String]$ComputerName,  
        [String]$InternaldomainName,                    
        [String]$NetBiosDomain,
        [String]$Site1DC,
        [String]$ConfigDC,
        [String]$Site1FSW,
        [String]$DAGName,
        [System.Management.Automation.PSCredential]$Admincreds
    )

    [System.Management.Automation.PSCredential ]$DomainCreds = New-Object System.Management.Automation.PSCredential ("${NetBiosDomain}\$($Admincreds.UserName)", $Admincreds.Password)

    Node localhost
    {
        Script ConfigureDAGandDatabaseCopies
        {
            SetScript =
            {
                # Connect to Exchange
                $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "http://$using:computerName.$using:InternalDomainName/PowerShell/"
                Import-PSSession $Session

                # Create DAG
                $DAGCheck = Get-DatabaseAvailabilityGroup -Identity "$using:DAGName" -DomainController "$using:ConfigDC" -ErrorAction 0
                IF ($DAGCheck -eq $null) {
                New-DatabaseAvailabilityGroup -Name "$using:DAGName" -WitnessServer "$using:Site1FSW" -WitnessDirectory C:\FSWs -DomainController "$using:ConfigDC"
                }
                Add-DatabaseAvailabilityGroupServer -Identity "$using:DAGName" -MailboxServer "$using:computerName" -DomainController "$using:ConfigDC"
            }
            GetScript =  { @{} }
            TestScript = { $false}
            PsDscRunAsCredential = $DomainCreds
        }
    }
}