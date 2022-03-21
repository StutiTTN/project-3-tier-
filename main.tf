module "vpc" {
    source = "./vpc/"
}

module "rds" {
    source = "./rds/"
    private_subnet_ids = [module.vpc.private_subnet_1_id, module.vpc.private_subnet_2_id]
    security_group_rds = module.vpc.security_group_rds_id
}

module "ec2" {
    source = "./ec2/"
    endpoint = module.rds.endpoint
    public_subnet_id_1_ec2 = module.vpc.public_subnet_1_id
    security_group_instance_ec2_2 = module.vpc.security_group_instance_id_2
}

module "alb" {
  source = "./alb/"
  depends_on = [module.rds]
  myvpc_id = module.vpc.myvpc_id
  public_subnet_ids = [module.vpc.public_subnet_1_id, module.vpc.public_subnet_2_id]
  security_group_alb = module.vpc.security_group_alb
}

module "autoscaling" {
    source ="./autoscaling/"
    depends_on = [module.rds]
    key_file = module.ec2.key_name
    endpoint = module.rds.endpoint
    alb_target_group_arn = module.alb.alb_target_group_arn 
    vpc_zone_identifier = [module.vpc.private_subnet_1_id, module.vpc.private_subnet_2_id]
    security_group_instance_id = [module.vpc.security_group_instance_id]
}
