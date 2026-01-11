Import-Module AWS.Tools.S3
$region = "ap-southeast-2"

$bucketName = Read-Host "Enter the bucket name to delete objects from: "

#Check bucket exists
$bucket = Get-S3Bucket -BucketName $bucketName -ErrorAction SilentlyContinue
if (-not $bucket) {
    Write-Host "Bucket '$bucketName' does not exist."
    exit
}       
#List objects in the bucket
$objects = Get-S3Object -BucketName $bucketName -ErrorAction Stop
if ($objects.Count -eq 0) {
    Write-Host "Bucket '$bucketName' is already empty."
    exit
}

#Delete all objects in the bucket
foreach ($obj in $objects) {
    Remove-S3Object -BucketName $bucketName -Key $obj.Key -ErrorAction Stop
    Write-Host "Deleted object '$($obj.Key)' from bucket '$bucketName'."
}
Write-Host "All objects deleted successfully from bucket '$bucketName'."