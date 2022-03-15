module "vpc" {
    source = "./vpc/"
}

module "ec2" {
    source = "./ec2/"
    public_subnet_id_1_ec2 = module.vpc.public_subnet_1_id
    public_subnet_id_2_ec2 = module.vpc.public_subnet_2_id
    private_subnet_id_1_ec2 = module.vpc.private_subnet_2_id
    private_subnet_id_2_ec2 = module.vpc.private_subnet_2_id
    security_group_instance_ec2 = module.vpc.security_group_instance_id
}
