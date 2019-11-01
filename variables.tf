variable "site_domain" {
  default = "guselietov.com"
}

variable "site_record" {
  default = "ptfe-pm-2"
}

variable "region" {
  default = "eu-central-1"
}

variable "availabilityZone" {
  default = "eu-central-1a"
}

variable "vpc_tag" {
  default = "ag_ptfe_pm"
}

variable "disks_tag" {
  default = "ag_ptfe_pm"
}

variable "subnet_ids" {
  type = "map"
  default = {
    "eu-central-1" = "subnet-7282ce1a"
  }
}

variable "amis" {
  type = "map"
  default = {
    "us-east-2"    = "ami-00f03cfdc90a7a4dd",
    "eu-central-1" = "ami-08a162fe1419adb2a"
  }
}

variable "instance_type" {
  default = "m5.large"
}

variable "learntag" {
  type    = "string"
  default = "200tf"
}

variable "tfe_disks" {
  type = "map"
  default = {
    "tfe_data" = {
      name        = "tfe-data"
      mount_point = "/tfe-data"
      device_name = "/dev/sdf"
      size        = 41 # G
    },
    "tfe_snapshot" = {
      name        = "tfe-snapshots"
      mount_point = "/tfe-snapshots"
      device_name = "/dev/sdg"
      size        = 100 # G 
    },
  }
}
