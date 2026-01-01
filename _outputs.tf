output "query_definition_ids" {
  description = "Map of query names to CloudWatch query definition IDs"
  value       = { for k, v in aws_cloudwatch_query_definition.this : k => v.query_definition_id }
}

output "query_definition_arns" {
  description = "Map of query names to CloudWatch query definition ARNs"
  value       = { for k, v in aws_cloudwatch_query_definition.this : k => v.arn }
}