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

variable "ec2_tags" {
  type        = map
  default   =  {
    Name = "roboshop-mongodb"  
    Terraform = "true"
    environment = "dev"
    project = "roboshop"
    component = "mongodb"
  }
}

variable  "cidr" {
  type = list
  default = ["0.0.0.0/0"]
}

variable  "from_port" {
  type = number
  default = 0
}
