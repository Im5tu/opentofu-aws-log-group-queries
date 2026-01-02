# OpenTofu AWS Log Group Queries

Creates AWS CloudWatch Log Insights query definitions across specified log groups.

## Usage

```hcl
module "log_queries" {
  source = "git::https://github.com/im5tu/opentofu-aws-log-group-queries.git?ref=main"

  log_groups = [
    "/aws/lambda/my-api",
    "/aws/lambda/my-worker"
  ]

  queries = {
    "Error Count"   = "filter @message like /ERROR/ | stats count(*) as error_count by bin(1h)"
    "Recent Errors" = "filter @message like /ERROR/ | sort @timestamp desc | limit 100"
    "Warning Logs"  = "filter @message like /WARN/ | sort @timestamp desc | limit 50"
  }

  prefix = "MyApp"  # Optional: creates queries under "MyApp/" folder
}
```

## Requirements

| Name | Version |
|------|---------|
| opentofu | >= 1.9 |
| aws | ~> 6 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| log_groups | The log groups that you want the queries to search over | `list(string)` | n/a | yes |
| queries | The queries that you wish to have available in AWS CloudWatch Log Insights | `map(string)` | n/a | yes |
| prefix | A folder structure prefix that's prepended to each query | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| query_definition_ids | Map of query names to CloudWatch query definition IDs |
| query_definition_arns | Map of query names to CloudWatch query definition ARNs |

## Development

### Validation

This module uses GitHub Actions for validation:

- **Format check**: `tofu fmt -check -recursive`
- **Validation**: `tofu validate`
- **Security scanning**: Checkov, Trivy

### Local Development

```bash
# Format code
tofu fmt -recursive

# Validate
tofu init -backend=false
tofu validate
```

## License

MIT License - see [LICENSE](LICENSE) for details.
