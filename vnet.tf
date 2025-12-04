#create virtual network
resource "azurerm_virtual_network" "tvnet01" {
  name                = "vnet01"
  location            = var.loc
  resource_group_name = var.rgname
  address_space       = ["10.0.0.0/16"]
  depends_on          = [azurerm_resource_group.trg01]
}
#create a subnet
resource "azurerm_subnet" "tsubnet01" {
  name                 = "delhisubnet01"
  resource_group_name  = var.rgname
  virtual_network_name = azurerm_virtual_network.tvnet01.name
  address_prefixes     = ["10.0.1.0/24"]
  depends_on           = [azurerm_resource_group.trg01]
}
resource "azurerm_subnet" "tsubnet02" {
  name                 = "HRsubnet"
  resource_group_name  = var.rgname
  virtual_network_name = azurerm_virtual_network.tvnet01.name
  address_prefixes     = ["10.0.3.0/24"]
  depends_on           = [azurerm_resource_group.trg01]
}
#creating virtual NIC
resource "azurerm_network_interface" "tnic01" {
  name                = "vm01"
  location            = var.loc
  resource_group_name = var.rgname
  depends_on          = [azurerm_public_ip.tpip01]
  ip_configuration {
    name                          = "internal_ip"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.tsubnet01.id
    public_ip_address_id          = azurerm_public_ip.tpip01.id

  }
}

resource "azurerm_network_interface" "tnic02" {
  name                = "vm02"
  location            = var.loc
  resource_group_name = var.rgname
  depends_on          = [azurerm_public_ip.tpip02]
  ip_configuration {
    name                          = "internal_ip1"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.tsubnet02.id
    public_ip_address_id          = azurerm_public_ip.tpip02.id
  }
}

