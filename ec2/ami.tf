# resource  "aws_ami_from_instance" "custom_ami" {
#     name               = "wordpress"
#     source_instance_id = aws_instance.public_instance_1.id

#   depends_on = [
#     aws_instance.public_instance_1,
#   ]
# }