resource "twc_server" "ca_server" {
  name = "ca-server"
  os_id = data.twc_os.ubuntu-os.id

  local_network {
    id = twc_vpc.example-vpc.id
  }

  configuration {
    configurator_id = data.twc_configurator.example-configurator.id
    disk = 1024 * 15
    cpu = 1
    ram = 1024
  }

  ssh_keys_ids = [twc_ssh_key.ca_ssh_key.id]
}

resource "twc_server_ip" "ca_ip_addr" {
  source_server_id = twc_server.ca_server.id

  type = "ipv4"
}

resource "twc_ssh_key" "ca_ssh_key" {
  name       = "ca-key"
  body = file("~/.ssh/id_ed25519.pub")
}

resource "local_file" "ca_ip" {
  filename = "server_ip/ca_server_ip.txt"
  content  = twc_server_ip.ca_ip_addr.ip
  file_permission = "0644"
}