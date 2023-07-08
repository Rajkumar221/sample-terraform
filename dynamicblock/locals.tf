locals {
    ingress_rules = [{
        port = 22
        description = "ingress rule for port 22"
    },
    {
        port = 443
        description = "ingress rule for port 443"
    }]
}