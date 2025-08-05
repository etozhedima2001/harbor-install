output "harbor-server-ip" {
  value       = twc_server_ip.harbor_ip_addr.ip
  sensitive   = true
  description = "IP address of the harbor server"
}

output "ca-server-ip" {
  value       = twc_server_ip.ca_ip_addr.ip
  sensitive   = true
  description = "IP address of the harbor server"
}
