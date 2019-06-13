provider "aws" {
  region = "${var.region_name}"
}


resource "aws_security_group" "db" {
	name        = "allow_mysql"
	description = "Allow mysql access to 10.0.0.0/8 subnet"
	vpc_id      = "${var.vpc_id}"
	ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }
}

resource "aws_db_subnet_group" "dbsubnet" {
  name       = "db_subnet"
  subnet_ids = ["${var.subnet_id}", "${var.subnet_id_1}"]

  tags {
    Name = "My DB subnet group"
  }
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count = 2
  identifier = "${var.project}-${var.environment}-instance"
  cluster_identifier = "${aws_rds_cluster.default.id}"
  instance_class = "${var.instance_class}"
}

resource "aws_rds_cluster" "default" {
  cluster_identifier = "${var.project}-${var.environment}"
  availability_zones = ["us-east-1e","us-east-1b","us-east-1d"]
  database_name = "${var.name}"
  master_username = "${var.username}"
  master_password = "${var.password}"
  vpc_security_group_ids = [ "${aws_security_group.db.id}" ]
  db_subnet_group_name = "${aws_db_subnet_group.dbsubnet.name}"
  port = "3306"
}