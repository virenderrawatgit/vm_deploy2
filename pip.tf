resource "azurerm_public_ip" "tpip01" {
  name                = "tpip01"
  allocation_method   = "Static"
  location            = var.loc
  resource_group_name = var.rgname
  depends_on          = [azurerm_resource_group.trg01]

}

resource "azurerm_public_ip" "tpip02" {
  allocation_method   = "Static"
  location            = var.loc
  name                = "tpip02"
  resource_group_name = var.rgname
  depends_on          = [azurerm_resource_group.trg01]
}