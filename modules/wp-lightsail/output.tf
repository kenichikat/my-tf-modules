output "lightsail_instance_name" {
  value = aws_lightsail_instance.this.name
}

output "lightsail_instance_public_ip" {
  value = aws_lightsail_static_ip.this.ip_address
}

output "aws_lightsail_bucket_name" {
  value = aws_lightsail_bucket.this.name
}