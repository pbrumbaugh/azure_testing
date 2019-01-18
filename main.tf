provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.21.0"

  subscription_id = "5d9bf9f0-fb20-4c88-836a-d7420d32156a"
}
# Create a resource group
resource "azurerm_resource_group" "test" {
  name     = "PSBTest2"
  location = "East US"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "test" {
  name                = "PSBTest2-network"
  resource_group_name = "${azurerm_resource_group.test.name}"
  location            = "${azurerm_resource_group.test.location}"
  address_space       = ["10.0.0.0/16"]
}
