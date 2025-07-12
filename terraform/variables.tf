variable "aws_region" {
  description = "AWS region to deploy to"
  default     = "ap-south-1"
}

variable "container_image" {
  description = "Docker image to deploy (ECR)"
  type        = string
}
