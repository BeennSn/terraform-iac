resource "docker_image" "backend" {
  name         = "node:alpine"
  keep_locally = true
}

resource "docker_container" "backend" {
  name  = "api-${terraform.workspace}"
  image = docker_image.backend.image_id

  command = [
    "node",
    "-e",
    "require('http').createServer((req,res)=>res.end('Hello World')).listen(3000)"
  ]

  ports {
    internal = 3000
    external = var.backend_ports[terraform.workspace]
  }

  networks_advanced {
    name = docker_network.frontend_network.name
  }

  networks_advanced {
    name = docker_network.backend_network.name
  }
}