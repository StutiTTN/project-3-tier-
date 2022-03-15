variable "ami_ec2" {
    type = string
    default = "ami-04505e74c0741db8d"
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

variable "public_subnet_id_2_ec2" {
    type          = string
    description   = "public subnet id for instance"
}

variable "private_subnet_id_1_ec2" {
    type          = string
    description   = "private subnet id for instance"
}

variable "private_subnet_id_2_ec2" {
    type          = string
    description   = "private subnet id for instance"
}

variable "security_group_instance_ec2" {
}
