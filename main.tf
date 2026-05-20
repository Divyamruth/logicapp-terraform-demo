provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "rg" {
  name = "my-first-rg-demo"
}

resource "azurerm_resource_group_template_deployment" "logicapp" {
  name                = "logicapp-arm-deploy"
  resource_group_name = data.azurerm_resource_group.rg.name
  deployment_mode     = "Incremental"

  template_content = file("workflow.json")
}


# deploying this resource_explorer data into ARM
