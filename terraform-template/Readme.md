## 1. How to use terraform output as input variable of another terraform template - https://stackoverflow.com/questions/41596412/how-to-use-terraform-output-as-input-variable-of-another-terraform-template

## 2. Convert Terraform Templates to Cloudformation Templates - https://stackoverflow.com/questions/47065279/convert-terraform-templates-to-cloudformation-templates

```
resource "template_file" "policy" {
  template = "${file("${path.module}/policy.tpl")}"

  vars = {
    name = "Rahul Wagh"
  }
} 
```

``` 
locals {
  policy = templatefile("${path.module}/policy.tpl", {
    name = "Rahul Wagh"
  })
}
```

```

data "null_data_source" "policy" {
  inputs = {
    policy = templatefile("${path.module}/policy.tpl", {
      name = "Rahul Wagh"
    })
  }
} 
```

``` 
resource "aws_iam_policy" "default" {
  policy = templatefile("${path.module}/policy.tpl", {
    name = "Justin"
  })
}
```
