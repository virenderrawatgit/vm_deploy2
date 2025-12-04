provider "azurerm" {
  features {
  }
}
#create new Resourece Group
resource "azurerm_resource_group" "trg01" {
  name     = var.rgname
  location = var.loc
}

resource "azurerm_windows_virtual_machine" "tvm01" {
  resource_group_name   = var.rgname
  location              = var.loc
  name                  = "vm001"
  size                  = "Standard_DS4_v2"
  admin_username        = var.userID
  admin_password        = var.userPass
  network_interface_ids = [azurerm_network_interface.tnic01.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_windows_virtual_machine" "tvm02" {
  resource_group_name   = var.rgname
  location              = var.loc
  name                  = "vm002"
  size                  = "Standard_DS4_v2"
  admin_username        = "virender"
  admin_password        = "Hcl@123456789"
  network_interface_ids = [azurerm_network_interface.tnic02.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

