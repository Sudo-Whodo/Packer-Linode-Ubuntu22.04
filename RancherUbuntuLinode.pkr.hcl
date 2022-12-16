packer {
  required_plugins {
    linode = {
      version = ">= 1.0.1"
      source  = "github.com/hashicorp/linode"
    }
  }
}

variable "linode_api_token_secret" {
  type      = string
  sensitive = true
  default   = ""
}

source "linode" "rancher_node" {
  image                = "linode/ubuntu22.04"
  image_description    = "This image is used for Rancher nodes"
  image_label          = "ubuntu22.04-rancher-packer-${formatdate("MMM-DD", timestamp())}"
  instance_label       = "temp-ubuntu-rancher-packer"
  instance_type        = "g6-nanode-1"
  linode_token         = "${var.linode_api_token_secret}"
  region               = "us-west"
  ssh_username         = "root"
  swap_size            = 0
}

build {
  sources = ["source.linode.rancher_node"]

  provisioner "ansible" {
    playbook_file = "RancherUbuntuLinode.yml"
  }
}