terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "1.22.2"
    }
  }
}

variable "cloudflare_token" {}
variable "cloudflare_zone" {}
variable "do_token" {}
// variable "pvt_key" {}
// variable "pub_key" {}

provider "digitalocean" {
  token = var.do_token
}