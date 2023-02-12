provider "vault" {
  address = "http://127.0.0.1:8200"
  token   = data.aws_ssm_parameter.token.value
}
