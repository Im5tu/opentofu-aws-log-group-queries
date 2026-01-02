variable "prefix" {
  description = "A folder structure prefix that's prepended to each query"
  type        = string
  default     = null
}

variable "log_groups" {
  description = "The log groups that you want the queries to search over"
  type        = list(string)

  validation {
    condition     = length(var.log_groups) > 0
    error_message = "log_groups must contain at least one log group name."
  }
}

variable "queries" {
  description = "The queries that you wish to have available in AWS CloudWatch Log Insights"
  type        = map(string)

  validation {
    condition     = length(var.queries) > 0
    error_message = "At least one query must be specified."
  }
}