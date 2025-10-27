terraform {
  backend "azurerm" {
    resource_group_name  = "aks-flask-prod-env-rg"
    storage_account_name = "aksflaskprodstorage"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
