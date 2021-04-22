data "digitalocean_ssh_key" "stream_key" {
  name = "stream service"
}

resource "digitalocean_droplet" "web" {
  image  = "ubuntu-20-04-x64"
  name   = "CreedsCode-Streaming"
  region = "fra1"
  size   = "s-1vcpu-1gb"

  ssh_keys = [
    data.digitalocean_ssh_key.stream_key.id
  ]

//   provisioner "remote-exec" {
//     inline = ["sudo apt update", "sudo apt install git -y", "echo Done!"]

//     connection {
//       host        = self.ipv4_address
//       type        = "ssh"
//       user        = "root"
//       private_key = file(var.pvt_key)
//     }
//   }

  //   provisioner "local-exec" {
  # command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${self.ipv4_address},' --private-key ${var.pvt_key} -e 'pub_key=${var.pub_key}' -e 'pvt_key=${var.pvt_key}' main.yml"
  //   }
}

// output "droplet_ip_addresses" {
//   value = {
//     for droplet in digitalocean_droplet.web :
//     droplet.name => droplet.ipv4_address
//   }
// }

output "droplet_ip" {
    value = digitalocean_droplet.web.ipv4_address
}