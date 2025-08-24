

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "Justo01" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
}

variable "user_names" {
    description = "Create IAM users testando"
    type = list(string)
    default = [ "Peter","Chris","Stewie" ]  
}


resource "aws_iam_user" "quiz_experts_user" {
    count = length(var.user_names)
    name = var.user_names [count.index]
}


