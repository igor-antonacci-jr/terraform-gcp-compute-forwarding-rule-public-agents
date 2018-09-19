GCP Forwarding Rule - Masters
============
This module creates an GCP forwarding rule for DC/OS public agents.

EXAMPLE
-------

```hcl
module "dcos-forwarding-rule-public-agents" {
  source  = "terraform-dcos/compute-forwarding-rule-public-agents/gcp"
  version = "~> 0.1"

  name_prefix = "production"

  public_agents_self_link = [${"module.public_agents.instances_self_link"}]
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| additional_rules | Additional list of rules. These Rules are an additon to the default rules. | string | `<list>` | no |
| name_format | printf style format for naming the ELB. Gets truncated to 32 characters. (input cluster_name) | string | `%s-public-agent-forwarding-rule` | no |
| name_prefix | Cluster Name | string | - | yes |
| public_agents_self_link | List of public agent instances self links | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| ip_address | IP Address of master load balancer |

