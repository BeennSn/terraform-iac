resource "docker_network" "frontend_network" {
  name = "frontend-${terraform.workspace}"
}

resource "docker_network" "backend_network" {
  name = "backend-${terraform.workspace}"
}