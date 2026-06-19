resource "aws_s3_bucket" "coffre_journal" {
  bucket        = "boite-journal-terraform-joseph-nathan"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "versioning_journal" {
  bucket = aws_s3_bucket.coffre_journal.id
  versioning_configuration {
    status = "Enabled"
  }
}
