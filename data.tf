# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "defult" {
  default = true
}

data "aws_route_table" "defult" {
  vpc_id = data.aws_vpc.defult.id

  filter {
    name   = "association.main"
    values = ["true"]
  }
}
