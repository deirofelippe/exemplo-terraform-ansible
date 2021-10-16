output "ips" {
  description = "ip"
  value = [
     resource.digitalocean_droplet.ubuntu.ipv4_address,
     resource.digitalocean_droplet.ubuntu2.ipv4_address,
     resource.digitalocean_droplet.ubuntu3.ipv4_address
  ]
}

output "lb-ip" {
  description = "load balancer ip"
  value = resource.digitalocean_loadbalancer.exemplo-lb.ip
}