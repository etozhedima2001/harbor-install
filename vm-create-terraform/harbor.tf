resource "twc_server" "harbor_server" {
  name = "harbor-server"
  os_id = data.twc_os.ubuntu-os.id

  local_network {
    id = twc_vpc.example-vpc.id
  }

  configuration {
    configurator_id = data.twc_configurator.example-configurator.id
    disk = 1024 * 40
    cpu = 2
    ram = 1024 * 4
  }

  ssh_keys_ids = [twc_ssh_key.harbor_ssh_key.id]
}

resource "twc_server_ip" "harbor_ip_addr" {
  source_server_id = twc_server.harbor_server.id

  type = "ipv4"
}

resource "twc_ssh_key" "harbor_ssh_key" {
  name       = "harbor-key"
  body = file("~/.ssh/id_ed25519.pub")
}

resource "local_file" "harbor_ip" {
  filename = "server_ip/harbor_server_ip.txt"
  content  = twc_server_ip.harbor_ip_addr.ip
  file_permission = "0644"
}