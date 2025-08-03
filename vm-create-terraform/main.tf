data "twc_presets" "example-preset" {
  price_filter {
    from = 300
    to = 400
  }
}

data "twc_configurator" "example-configurator" {
  location = "ru-1"
}

data "twc_os" "example-os" {
  name = "ubuntu"
  version = "22.04"
}

resource "twc_vpc" "example-vpc" {
  name = "harbor_vpc"
  description = "Some example VPC"
  subnet_v4 = "192.168.0.0/24"
  location = "ru-1"
}

resource "twc_server" "harbor_server" {
  name = "harbor-server"
  os_id = data.twc_os.example-os.id

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

resource "twc_server_ip" "ip_addr" {
  source_server_id = twc_server.harbor_server.id

  type = "ipv4"
}

resource "twc_ssh_key" "harbor_ssh_key" {
  name       = "harbor-key"
  body = file("~/.ssh/id_ed25519.pub")
}