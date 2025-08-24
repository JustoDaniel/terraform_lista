variable "user_names" {
    description = "Create IAM users testando"
    type = list(string)
    default = [ "Peter","Chris","Stewie" ]  
}

resource "aws_instance" "Justo01" {
    ami     = "ami-05803413c51f242b7"
    instance_type  = "t2.micro"
}



resource "aws_iam_user" "quiz_experts_user" {
    count = length(var.user_names)
    name = var.user_names [count.index]
}


