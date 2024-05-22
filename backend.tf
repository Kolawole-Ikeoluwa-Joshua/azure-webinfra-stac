terraform {
  backend "remote" {
    organization = "vtl-zenith"

    workspaces {
      name = "vtl-zenith-dev"
    }
  }
}
