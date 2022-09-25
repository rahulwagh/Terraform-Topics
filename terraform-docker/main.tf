terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.21.0"
    }
  }
}

provider "docker" {
}

# Pulls the image
resource "docker_image" "node-js-app" {
  name = "ubuntu/docker-node-terraform-app"
  keep_locally = false
}


resource "docker_container" "foo" {
  image = docker_image.node-js-app.latest
  name  = "tutorial"
  ports {
    internal = 8080
    external = 49160
  }
}
