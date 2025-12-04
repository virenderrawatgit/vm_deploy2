output "getPublic" {
  value = "http://${azurerm_public_ip.tpip01.ip_address}"
}
output "getPublic1" {
  value = "http://${azurerm_public_ip.tpip02.ip_address}"
}

output "priv1" {
  value = azurerm_network_interface.tnic01.private_ip_address
}

output "priv2" {
  value = azurerm_network_interface.tnic02.private_ip_address
}