variable "web_instance_type"{
  type        = string
  description = "Instance type of EC2"
  default     = "t2.micro"
}
variable "ami_id" {
  type        = string
  description = "AMI ID of EC2"
  default     = "ami-0767046d1677be5a0"
}