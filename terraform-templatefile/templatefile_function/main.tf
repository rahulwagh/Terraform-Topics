resource "aws_iam_policy" "default" {
  #policy = templatefile("${path.module}/policy.tpl", {name = "Justin"})
  policy = templatefile("${path.module}/backends.tftpl", { name = 8080})
}

resource "template_file" "policy" {
  content     = templatefile("${path.module}/policy.tpl", {
    name = "justin"
  })
}

output "policy" {
  value = "${aws_iam_policy.default.policy}"
}
