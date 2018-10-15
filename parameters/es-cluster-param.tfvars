es_cluster = "cwt-elk-cluster"
aws_region = "us-east-2"
availability_zones = []
key_name = "elasticsearch"
environment = "default"
data_instance_type = "c5.2xlarge"
master_instance_type = "c5.large"
elasticsearch_volume_size = "100" # gb
volume_encryption = true
elasticsearch_data_dir = "/opt/elasticsearch/data"
elasticsearch_logs_dir = "/var/log/elasticsearch"
data_heap_size = "8g"
master_heap_size = "2g"
client_heap_size = "1g"
masters_count = "3"
datas_count = "2"
clients_count = "1"
security_enabled = "false"
monitoring_enabled = "true"
client_user = "exampleuser"
public_facing = "true"
additional_security_groups = []
ebs_optimized = "true"
lb_port = 80