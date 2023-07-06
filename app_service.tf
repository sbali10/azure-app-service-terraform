resource "azurerm_app_service_plan" "terraform-app-service-plan" {
  name                = var.webapp-plan_name
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "PremiumV3"
    size = "P1v3"
  }
}

resource "azurerm_app_service_plan" "webapp-plan_name" {
  name                = var.webapp-plan_name
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "PremiumV3"
    size = "P1v3"
  }
}

resource "azurerm_app_service" "orcla-terraform-app-service" {
  name                = var.orcla-terraform-app-service_name
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  app_service_plan_id = azurerm_app_service_plan.terraform-app-service-plan.id
  # app_settings = {
  #   DOCKER_REGISTRY_SERVER_URL          = "orcladev3.azurecr.io"
  #   DOCKER_REGISTRY_SERVER_USERNAME     = "orcladev3"
  #   DOCKER_REGISTRY_SERVER_PASSWORD     = "WN/rU4iWV2NxqG4SQxFuNUp9fEcEgXSr"
  #   WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
  # }

  site_config {
    always_on                 = true
    linux_fx_version          = "DOCKER|orcladev3.azurecr.io/terraform-demo:initial"
    use_32_bit_worker_process = true
    scm_type                  = "None"
  }

}


resource "azurerm_app_service" "orcla-terraform-manuel" {
  name                = var.orcla-terraform-manuel_name
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  app_service_plan_id = azurerm_app_service_plan.terraform-app-service-plan.id
  # app_settings = {
  #   DOCKER_REGISTRY_SERVER_URL          = "orcladev3.azurecr.io"
  #   DOCKER_REGISTRY_SERVER_USERNAME     = "orcladev3"
  #   DOCKER_REGISTRY_SERVER_PASSWORD     = "WN/rU4iWV2NxqG4SQxFuNUp9fEcEgXSr"
  #   WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
  #   WEBSITES_PORT                       = 3000
  # }

  site_config {
    always_on                 = true
    linux_fx_version          = "DOCKER|orcladev3.azurecr.io/terraform-demo:grafana"
    use_32_bit_worker_process = true
    scm_type                  = "None"
  }
}


resource "azurerm_app_service" "orcla-admin-client-tmp" {
  name                = var.orcla-admin-client-tmp_name
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  app_service_plan_id = azurerm_app_service_plan.webapp-plan_name.id
  app_settings = {
    DOCKER_REGISTRY_SERVER_URL                 = "REGISTRY_URL"
    DOCKER_REGISTRY_SERVER_USERNAME            = "USERNAME"
    DOCKER_REGISTRY_SERVER_PASSWORD            = "PASSWORD"
    #WEBSITES_ENABLE_APP_SERVICE_STORAGE        = false
    #WEBSITES_PORT                              = 3000
    APPINSIGHTS_INSTRUMENTATIONKEY             = "f2e469c8-cf98-4f96-a4dc-034fce7b6573"
    APPLICATIONINSIGHTS_CONNECTION_STRING      = "InstrumentationKey=f2e469c8-cf98-4f96-a4dc-034fce7b6573;IngestionEndpoint=https://westeurope-5.in.applicationinsights.azure.com/;LiveEndpoint=https://westeurope.livediagnostics.monitor.azure.com/"
    ApplicationInsightsAgent_EXTENSION_VERSION = "~3"
    AUTH0_AUDIENCE                             = "http://localhost:3000"
    AUTH0_CLIENTID                             = "2q0kgIfxkGFwT1E6iSx3mKI4K0KRlk2G"
    AUTH0_DOMAIN                               = "siemens-qa-00257.eu.auth0.com"
    AUTH0_SIGNUP                               = "sup"
    DOMAIN                                     = "https://orcla-client-api.azurewebsites.net/"
    GET_MY_DEVICES                             = "client/getMyDevices"
    REGISTER                                   = "client/registerDeviceWithEnrollmentCode"
    UNREGISTER                                 = "client/deleteDeviceRegistration"
    WEBSITES_ENABLE_APP_SERVICE_STORAGE        = "false"
    WEBSITES_PORT                              = "3400"
    XDT_MicrosoftApplicationInsights_Mode      = "Recommended"
    
    
  }

  site_config {
    always_on                 = true
    linux_fx_version          = "DOCKER|orcladev3.azurecr.io/orcla/admin-client:1.1.17"
    use_32_bit_worker_process = true
    scm_type                  = "None"
  }
}