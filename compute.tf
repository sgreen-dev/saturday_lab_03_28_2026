# Create EC2 Instance
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = [var.ubuntu_ami_filter]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = [var.canonical_owner_id] # Canonical
}

resource "aws_instance" "web" {
  for_each               = local.instances
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = each.value.instance_type
  subnet_id              = aws_subnet.public.id
  iam_instance_profile   = aws_iam_instance_profile.ec2_instance_profile.name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = var.metadata_hop_limit
  }

  root_block_device {
    volume_type           = "gp3"
    volume_size           = each.value.volume_size
    delete_on_termination = true
    encrypted             = true
  }

  user_data = templatefile("${path.module}/userdata/init.sh", {
    ssm_agent_version = var.ssm_agent_version
  })

  tags = {
    Name = each.key
  }
}

resource "aws_eip" "web" {
  for_each = local.instances
  domain   = "vpc"

  tags = {
    Name = "${each.key}-eip"
  }
}

resource "aws_eip_association" "web" {
  for_each      = local.instances
  allocation_id = aws_eip.web[each.key].id
  instance_id   = aws_instance.web[each.key].id

  depends_on = [aws_eip.web, aws_instance.web]
}