resource "docker_image" "frontend" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "frontend" {
  name  = "web-${terraform.workspace}"
  image = docker_image.frontend.image_id

  ports {
    internal = 80
    external = var.frontend_ports[terraform.workspace]
  }

  networks_advanced {
    name = docker_network.frontend_network.name
  }
}