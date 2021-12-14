variable "env_name" {
  description = "variable example"
  type        = string
}

variable "name" {
  description = "ec2 name"
  type        = string
}

variable "base_tags" {
  type        = map(string)
}

variable "custom_svc_env_tag" {
  type        = string
}