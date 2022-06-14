query "aws_s3_bucket_count" {
  sql = <<EOT
  select count(*) as "AWS S3 Buckets" from aws_s3_bucket
EOT
}

query "aws_s3_bucket_by_region" {
  sql = "select region, count(*) from aws_s3_bucket group by region order by count(*) desc"
}

dashboard "mike_dashboard" {
  title = "Mike Dashboard"

  card "aws_s3_bucket_count" {
    query = query.aws_s3_bucket_count
  }

  chart {
    query = query.aws_s3_bucket_by_region
  }
}