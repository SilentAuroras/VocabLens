// ECR for Go docker images
resource "aws_ecr_repository" "vocablens-repo" {
  name = "vocablens-repo"
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}