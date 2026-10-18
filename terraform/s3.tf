// S3 for downloaded web pages
resource "aws_s3_bucket" "vocablens-webpages" {
  bucket_prefix = "vocablens-webpages-"
}

// S3 for dictionary and frequency lists
resource "aws_s3_bucket" "vocablens-dictionaries" {
  bucket_prefix = "vocablens-dictionaries-"
}

// Bucket policy - prevent public access
resource "aws_s3_bucket_public_access_block" "vocablens-private" {

  // Limit access for each s3 bucket
  for_each = {
    webpages     = aws_s3_bucket.vocablens-webpages.id
    dictionaries = aws_s3_bucket.vocablens-dictionaries.id
  }

  // Iterate over each bucket
  bucket = each.value

  // Restrict public access
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}