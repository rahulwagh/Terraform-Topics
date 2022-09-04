data "null_data_source" "policy" {
  inputs = {
    policy = templatefile("${path.module}/policy.tpl", {
      name = "Rahul Wagh - data source example"
    })
  }
}

output "policy" {
  value = "${data.null_data_source.policy.outputs["policy"]}"
}

resource "null_resource" "pretend_aws_iam_policy" {
  triggers = {
    policy = "${data.null_data_source.policy.outputs["policy"]}"
  }

  provisioner "local-exec" {
    command = "echo ${data.null_data_source.policy.outputs["policy"]}"
  }
}
