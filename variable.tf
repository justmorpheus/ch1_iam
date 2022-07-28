

variable "AmiLinux" {
  type = map(string)

  default = {
    us-west-2 = "" # Virginia-ami-b73b63a0
  }
  description = "have only added one region"
}
  
