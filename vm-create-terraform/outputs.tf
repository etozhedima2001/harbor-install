output "harbor-server-ip" {
  value       = twc_server_ip.ip_addr.ip
  sensitive   = true
  description = "IP address of the harbor server"
}
