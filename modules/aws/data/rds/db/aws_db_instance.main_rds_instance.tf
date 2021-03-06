resource "aws_db_instance" "main_rds_instance" {
  # checkov:skip=CKV_AWS_157: ADD REASON
  allocated_storage               = var.rds_allocated_storage
  enabled_cloudwatch_logs_exports = ["general", "error", "slowquery"]
  engine                          = var.rds_engine_type
  engine_version                  = var.rds_engine_version
  identifier                      = var.rds_instance_name
  instance_class                  = var.rds_instance_class
  monitoring_interval             = 5
  name                            = var.database_name
  password                        = var.database_password
  storage_encrypted               = true
  username                        = var.database_user
  //snapshots and backups
  skip_final_snapshot       = var.skip_final_snapshot
  copy_tags_to_snapshot     = var.skip_final_snapshot == "false" ? "true" : "false"
  final_snapshot_identifier = format("%s-finalsnapshot", var.rds_instance_name)
  backup_retention_period   = var.backup_retention_period

  // Because we're assuming a VPC, we use this option, but only one SG id
  vpc_security_group_ids = [var.rds_security_group_id]

  // We're creating a subnet group in the module and passing in the name
  db_subnet_group_name = aws_db_subnet_group.main_db_subnet_group.name
  parameter_group_name = var.db_parameter_group

  // We want the multi-az setting to be toggleable, but off by default
  multi_az     = var.rds_is_multi_az
  storage_type = var.rds_storage_type

  tags = var.common_tags
}

resource "aws_db_subnet_group" "main_db_subnet_group" {
  name        = "${var.rds_instance_name}-subnetgroup"
  description = "RDS subnet group"
  subnet_ids  = [var.db_subnet_ids]
}
