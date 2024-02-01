 # Purpose:  Clean up Patches can't be measured
# Date:     02/01/2024

<# Work order
1. Clear ccm cache
2. Clear windows Temp
3. Clear group policy
4. Clear SoftwareDist
5. Start Services
#>

function waitForService ($value) {
    While ($value -ne "Stopped") { Start-Sleep -s 2 }
}

function stopService ($value) {
    $temp = Stop-Service -Name $value
}

function startService ($value) {
    $temp = Start-Service -Name $value
    return $temp
}

function returnServiceState ($value) {
    $temp = Get-Service -Name $value
    return $temp.Status
}

function removeItems($path) {
    get-childItem $path | Remove-Item -Recurse -Force  -ErrorAction SilentlyContinue | Out-Null
}

# 1.
removeItems("C:\Windows\ccmcache\")

# 2.
removeItems("C:\Windows\Temp")

# 3.
removeItems("C:\Windows\System32\GroupPolicy\")

# 4.
$service = "wuauserv"
stopService($service)
$serviceState = returnServiceState($service)
waitForService($serviceState)
remove-Item -Path C:\Windows\SoftwareDistribution -Force -Recurse

# 5.
startService($service)
Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000021}" #Request Machine Assignments 
Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000022}" #Evaluate Machine Policies 
Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000113}" #Scan by Update Source
Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000108}" #Software Updates Assignments Evaluation Cycle
