#$InstanceData = (Get-EC2Instance -Filter @{Name = 'tag-key'; values = "Department"}).Instances
$InstanceData = (Get-EC2Instance).Instances

#Instance Key Details
    $InstanceIDs = $InstanceData.InstanceId
    #$InstanceData.HostNames = ($InstanceData.Tags | Where-Object -Property Key -eq "Name" | Select-Object Value)
    #$HostNames = ($InstanceData.Tags | Where-Object -Property Key -eq "Name" | Select-Object Value)
    #$InstanceVolumes = ((Get-EC2Volume).Attachments | Where-Object { ($_.InstanceId -in $InstanceIDs) -and ($_.Device -eq "/dev/sda1") }).VolumeId

#$InstanceIDs | ForEach-Object -Process {
#$_
}
$InstanceData |
Select-Object InstanceId, @{Name ='HostName'; E= {
    ($InstanceData.Tags | Where-Object -Property Key -eq "Name" | Select-Object Value)}
}