Import-Module AWS.Tools.S3

#List buckets
$buckets = Get-S3Bucket
if ($buckets.Count -eq 0) {
    Write-Host "No buckets found."
    exit
}

Write-Host "S3 Buckets:"
foreach ($bucket in $buckets) {
    Write-Host "- $($bucket.BucketName) (Created on: $($bucket.CreationDate))"
}
