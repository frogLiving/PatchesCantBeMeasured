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
