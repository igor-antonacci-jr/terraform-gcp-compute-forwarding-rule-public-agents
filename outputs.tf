output "ip_address" {
  description = "IP Address of master load balancer"
  value       = "${module.dcos-forwarding-rule-public-agents.ip_address}"
}
