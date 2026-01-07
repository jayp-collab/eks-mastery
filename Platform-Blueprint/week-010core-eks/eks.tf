module "eks-cluster" {
  source = "terraform-aws-modules/eks/aws"
  version = "20.8.3"

  cluster_name = "eks-mastery"
  cluster_version = "1.33"

  vpc_id = module.vpc.vpc_id 
  subnet_ids = module.vpc.private_subnets

  enable_cluster_creator_admin_permissions = true

  # EKS Managed Node Group(s)
  eks_managed_node_groups = {
    example = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["m5.xlarge"]

      min_size     = 2
      max_size     = 10
      desired_size = 2
    }
  }
}



