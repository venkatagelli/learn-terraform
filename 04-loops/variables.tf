variable "environment" {
    default = "dev"
}

variable "project" {
    default = "roboshop"
}

variable "ami_id" {
  type        = string
  default     = "ami-0055977a6e828a4f4"
  description = "amiid of the instance"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "type of the instance"

  validation {
    condition  = contains(["t3.micro","t3.small","t3.medium","t3.large"],var.instance_type)
  error_message = "instance_type must be one of t3.micro,t3.small,t3.medium,t3.large"
  }
}

variable "instances" {
    type = list
    default = ["mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend"]
}