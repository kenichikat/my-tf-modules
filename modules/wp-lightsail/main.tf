
# Lightsail instance.
resource "aws_lightsail_key_pair" "this" {
  name       = "${var.name}-kp"
  public_key = file("${var.public_key_path}")
}

resource "aws_lightsail_instance" "this" {
  name              = var.name
  availability_zone = var.availability_zone
  blueprint_id      = "wordpress"
  bundle_id         = var.instance_bundle_id
  key_pair_name     = aws_lightsail_key_pair.this.name
  #   add_on {
  #     type          = "AutoSnapshot"
  #     snapshot_time = "06:00"
  #     status        = "Enabled"
  #   }

  tags = {
    Env = var.env_name
  }
}

resource "aws_lightsail_static_ip" "this" {
  name = "${var.name}-ip"
}

resource "aws_lightsail_static_ip_attachment" "this" {
  static_ip_name = aws_lightsail_static_ip.this.name
  instance_name  = aws_lightsail_instance.this.name
}

# lightsail instance public ports.
resource "aws_lightsail_instance_public_ports" "this" {
  instance_name = aws_lightsail_instance.this.name

  port_info {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidrs     = ["0.0.0.0/0"]
  }

  port_info {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidrs     = ["0.0.0.0/0"]
  }

  port_info {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidrs     = ["0.0.0.0/0"]
  }
}

# lightsail bucket for media distoribution.
resource "aws_lightsail_bucket" "this" {
  name      = "${var.name}-media"
  bundle_id = var.bucket_bundle_id

  tags = {
    Env = var.env_name
  }
}

resource "aws_lightsail_bucket_resource_access" "this" {
  bucket_name   = aws_lightsail_bucket.this.id
  resource_name = aws_lightsail_instance.this.name
}