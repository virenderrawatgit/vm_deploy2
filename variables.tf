variable "rgname" {
  default = "rgvnet01"
}
variable "loc" {
  default = "eastus"
}

variable "userID" {
  description = "Enter your user ID which going to cretae"
  type        = string
}

variable "userPass" {
  description = "Enter your password to login"
  type        = string
  sensitive   = true
}