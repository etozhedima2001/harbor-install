terraform {
    required_providers {
        twc = {
            source = "tf.timeweb.cloud/timeweb-cloud/timeweb-cloud"
        }
    }
    required_version = ">= 1.12.2"

    backend "local" {
      path = "tfst_files/terraform.tfstate"
      #backup = "tfst_files/terraform"
    }
    
}


provider "twc" {
    token = var.twc_token
}