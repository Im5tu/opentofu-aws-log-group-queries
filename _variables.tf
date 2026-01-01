variable "prefix" {
  description = "A folder structure prefix that's prepended to each query"
  type        = string
  default     = null
}

variable "log_groups" {
  description = "The log groups that you want the queries to search over"
  type        = list(string)
}

variable "queries" {
  description = "The queries that you wish to have available in AWS Cloudwatch Log Insights"
  type        = map(string)
}