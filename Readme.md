# Laboratorio IaC con Terraform

Infraestructura local creada con Terraform y Docker para los entornos DEV y QA.

## Requisitos

- Terraform
- Docker
- Git

## Descargar el proyecto

```bash
git clone https://github.com/BeennSn/terraform-iac
cd terraform-iac
```

## Inicializar Terraform

```bash
terraform init
```

## Entorno DEV

Crear el workspace:

```bash
terraform workspace new dev
```

Si ya existe:

```bash
terraform workspace select dev
```

Desplegar:

```bash
terraform plan
terraform apply
```

Puertos utilizados:

- Frontend: 4001:80
- Backend: 4002:3000
- PostgreSQL: 4003:5432

## Entorno QA

Crear el workspace:

```bash
terraform workspace new qa
```

Si ya existe:

```bash
terraform workspace select qa
```

Desplegar:

```bash
terraform plan
terraform apply
```

Puertos utilizados:

- Frontend: 5001:80
- Backend: 5002:3000
- PostgreSQL: 5003:5432

## Arquitectura

Cada entorno contiene un frontend con Nginx, un backend con Node.js y una base de datos PostgreSQL.

La comunicación se organiza mediante dos redes Docker:

Frontend -> Backend -> Base de datos

El backend pertenece a ambas redes, mientras que el frontend y la base de datos no comparten una red directamente.

## Cambiar entre entornos

Para cambiar a DEV:

```bash
terraform workspace select dev
```

Para cambiar a QA:

```bash
terraform workspace select qa
```

Para comprobar el entorno actual:

```bash
terraform workspace show
```

## Verificar contenedores

```bash
docker ps
```

## Eliminar un entorno

Seleccionar primero el workspace correspondiente y ejecutar:

```bash
terraform destroy
```