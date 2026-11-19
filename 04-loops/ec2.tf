resource "aws_instance" "roboshop" {
  count = 10
  instance_type = "t3.micro"
  ami = "ami-0055977a6e828a4f4"
  vpc_security_group_ids = [
      aws_security_group.common.id,
      aws_security_group.roboshop[count.index].id
      ]

tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
  }
} 

resource "aws_security_group" "common" {
  name        = "${var.project}-${var.environment}-common"
  description = "A common SG for all the instances of roboshop"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    }
 
  tags = {
    Name = "${var.project}-${var.environment}-common"
  }
}

resource "aws_security_group" "roboshop" {
  count = 10
  name        = "${var.project}-${var.environment}-${var.instances[count.index]}"
  description = "A component SG for all the instances of roboshop"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    }
 
  tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
  }
}