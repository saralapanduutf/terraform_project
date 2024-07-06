variable "environment" {
  type    = string
  default = "staging"
}
variable "region" {
  default = "us-east-1"
}
variable "tags" {
  type        = map(string)
  description = "Describes the tags to be added to the resources"
  default = {
    Created_using = "Terraform"
    environment   = "staging"
  }

}

variable "key_name" {
  description = "The name of the key pair to use for the instance"
  type        = string
}
