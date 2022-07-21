data "azurerm_key_vault" "soc_vault" {
  provider            =      azurerm.soc
  name                =       var.soc_vault_name
  resource_group_name =    var.soc_vault_rg
}v
}
