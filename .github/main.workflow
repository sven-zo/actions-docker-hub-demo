workflow "Build & Push containers" {
  on = "push"
  resolves = ["GitHub Action for Docker"]
}

action "Docker Registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Docker Registry"]
  args = "build -t svenzo/actions-docker-hub-demo src && docker push svenzo/actions-docker-hub-demo"
}
