variable "user_names" {
    description = "Create IAM users testando"
    type = list(string)
    default = [ "Peter","Chris","Stewie" ]  
}

resource "aws_iam_user" "quiz_experts_user" {
    count = length(var.user_names)
    name = var.user_names [count.index]
}


