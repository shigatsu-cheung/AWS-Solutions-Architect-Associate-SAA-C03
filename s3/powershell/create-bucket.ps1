Import-Module AWS.Tools.S3

$region = "ap-southeast-2"
$bucketName = Read-Host "Enter a unique bucket name: "

New-S3Bucket -BucketName $bucketName -Region $region -ErrorAction Stop
Write-Host "Bucket '$bucketName' created successfully in region '$region'."