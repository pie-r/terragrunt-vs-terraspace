variable "env_name" {
  description = "variable example"
  type        = string
}

variable "cidr" {
  type        = string
}

variable "private_subnets" {
  type        = list(string)
}

variable "public_subnets" {
  type        = list(string)
}

variable "base_tags" {
  type        = map(string)
}