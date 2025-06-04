terraform {
   backend "azurerm" {
      resource_group_name = "demo-rg"
      storage_account_name = "storage9898tp001"
      container_anem = "prod-9898"
      key = "prod.terraform.tfstate"
   }
}
