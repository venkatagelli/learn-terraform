resource "aws_instance" "finctions" {
  instance_type = "t3.micro"
  ami = "ami-0055977a6e828a4f4"
  vpc_security_group_ids = [aws_security_group.finctions.id]

tags = {
    merge {
      var.common-tags,
      {
        name = "functions-demo"
        component = "poc"
      }
    }
} 

resource "aws_security_group" "finctions" {
  name        = "web"
  description = "Allow TLS inbound traffic and all outbound traffic"

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
    merge {
      var.common-tags,
      {
        name = "functions-demo"
        component = "poc"
      }
    }
}
}