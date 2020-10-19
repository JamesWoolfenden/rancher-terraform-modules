#add
#  access_key = var.rancher_access_key
#  secret_key = var.rancher_secret_key
# as env vars
provider "rancher" {
  api_url = var.rancher_api_url
}
