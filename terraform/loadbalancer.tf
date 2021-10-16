resource "digitalocean_loadbalancer" "exemplo-lb" {
  name   = "exemplo-lb"
  region = "nyc1"

  forwarding_rule {
    #loadbalance vai acessar a porta 80 da aplicacao
    entry_port     = 80
    entry_protocol = "http"
    # quando alguem acessar o loadbalancer, vai ser a porta 80 q vai ficar liberada
    target_port     = 80
    target_protocol = "http"
  }

  #vai ficar checando a porta 80 da aplicacao e quando alguma cair, ele vai tirar do loadbalancer pra nao servir um recurso fora do ar
  healthcheck {
    port     = 80
    protocol = "http"
    path = "/"
  }

  droplet_ids = [
    digitalocean_droplet.ubuntu.id,
    digitalocean_droplet.ubuntu2.id,
    digitalocean_droplet.ubuntu3.id,
  ]
}
