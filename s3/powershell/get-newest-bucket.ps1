Import-Module AWS.Tools.S3

#Get the newest bucket by creation date
$bucket = Get-S3Bucket | Sort-Object CreationDate -Descending | Select-Object -First 1
if ($bucket) {
    Write-Host "The newest bucket is '$($bucket.BucketName)', created on $($bucket.CreationDate)."
} else {
    Write-Host "No buckets found."
}