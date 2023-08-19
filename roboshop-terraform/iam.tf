resource "aws_iam_policy" "policy" {
  name        = "${var.component}-${var.env}-ssm-polocy"
  path        = "/"
  description = "${var.component}-${var.env}-ssm-polocy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ssm:GetParameterHistory",
                "ssm:GetParametersByPath",
                "ssm:GetParameters",
                "ssm:GetParameter",
                "kms:Decrypt"
            ],
            "Resource": "arn:aws:ssm:us-east-1:192657108552:parameter/roboshop.${var.env}.${var.component}.*"
             #"docdb_arn"
             #var.kms_key_arn  
            #need to provide above 
        }
    ]
})
}

