# PatchesCantBeMeasured
Script for fixing patches can't be measure issues with SCCM

Date:  02/01/2024

### Note:
Please test this before running against your environment.  I always do this against 1 or 2 machines to make sure they don't brick.  Windows issues can cause unexpected results with devices that are unhealthy.  Please always test even if you completely understand what the script does.

## Purpose:
Clean up Patches can't be measured 

## Work order:
 1. Clear ccm cache
2. Clear windows Temp
3. Clear group policy
4. Clear SoftwareDist
5. Start Services 

If you suffer from inconsistent code execution and they are older machines please make sure your devices are patched up.  Server 2012 and below makes sure you patch them to "Windows Management Framework 5.1".  You can see more here.

[WMF 5.1 Download](https://www.microsoft.com/en-us/download/details.aspx/?id=54616)

You can also learn more about WMF or Windows Management Framework [here](https://learn.microsoft.com/en-us/powershell/scripting/windows-powershell/wmf-overview?view=powershell-7.4)
