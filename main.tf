data "extip" "external_ip" {}

output "external_ip" {
  value = "${data.extip.external_ip.ipaddress}"
}

resource "null_resource" "cluster" {
  lifecycle { 
prevent_destroy = true 
}
  provisioner "local-exec" {
    command = "echo CowaBanga"
  }
}

resource "null_resource" "cluster-2" {
  depends_on = ["null_resource.cluster"]
  provisioner "local-exec" {
    command = "echo CowaBanga"
  }
}

