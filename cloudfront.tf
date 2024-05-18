module "cdn" {
  source = "terraform-aws-modules/cloudfront/aws"
  version = "v3.4.0"
  #   aliases = ["cdn.example.com"]

  comment             = "My awesome CloudFront 2024"
  enabled             = true
  #   is_ipv6_enabled     = true
  price_class         = "PriceClass_100"
  retain_on_delete    = false
  wait_for_deployment = false

  create_origin_access_identity = true
  origin_access_identities = {
    s3_bucket_one = "My awesome CloudFront can access"
  }

  #   logging_config = {
  #     bucket = "logs-my-cdn.s3.amazonaws.com"
  #   }

  origin = {
    s3_one = {
      domain_name = module.front_application.s3_bucket_bucket_regional_domain_name
      s3_origin_config = {
        origin_access_identity = "s3_bucket_one"
        http_port              = 80
        https_port             = 443
        origin_protocol_policy = "match-viewer"
        origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
      }
    }
  }

  default_cache_behavior = {
    target_origin_id           = "s3_one"
    viewer_protocol_policy     = "allow-all"

    allowed_methods = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods  = ["GET", "HEAD"]
    compress        = true
    query_string    = true
  }

  default_root_object = "index.html"

  custom_error_response = [{
    error_caching_min_ttl = 10
    error_code         = 404
    response_code      = 200
    response_page_path = "/index.html"
  }, {
    error_caching_min_ttl = 10
    error_code         = 403
    response_code      = 200
    response_page_path = "/index.html"
  }]
}

