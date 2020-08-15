# Refrence: -- https://thomasthornton.cloud/2020/03/27/azure-disk-snapshots/

#Get VM 
    $VmName = "IFI-VM1"
    $VmResourceGroup = "Kalpesh-RG"

    $vm = get-azvm -Name $VmName -ResourceGroupName $VmResourceGroup

#VM Snapshot

    Write-Output "VM $($vm.name) OS Disk Snapshot Begin"
    $snapshotdisk = $vm.StorageProfile
    

        $OSDiskSnapshotConfig = New-AzSnapshotConfig -SourceUri $snapshotdisk.OsDisk.ManagedDisk.id -CreateOption Copy -Location eastus -OsType Windows
        $snapshotNameOS = "$($snapshotdisk.OsDisk.Name)_snapshot_$(Get-Date -Format ddMMyy)"

        # OS Disk Snapshot

            try {
                New-AzSnapshot -ResourceGroupName $VmResourceGroup -SnapshotName $snapshotNameOS -Snapshot $OSDiskSnapshotConfig -ErrorAction Stop
            } catch {
                $_
            }
    
            Write-Output "VM $($vm.name) OS Disk Snapshot End"

    