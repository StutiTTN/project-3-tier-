variable "ami_ec2" {
    type = string
    default = "ami-0851b76e8b1bce90b"
    description = "AMI ID for ec2 instance"
}

variable "instance_type_ec2" {
    type = string
    default = "t2.micro"
    description = "Instance type for ec2 instance"
}

variable "public_subnet_id_1_ec2" {
    type          = string
    description   = "public subnet id for instance"
}

variable "security_group_instance_ec2_2" {}

# variable "user_data_filename" {
#     type = string
#     default = "files/script.sh"
# }

variable "endpoint" {}