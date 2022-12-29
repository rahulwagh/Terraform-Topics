variable "web_region" {
  type        = string
  description = "Region of Project"
  default     = "eu-central-1"
}
variable "web_instance_type" {
  type        = string
  description = "Instance Type of EC2"
  default     = "t2.micro"
}
variable "ami_id" {
  type        = string
  description = "EC2 Machine AMI id"
  default     = "ami-0767046d1677be5a0"
}
variable "access_key" {
  type        = string
  description = "Access key of AWS"
  default     = ""
}
variable "secret_key" {
  type        = string
  description = "Secret Access key of AWS"
  default     = ""
}