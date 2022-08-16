resource "aws_iam_role" "ssm_role" {
  name               = "ssm_role"
  path               = "/"
  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
    }
    EOF
}

resource "aws_iam_policy_attachment" "ssm-attach" {
  name       = "test-attachment"
  roles      = [aws_iam_role.ssm_role.id]
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
}

resource "aws_iam_policy_attachment" "cloudwatch-attach" {
  name  = "test-attachment"
  roles = [aws_iam_role.ssm_role.id]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}