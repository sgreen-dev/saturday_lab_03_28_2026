locals {
  instances = {
    web1 = { instance_type = var.instance_type, volume_size = var.volume_size }
    web2 = { instance_type = var.instance_type, volume_size = var.volume_size }
  }
}

locals {
  my_ipname = "${chomp(data.http.local_ip.response_body)}/32"
}