resource "aws_iam_user" "alice" {
  name = "Alice"
}

resource "aws_iam_instance_profile" "alice_profile" {
  name = "AliceProfile"
  role = aws_iam_role.alice_role.name
}

/*resource "aws_iam_user_instance_profile_attachment" "alice_profile_attachment" {
  user           = aws_iam_user.alice.name
  instance_profile = aws_iam_instance_profile.alice_profile.name
}*/

resource "aws_iam_user_policy_attachment" "alice_s3_access" {
  user       = aws_iam_user.alice.name
  policy_arn = aws_iam_policy.allow_s3_access.arn
}