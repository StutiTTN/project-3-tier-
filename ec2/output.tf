output "ec2_id1" {
    value = aws_instance.public_instance_1.id  
}

output "key_name" {
    value = aws_key_pair.generated_key.key_name
}