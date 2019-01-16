Linux Scripts
=============
## cert-download
Downloads certificates from a s3 bucket to the specified location. Most useful when run as a cron job.

## certbot-renew
Renews a certificate and places it in a folder using certbot. This must run after running certbot initially

## create-ansible-user
Creates a user named **ansible** with passwordless sudo, and sets a public key for ssh login

## sync-drive
Syncs two rclone repositories together. This is meant to sync Google Drive with an S3 bucket
