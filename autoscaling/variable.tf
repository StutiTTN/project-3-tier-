variable "security_group_instance_id" {
    type = list
}
variable "alb_target_group_arn" {}

variable "key_file" {}

variable "vpc_zone_identifier" {
    type = list  
}
variable "endpoint" {}