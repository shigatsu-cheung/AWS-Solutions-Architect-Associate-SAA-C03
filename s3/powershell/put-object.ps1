Import-Module AWS.Tools.S3
$region = "ap-southeast-2"
$bucketName = Read-Host "Enter the bucket name to upload objects to: "
# Create and upload 5 files
for ($i = 1; $i -le 5; $i++) {
    $fileName = "file$i.txt"
    $fileContent = "This is the content of file $i."
    Set-Content -Path $fileName -Value $fileContent
    Write-S3Object -BucketName $bucketName -File $fileName -Key $fileName -ErrorAction Stop
    Write-Host "Uploaded '$fileName' to bucket '$bucketName'."
}
Write-Host "All files uploaded successfully to bucket '$bucketName'."

#Delete local files after upload
for ($i = 1; $i -le 5; $i++) {
    $fileName = "file$i.txt"
    Remove-Item -Path $fileName -ErrorAction Stop
    Write-Host "Deleted local file '$fileName'."
}