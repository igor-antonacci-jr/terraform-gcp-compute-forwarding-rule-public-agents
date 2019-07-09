GCP Forwarding Rule - Public Agents
============
This module creates an GCP forwarding rule for DC/OS public agents.

EXAMPLE
-------

```hcl
module "dcos-forwarding-rule-public-agents" {
  source  = "dcos-terraform/compute-forwarding-rule-public-agents/gcp"
  version = "~> 0.2.0"

  cluster_name = "production"

  public_agents_self_link = [${"module.public_agents.instances_self_link"}]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cluster\_name | Name of the DC/OS cluster | string | n/a | yes |
| additional\_rules | List of additional rules | list | `<list>` | no |
| disable | Do not create load balancer and its resources | string | `"false"` | no |
| labels | Add custom labels to all resources | map | `<map>` | no |
| name\_format | printf style format for naming the ELB. Gets truncated to 32 characters. (input cluster_name) | string | `"ext-%s"` | no |
| name\_prefix | Name Prefix | string | `""` | no |
| public\_agents\_self\_link | List of public agent instances self links | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| ip\_address | Load balancer ip address |

