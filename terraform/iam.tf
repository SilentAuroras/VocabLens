// EKS IAM role
resource "aws_iam_role" "eks-cluster-role" {
  name = "eks-cluster-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })
}

// EKS IAM Role attachment
resource "aws_iam_role_policy_attachment" "eks-cluster-attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_eks_cluster.vocablens-eks.name

  // Wait for cluster
  depends_on = [
    aws_eks_cluster.vocablens-eks
  ]
}