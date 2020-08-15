Get-InstalledModule -Name "Az"

Connect-AzAccount

# put resource group in a variable so you can use the same group name going forward,
# without hard-coding it repeatedly
$resourceGroup = "Kalpesh-RG"
$location = "eastus"

New-AzResourceGroup -Name $resourceGroup -Location $location

New-AzStorageAccount -ResourceGroupName $resourceGroup `
  -Name ifitaskstorageaccount `
  -Location $location `
  -SkuName Standard_LRS `
  -Kind StorageV2

$storageacc = Get-AzStorageAccount -ResourceGroupName Kalpesh-RG -Name ifitaskstorageaccount

New-AzStorageShare -Context $storageacc.Context -Name ifishare1

azcopy copy "D:\My_Certificates\BE_IT_Degree.jpg" "https://ifitaskstorageaccount.file.core.windows.net/ifishare1?sv=2019-12-12&ss=bfqt&srt=sco&sp=rwdlacupx&se=2020-08-15T21:56:27Z&st=2020-08-15T13:56:27Z&spr=https&sig=7XLtaZJJMAhQC1HqB736YmB0%2FEoaGgCyV%2B5Zlewp3HY%3D"


$location2 = "eastus2"

New-AzStorageAccount -ResourceGroupName $resourceGroup `
  -Name ifitaskstorageaccount2 `
  -Location $location2 `
  -SkuName Standard_LRS `
  -Kind StorageV2

$storageacc2 = Get-AzStorageAccount -ResourceGroupName Kalpesh-RG -Name ifitaskstorageaccount2

New-AzStorageShare -Context $storageacc2.Context -Name ifishare2

azcopy copy "https://ifitaskstorageaccount.file.core.windows.net/ifishare1/*?sv=2019-12-12&ss=bfqt&srt=sco&sp=rwdlacupx&se=2020-08-15T21:56:27Z&st=2020-08-15T13:56:27Z&spr=https&sig=7XLtaZJJMAhQC1HqB736YmB0%2FEoaGgCyV%2B5Zlewp3HY%3D" "https://ifitaskstorageaccount2.file.core.windows.net/ifishare2?sv=2019-12-12&ss=bfqt&srt=sco&sp=rwdlacupx&se=2020-08-15T22:08:32Z&st=2020-08-15T14:08:32Z&spr=https&sig=mecwekuyKCg23ArQlqFieI%2Bk0ax1I6uq3dYDpbzFijs%3D"