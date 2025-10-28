resource "docker_image" "app_image" {
  name         = "ghcr.io/aditya210904/devops_proj:latest"
  keep_locally = true
  pull_triggers = [timestamp()]
}

resource "docker_container" "app_container" {
  name  = "my-web-app"
  image = docker_image.app_image.image_id
  
  ports {
    internal = 80
    external = 8080
  }
  
  restart = "unless-stopped"
  
  # Remove existing container if it exists
  remove_volumes = true
  must_run       = true
}
