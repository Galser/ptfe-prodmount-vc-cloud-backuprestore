# Only computing resources are here

# SSH key for provision
resource "aws_key_pair" "ptfe-key" {
  key_name   = "ptfe-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

# Instance
resource "aws_instance" "ptfe" {
  ami                    = var.amis[var.region]
  instance_type          = "${var.instance_type}"
  subnet_id              = "${module.vpc_aws.subnet_id}"
  vpc_security_group_ids = ["${module.vpc_aws.security_group_id}"]
  key_name               = "${aws_key_pair.ptfe-key.id}"

  root_block_device {
    volume_size = 40
  }

  tags = {
    "Name"      = "ptfe-prodmount-2-andrii",
    "andriitag" = "true",
    "learntag"  = "${var.learntag}"
  }

  volume_tags = {
    "Name"      = "ptfe-prodmount-2-andrii",
    "andriitag" = "true",
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file("~/.ssh/id_rsa")}"
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    script = "scripts/provision.sh"
  }

  provisioner "file" {
    source      = "scripts/mount-ebs.sh"
    destination = "/tmp/mount-ebs.sh"
  }

  provisioner "file" {
    source      = "scripts/delete_all.sh"
    destination = "/tmp/delete_all.sh"
  }

}

# Provision EBS volumes
resource "null_resource" "ebs-provision" {
  triggers = {
    esb_volumes_ids = "${aws_ebs_volume.tfe_data.id}, ${aws_ebs_volume.tfe_snapshot.id}, ${aws_instance.ptfe.id}"
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file("~/.ssh/id_rsa")}"
    host        = aws_instance.ptfe.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/mount-ebs.sh",
      "/tmp/mount-ebs.sh ${aws_ebs_volume.tfe_data.id} ${var.tfe_disks["tfe_data"]["device_name"]} ${var.tfe_disks["tfe_data"]["mount_point"]}",
      "/tmp/mount-ebs.sh ${aws_ebs_volume.tfe_snapshot.id} ${var.tfe_disks["tfe_snapshot"]["device_name"]} ${var.tfe_disks["tfe_snapshot"]["mount_point"]}",
    ]
  }

}


