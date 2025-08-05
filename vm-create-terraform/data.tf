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
