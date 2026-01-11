Import-Module AWS.Tools.S3
$region = "ap-southeast-2"
$bucketName = Read-Host "Enter the bucket name to list objects from: "
#Check bucket exists
$bucket = Get-S3Bucket -BucketName $bucketName -ErrorAction SilentlyContinue
if (-not $bucket) {
    Write-Host "Bucket '$bucketName' does not exist."
    exit
}

#List objects in the bucket
$objects = Get-S3Object -BucketName $bucketName -ErrorAction Stop
if ($objects.Count -eq 0) {
    Write-Host "No objects found in bucket '$bucketName'."
    exit
}
Write-Host "Objects in bucket '$bucketName':"
foreach ($obj in $objects) {
    Write-Host "- $($obj.Key) (Size: $($obj.Size) bytes, Last Modified: $($obj.LastModified))"
}
