resource "azurerm_resource_group" "rg" {
   name = "${var.prefix}-rg"
   location = var.location
}

resource "azurerm_virtual_network" "vnet" {
   name = "vnet08"
   address_space = ["10.0.0.0/16"]
   location = azure_resource_group.rg.location
   resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
   name = "subnet08"
   resource_group_name = azurerm_resource_group.rg.name
   virtual_network_name = azurerm_virtual_network.vnet.name
   address_prefixes = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "nic" {
   name = "nic08"
   location = azure_resource_group.rg.location
   resource_group_name = azurerm_resource_group.rg.name

   ip_configuration {
      name = "testconfiguration1"
      subnet_id = azurerm_subnet.subnet.id
      private_ip_address_allocation = "Dynamic"
   }
}