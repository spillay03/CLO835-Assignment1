# Instance type
variable "instance_type" {
  default = {
    "prod" = "t2.micro"
    "dev"  = "t2.micro"
  }
  description = "Type of the instance"
  type        = map(string)
}

# Variable to signal the current environment 
variable "env" {
  default     = "prod"
  type        = string
  description = "Production Environment"
}

# Prefix to identify resources
variable "prefix" {
  type    = string
  default = "clo835-assignment1"
}

# used to create two repsository 
variable "use_fullname" {
  type        = bool
  default     = false
  description = "Set 'true' to use `namespace-stage-name` for ecr repository name, else `name`"
}

# used to pass names for  two repsository 
variable "image_names" {
  type        = list(string)
  default     = ["cats-img-repo", "dogs-img-repo"]
  description = "List of Docker local image names, used as repository names for AWS ECR "
}

# used to create two repsository 
variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources"
}