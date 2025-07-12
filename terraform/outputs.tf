output "load_balancer_url" {
  description = "Public ALB URL"
  value       = "http://${aws_lb.alb.dns_name}"
}
