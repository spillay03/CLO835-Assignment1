# Instance type
variable "instance_type" {
  default = {
    "prod"    = "t3.medium"
    "test"    = "t3.micro"
    "staging" = "t2.micro"
    "dev"     = "t2.micro"
  }
  description = "Type of the instance"
  type        = map(string)
}

# Variable to signal the current environment 
variable "env" {
  default     = "dev"
  type        = string
  description = "Deployment Environment"
}

# Prefix to identify resources
variable "prefix" {
  type    = string
  default = "clo835-assignment1"
}

variable "ecr_count" {
  type    = number
  default = "2"
}

variable "use_fullname" {
  type        = bool
  default     = false
  description = "Set 'true' to use `namespace-stage-name` for ecr repository name, else `name`"
}

variable "image_names" {
  type        = list(string)
  default     = ["cats", "dogs"]
  description = "List of Docker local image names, used as repository names for AWS ECR "
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources"
}