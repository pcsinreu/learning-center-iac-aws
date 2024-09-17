resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_name  
}

resource "aws_s3_bucket_policy" "s3CloudStore_policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.aws_iam_policy_document.s3CloudStore_policy.json
}

data "aws_iam_policy_document" "s3CloudStore_policy" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [ "*" ]
    }

    actions = [
      "s3:ListBucket",
      "s3:*Object"
    ]

    resources = [
      aws_s3_bucket.s3_bucket.arn,
      "${aws_s3_bucket.s3_bucket.arn}/*",
    ]
  }
}