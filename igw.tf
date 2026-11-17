
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id

    tags = merge(
        var.public_route_table_tags,
        local.common_tags,
        {
            Name = "${local.common_name_suffix}-public"
        }
    )
}
