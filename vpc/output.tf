output "public_subnet_1_id"  {
        value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2_id"  {
        value = aws_subnet.public_subnet_2.id
}

output "private_subnet_1_id"  {
        value = aws_subnet.private_subnet_1.id
}

output "private_subnet_2_id"  {
        value = aws_subnet.private_subnet_2.id
}

output "security_group_instance_id" {
        value = aws_security_group.security_group_instance.id
}

output "security_group_instance_id_2" {
        value = aws_security_group.security_group_instance2.id
}

output "security_group_alb" {
        value = aws_security_group.security_group_alb.id
}

output "myvpc_id" {
        value = aws_vpc.my_vpc.id
}

output "security_group_rds_id" {
        value = aws_security_group.security_group_rds.id
}