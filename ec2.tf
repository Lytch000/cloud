variable "instancias" {
  description   = "Nombre de las instancias"
  type          = set(string)
  default       = [ "apache"] 
}

resource "aws_instance" "public_instance" {
  # count                   = length(var.instancias)
  for_each                = var.instancias 
  instance_type           = var.ec2_specs.instance_type
  ami                     = var.ec2_specs.ami
  subnet_id               = aws_subnet.public_subnet.id
  key_name                = data.aws_key_pair.key.key_name
  vpc_security_group_ids  = [ aws_security_group.sg_public_instance.id ]
  user_data               = file("scripts/userdata.sh")

  tags = {
    "Name" = "${each.value}-${local.sufix}"
  }
}

resource "aws_instance" "monitor_instance" {
  count                   = var.enable_monitoring == 1 ? 1: 0  
  instance_type           = var.ec2_specs.instance_type
  ami                     = var.ec2_specs.ami
  subnet_id               = aws_subnet.public_subnet.id
  key_name                = data.aws_key_pair.key.key_name
  vpc_security_group_ids  = [ aws_security_group.sg_public_instance.id ]
  user_data               = file("scripts/userdata.sh")

  tags = {
    "Name" = "Monitoreo-${local.sufix}"
  }
}