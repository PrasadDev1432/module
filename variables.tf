variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
}

variable "vpc_tags" {
    type = map(string)
    default = {}
}

variable "project_name" {
    type = string
}

variable "environment" {
    type = string
}

variable "public_subnet_cidrs" {
    type = list(string)
}

variable "public_subnet_tags" {
    type = map(string)
  
}

variable "public_route_table_tags" {
    type = map(string)  
}

variable "is_peering_required" {
    type = bool
}