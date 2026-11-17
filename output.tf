output "vpc_id" {
    value = aws_vpc.main.id
}

output "public_subnets" {
    value = aws_subnet.public[*].id
}


output "default_route_table_id" {
    value = data.aws_route_table.default.id
}