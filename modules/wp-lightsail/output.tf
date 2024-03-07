output "lightsail_instance_name" {
    value = aws_lightsail_instance.this.name
}

output "lightsail_instance_public_ip_address" {
    value = aws_lightsail_static_ip.this.ip_address
}

output "lightsail_bucket_name" {
    value = aws_lightsail_bucket.this.id
}

output "lightsail_bucket_region" {
    value = aws_lightsail_bucket.this.region
}
