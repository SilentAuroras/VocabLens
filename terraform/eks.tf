// EKS cluster
resource "aws_eks_cluster" "vocablens-eks" {
  name     = "vocablens-eks"

  // Define authentication
  access_config {
    authentication_mode = "API"
  }

  // Assign role
  role_arn = aws_iam_role.eks-cluster-role.arn
  version = "1.35"

  // Configure VPC subnets
  vpc_config {
    subnet_ids = [
      aws_subnet.vocablens-subnet.id
    ]
  }

  // Wait for IAM role attachment
  depends_on = [
    aws_iam_role_policy_attachment.eks-cluster-attachment
  ]
}
