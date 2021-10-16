resource "digitalocean_droplet" "ubuntu" {
  image = "ubuntu-20-04-x64"
  name = "ubuntu"
  region = "nyc1"
  size = "s-1vcpu-1gb"
#   private_networking = true
  ssh_keys = [
     var.pvt_key
  ]

   #a conecao sera feita com usuario root, via ssh, com ipv4 e a autenticacao sera a private key gerada na DO
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
}

resource "digitalocean_droplet" "ubuntu2" {
  image = "ubuntu-20-04-x64"
  name = "ubuntu2"
  region = "nyc1"
  size = "s-1vcpu-1gb"
#   private_networking = true
  ssh_keys = [
     var.pvt_key
  ]

  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
}

resource "digitalocean_droplet" "ubuntu3" {
  image = "ubuntu-20-04-x64"
  name = "ubuntu3"
  region = "nyc1"
  size = "s-1vcpu-1gb"
#   private_networking = true
  ssh_keys = [
     var.pvt_key
  ]

  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
}

#vai aplicar os droplets no projeto da digital ocean
resource "digitalocean_project_resources" "exemplos" {
  project = var.project_id
  #urn é o identificador da maquina que foi criada na DO. vai conseguir atribuir as maquinas criadas ao projeto
  resources = [
     resource.digitalocean_droplet.ubuntu.urn,
     resource.digitalocean_droplet.ubuntu2.urn,
     resource.digitalocean_droplet.ubuntu3.urn,
     digitalocean_loadbalancer.exemplo-lb.urn
  ]
}