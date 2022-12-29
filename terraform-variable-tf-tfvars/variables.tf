variable "project_id" {
  type = string
  description = "The Project ID"
}
variable "github_repo" {
  type = string
  description = "The GitHub repo in the format username/repo_name"
}
variable "location" {
  type = string
  description = "The project region"
  default = "eu-central1"
}
