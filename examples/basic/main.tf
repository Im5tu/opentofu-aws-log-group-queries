module "example" {
  source = "../.."

  log_groups = [
    "/aws/lambda/my-application",
    "/aws/lambda/my-api"
  ]

  queries = {
    "Error Count"   = "filter @message like /ERROR/ | stats count(*) as error_count by bin(1h)"
    "Recent Errors" = "filter @message like /ERROR/ | sort @timestamp desc | limit 100"
    "Slow Requests" = "filter @duration > 1000 | sort @duration desc | limit 50"
  }

  prefix = "Example"
}
