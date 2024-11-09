# variables.tf

variable "project_id" {
  description = "The project ID to deploy resources"
  type        = string
}

variable "region" {
  description = "The region where resources should be created"
  type        = string
  default     = "asia-south1"
}

variable "zone" {
  description = "The zone to deploy the GKE cluster"
  type        = string
  default     = "asia-south1-a"
}
