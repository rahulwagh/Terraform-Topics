resource "template_file" "policy" {
  template = "${file("${path.module}/policy.tpl")}"

  vars = {
    name = "Rahul Wagh"
  }
}

output "policy" {
  value = "${template_file.policy.rendered}"
}

resource "null_resource" "pretend_aws_iam_policy" {
  triggers = {
    policy = "${template_file.policy.rendered}"
  }

  provisioner "local-exec" {
    command = "echo ${template_file.policy.rendered}"
  }
}