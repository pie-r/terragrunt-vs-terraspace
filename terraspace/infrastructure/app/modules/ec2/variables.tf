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

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}