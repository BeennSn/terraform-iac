resource "docker_image" "database" {
  name         = "postgres:latest"
  keep_locally = true
}

resource "docker_container" "database" {
  name  = "bd-${terraform.workspace}"
  image = docker_image.database.image_id

  env = [
    "POSTGRES_USER=admin",
    "POSTGRES_PASSWORD=admin",
    "POSTGRES_DB=appdb"
  ]

  ports {
    internal = 5432
    external = var.database_ports[terraform.workspace]
  }

  networks_advanced {
    name = docker_network.backend_network.name
  }
}