# EBS volumes
resource "aws_ebs_volume" "tfe_data" {
  availability_zone = var.availabilityZone
  size              = var.tfe_disks["tfe_data"]["size"]
  tags = {
    collect_tag = "${var.disks_tag}"
  }
}

resource "aws_ebs_volume" "tfe_snapshot" {
  availability_zone = var.availabilityZone
  size              = var.tfe_disks["tfe_snapshot"]["size"]
  tags = {
    collect_tag = "${var.disks_tag}"
  }
}

# EBS volume attchments
resource "aws_volume_attachment" "tfe_data" {
  device_name = var.tfe_disks["tfe_data"]["device_name"]
  volume_id   = "${aws_ebs_volume.tfe_data.id}"
  instance_id = "${aws_instance.ptfe.id}"
}

resource "aws_volume_attachment" "tfe_snapshot" {
  device_name = var.tfe_disks["tfe_snapshot"]["device_name"]
  volume_id   = "${aws_ebs_volume.tfe_snapshot.id}"
  instance_id = "${aws_instance.ptfe.id}"
}
