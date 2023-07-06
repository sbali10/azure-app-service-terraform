variable "location" {
  type        = string
  description = "Location to deploy the resource group"
  default     = "Germany West Central"
}


variable "container_registry_name" {
    default = "orcladev3"
  
}


variable "app_service_plan_name" {
    default = "orcla-app-service-plan"
  
}

variable "webapp-plan_name" {
    default = "webapp-plan"
  
}


variable "orcla-terraform-app-service_name" {
    default = "orcla-terraform-app-service"
  
}


variable "orcla-terraform-manuel_name" {
    default = "orcla-terraform-manuel"
  
}

variable "orcla-admin-client-tmp_name" {
    default = "orcla-admin-client-tmp"
  
}
