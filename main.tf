module "vpc" {
    source = "./vpc/"
}

data "local_file" "user_data_file" {
    filename = var.user_data_filename
}

module "ec2" {
    source = "./ec2/"
    public_subnet_id_1_ec2 = module.vpc.public_subnet_1_id
    public_subnet_id_2_ec2 = module.vpc.public_subnet_2_id
    private_subnet_id_1_ec2 = module.vpc.private_subnet_2_id
    private_subnet_id_2_ec2 = module.vpc.private_subnet_2_id
    security_group_instance_ec2 = module.vpc.security_group_instance_id
    user_data_public = data.local_file.user_data_file.content
}

module "alb" {
  source = "./alb/"
  ec2_id1 = module.ec2.ec2_id1
  ec2_id2 = module.ec2.ec2_id2
  myvpc_id = module.vpc.myvpc_id
  public_subnet_id_1 = module.vpc.public_subnet_1_id
  public_subnet_id_2 = module.vpc.public_subnet_2_id
  security_group_alb = module.vpc.security_group_alb
}
