data "template_file" "usd_data" {
    template = file("/home/stuti/Documents/workshop-project/ec2/files/usd.sh")
    vars = {
      endpoint = var.endpoint
    }
}

resource "aws_instance" "public_instance_1" {
  depends_on = [
    local_file.key_file
  ]
	ami  = var.ami_ec2
 	instance_type = var.instance_type_ec2
	key_name = aws_key_pair.generated_key.key_name
  subnet_id = var.public_subnet_id_1_ec2
  vpc_security_group_ids = [var.security_group_instance_ec2_2]
	user_data = data.template_file.usd_data.rendered

	tags = {
		Name = "BastionHost"
	}
}
