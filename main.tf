resource "aws_cloudwatch_query_definition" "this" {
  for_each = var.queries

  name            = var.prefix == null ? each.key : "${var.prefix}/${each.key}"
  query_string    = each.value
  log_group_names = var.log_groups
}