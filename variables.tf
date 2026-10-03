variable "frontend_ports" {
  description = "Puertos externos del frontend por entorno"
  type        = map(number)

  default = {
    dev = 4001
    qa  = 5001
  }
}

variable "backend_ports" {
  description = "Puertos externos del backend por entorno"
  type        = map(number)

  default = {
    dev = 4002
    qa  = 5002
  }
}

variable "database_ports" {
  description = "Puertos externos de la base de datos por entorno"
  type        = map(number)

  default = {
    dev = 4003
    qa  = 5003
  }
}