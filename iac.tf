terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

provider "azurerm" {
  resource_provider_registrations = "none"
  subscription_id = "250ae9c3-6c33-4030-b72a-ed22fce22920"
  features {}
}

resource "azurerm_resource_group" "andreas_bot_group" {
  name = "andreas_bot_group"
  location = "eastus2"
}

resource "azurerm_service_plan" "andreas_bot_sp" {
  name = "andreas_bot_sp"
  resource_group_name = azurerm_resource_group.andreas_bot_group.name
  location = azurerm_resource_group.andreas_bot_group.location
  sku_name = "S1"
  os_type = "Windows"
}

resource "azurerm_windows_web_app" "andreas_bot_app" {
  name = "andreas-bot-appp"
  resource_group_name = azurerm_resource_group.andreas_bot_group.name
  location = azurerm_resource_group.andreas_bot_group.location
  service_plan_id = azurerm_service_plan.andreas_bot_sp.id
  site_config {
    always_on = false
  }
}

resource "azurerm_windows_web_app_slot" "andreas_bot_slot_qa" {
  name = "andreas-bot-slot-qa"
  app_service_id = azurerm_windows_web_app.andreas_bot_app.id
  site_config {
    
  }
}