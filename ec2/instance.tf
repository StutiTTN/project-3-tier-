resource "aws_instance" "public_instance_1" {
	ami  = var.ami_ec2
 	instance_type = var.instance_type_ec2
	key_name = aws_key_pair.generated_key.key_name
    subnet_id = var.public_subnet_id_1_ec2
    vpc_security_group_ids = [var.security_group_instance_ec2]
}

resource "aws_instance" "public_instance_2" {
	ami  = var.ami_ec2
 	instance_type = var.instance_type_ec2
	key_name = aws_key_pair.generated_key.key_name
    subnet_id = var.public_subnet_id_2_ec2
    vpc_security_group_ids = [var.security_group_instance_ec2]
}

resource "aws_instance" "private_instance_1" {
	ami  = var.ami_ec2
 	instance_type = var.instance_type_ec2
	key_name = aws_key_pair.generated_key.key_name
    subnet_id = var.private_subnet_id_1_ec2
    vpc_security_group_ids = [var.security_group_instance_ec2]
}

resource "aws_instance" "private_instance_2" {
	ami  = var.ami_ec2
 	instance_type = var.instance_type_ec2
	key_name = aws_key_pair.generated_key.key_name
    subnet_id = var.private_subnet_id_2_ec2
    vpc_security_group_ids = [var.security_group_instance_ec2]
}
