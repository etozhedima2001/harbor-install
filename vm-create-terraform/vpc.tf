resource "twc_vpc" "example-vpc" {
  name = "harbor_vpc"
  description = "Some example VPC"
  subnet_v4 = "192.168.0.0/24"
  location = "ru-1"
}