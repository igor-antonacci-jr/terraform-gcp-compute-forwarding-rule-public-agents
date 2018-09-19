/**
 * GCP Forwarding Rule - Public Agents
 * ============
 * This module creates an GCP forwarding rule for DC/OS public agents.
 *
 * EXAMPLE
 * -------
 *
 *```hcl
 * module "dcos-forwarding-rule-public-agents" {
 *   source  = "terraform-dcos/compute-forwarding-rule-public-agents/gcp"
 *   version = "~> 0.1"
 *
 *   name_prefix = "production"
 *
 *   public_agents_self_link = [${"module.public_agents.instances_self_link"}]
 * }
 *```
 */

provider "google" {}

# TODO: do we have an official doc for this? It makes sense from edgeLB
#       perspective but I miss an doc for this
locals {
  default_rules = [{
    port_range = "1-21"
  },
    {
      port_range = "23-5050"
    },
    {
      port_range = "5052-32000"
    },
  ]
}

module "dcos-forwarding-rule-public-agents" {
  source  = "terraform-dcos/compute-forwarding-rule/gcp"
  version = "~> 0.0"

  name_prefix = "${var.name_prefix}"

  instances_self_link = ["${var.public_agents_self_link}"]
  name_format         = "${var.name_format}"

  rules = "${concat(local.default_rules,var.additional_rules)}"

  health_check {
    target = "/_haproxy_health_check"
    port   = "9090"
  }
}
