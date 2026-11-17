resource "aws_vpc_peering_connection" "main" {
    count = var.is_peering_required ? 1 : 0

    peer_vpc_id   = data.aws_vpc.defult.id
    vpc_id        = aws_vpc.main.id
    auto_accept   = true

    tags = merge(
        var.vpc_tags,
        local.common_tags,
        {
            Name = "${local.common_name_suffix}-peering"
        }
    )
    
    accepter {
        allow_remote_vpc_dns_resolution = true
    }

    requester {
        allow_remote_vpc_dns_resolution = true
    }
}

resource "aws_route" "public_peering" {
    count = var.is_peering_required ? 1 : 0
    route_table_id            = aws_route_table.public.id
    destination_cidr_block    = data.aws_vpc.defult.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.main[count.index].id
}

resource "aws_route" "default" {
    count = var.is_peering_required ? 1 : 0
    route_table_id            = data.aws_route_table.default.id
    destination_cidr_block    = aws_vpc.main.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.main[count.index].id
}
