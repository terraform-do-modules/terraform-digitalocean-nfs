module "nfs" {
  source = "../../"

  name        = "app"
  environment = "dev"
  enabled     = true

  region           = "nyc1"
  size             = 50
  vpc_id           = "00000000-0000-0000-0000-000000000000"
  performance_tier = "high"

  enable_attachment = false
  attachment_vpc_id = ""
  enable_snapshot   = false
}
