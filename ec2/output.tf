output "ec2_id1" {
    value = aws_instance.public_instance_1.id  
}
output "ec2_id2" {
  value = aws_instance.public_instance_2.id
}
