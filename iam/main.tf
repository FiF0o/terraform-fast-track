provider "aws" {
  region = "eu-west-2"
}

resource "aws_iam_user" "myUser" {
  name = "Jon"  
}

resource "aws_iam_policy" "customPolicy" {
  # https://us-east-1.console.aws.amazon.com/iam/home#/policies$new?step=edit
  name = "Glacier_ListProvisionedCapacity_List_Read_All"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "VisualEditor0",
          "Effect": "Allow",
          "Action": [
              "glacier:ListProvisionedCapacity"
          ],
          "Resource": "*"
      }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "policy-bind" {
  name = "Attachment"
  users = [aws_iam_user.myUser.name]
  policy_arn = aws_iam_policy.customPolicy.arn
}
