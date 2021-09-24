variable "name" {
  description = "EC2 name"
}

variable "env_name" {
  description = "environment name"
}

variable "machine_type" {
  description = "EC2 type"
}

variable "disable_termination" {
  description = "This will prevent the deletion of Test"
  default     = true
}

variable "shared_vpc_public_subnets" {
  type        = list(string)
  
}
