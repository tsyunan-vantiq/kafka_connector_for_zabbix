resource "aws_security_group" "msk" {
  name        = var.msk_security_group_name
  description = var.msk_security_group_description
  vpc_id      = var.vpc_id

  tags = {
    Name = var.msk_security_group_name
  }
}

resource "aws_security_group_rule" "msk_ingress" {
  security_group_id        = aws_security_group.msk.id
  type                     = "ingress"
  description              = "For MSK"
  from_port                = 9098
  to_port                  = 9098
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.client.id
}

resource "aws_security_group_rule" "msk_ingress_cidr" {
  count = length(var.client_cidr_blocks) == 0 ? 0 : 1

  security_group_id = aws_security_group.msk.id
  type              = "ingress"
  description       = "For MSK(CIDR)"
  from_port         = 9098
  to_port           = 9098
  protocol          = "tcp"
  cidr_blocks       = var.client_cidr_blocks
}

resource "aws_security_group_rule" "msk_egress" {
  security_group_id = aws_security_group.msk.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group" "client" {
  name        = var.client_security_group_name
  description = var.client_security_group_description
  vpc_id      = var.vpc_id

  tags = {
    Name = var.client_security_group_name
  }
}

resource "aws_security_group_rule" "client_egress" {
  security_group_id = aws_security_group.client.id
  type              = "egress"
  description       = "egress to Only MSK"
  from_port         = 9098
  to_port           = 9098
  protocol          = "tcp"
  cidr_blocks       = [var.vpc_cidr] # aws_security_group.mskとの相互依存を避けたいのでCIDRで制限
}
