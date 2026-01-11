Import-Module AWS.Tools.S3
$region = "ap-southeast-2"
$bucketName = Read-Host "Enter the bucket name to delete: "

#Check bucket exists
$bucket = Get-S3Bucket -BucketName $bucketName -ErrorAction SilentlyContinue
if (-not $bucket) {
    Write-Host "Bucket '$bucketName' does not exist."
    exit
}

Remove-S3Bucket -BucketName $bucketName -Force -ErrorAction Stop
Write-Host "Bucket '$bucketName' deleted successfully."