name                = "project"
environment         = "env1"
availability_zones  = ["eu-central-1a", "eu-central-1b"]
private_subnets     = ["10.0.0.0/20", "10.0.32.0/20"]
public_subnets      = ["10.0.16.0/20", "10.0.48.0/20"]
tsl_certificate_arn = "arn:aws:acm:eu-central-1:078856776521:certificate/9433da60-5e8f-4840-ba67-053b919909a1"
container_memory    = 512