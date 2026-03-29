variable "ubuntu_ami_filter" {
  description = "AMI name filter for Ubuntu"
  type        = string
  default     = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server*"
}

variable "canonical_owner_id" {
  description = "AWS account ID for Canonical (Ubuntu AMI publisher)"
  type        = string
  default     = "099720109477"
}

variable "ssm_agent_version" {
  description = "SSM agent version to install via userdata"
  type        = string
  default     = "3.0.0"
}

variable "metadata_hop_limit" {
  description = "IMDSv2 hop limit for EC2 instance metadata"
  type        = number
  default     = 1
}

variable "ec2_instance_profile_name" {
  description = "Name of the EC2 instance profile"
  type        = string
  default     = "ec2_instance_profile"
}

variable "ec2_role_name" {
  description = "Name of the EC2 IAM role"
  type        = string
  default     = "ec2_role"
}

variable "ssm_policy_arn" {
  description = "ARN of the SSM managed policy to attach to EC2 role"
  type        = string
  default     = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

variable "instance_type" {
  description = "EC2 instance type for web servers"
  type        = string
  default     = "t3.medium"
}

variable "volume_size" {
  description = "Root volume size in GB for web servers"
  type        = number
  default     = 50
}

variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}