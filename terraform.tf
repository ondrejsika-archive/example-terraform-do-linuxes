variable "do_token" {}
variable "cloudflare_email" {}
variable "cloudflare_token" {}

provider "digitalocean" {
  token = var.do_token
}

provider "cloudflare" {
  version = "~> 1.0"
  email = var.cloudflare_email
  token = var.cloudflare_token
}


data "digitalocean_ssh_key" "ondrejsika" {
  name = "ondrejsika"
}

resource "digitalocean_droplet" "debian" {
  // doctl compute image list --public
  image  = "debian-10-x64"
  name   = "debian"
  region = "fra1"
  size   = "s-1vcpu-2gb"
  ssh_keys = [
    data.digitalocean_ssh_key.ondrejsika.id
  ]
}

resource "cloudflare_record" "debian" {
  domain = "sikademo.com"
  name   = "debian"
  value  = digitalocean_droplet.debian.ipv4_address
  type   = "A"
  proxied = false
}

resource "digitalocean_droplet" "centos" {
  // doctl compute image list --public
  image  = "centos-8-x64"
  name   = "centos"
  region = "fra1"
  size   = "s-1vcpu-2gb"
  ssh_keys = [
    data.digitalocean_ssh_key.ondrejsika.id
  ]
}

resource "cloudflare_record" "centos" {
  domain = "sikademo.com"
  name   = "centos"
  value  = digitalocean_droplet.centos.ipv4_address
  type   = "A"
  proxied = false
}
