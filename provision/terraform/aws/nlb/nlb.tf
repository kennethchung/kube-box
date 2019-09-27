resource "aws_lb_listener" "kubebox_worker_id1" {
  load_balancer_arn = "${aws_lb.kubebox_worker_id1.arn}"
  port              = "80"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.kubebox_worker_id1.arn}"
  }
}


resource "aws_lb_target_group" "kubebox_worker_id1" {
  name     = "${format("%s-%s-%s", var.run_prefix, var.run_common_id, "id1")}"
  port     = 8080
  protocol = "TCP"
  vpc_id   = "${data.terraform_remote_state.vpc.vpcid}"
}



resource "aws_lb" "kubebox_worker_id1" {
  name               = "${format("%s-%s-%s", var.run_prefix, var.run_common_id, "id1")}"
  load_balancer_type = "network"
   subnet_mapping {
     subnet_id    = "${data.terraform_remote_state.vpc.subnet_id}"
     allocation_id = "${aws_eip.kubebox_worker_id1.id}"
   }

  tags {
    Name        = "${format("%s-%s-%s", var.run_prefix, var.run_common_id, "id1")}"
  }
}

resource "aws_eip" "kubebox_worker_id1" {
  vpc                       = true
  // This is based on SIP 
  //count = "${length(data.terraform_remote_state.instances.network_interface_id1_private_ips)-1}"
  //network_interface         = "${data.terraform_remote_state.instances.network_interface_id1_id}"
  //associate_with_private_ip = "${data.terraform_remote_state.instances.network_interface_id1_private_ips[count.index]}"
}

output "aws_eip_kubebox_worker_id1" {
  value       = "${aws_eip.kubebox_worker_id1.id}"
}

output "aws_lb_kubebox_worker_id1_arn" {
  value       = "${aws_lb.kubebox_worker_id1.arn}"
}

output "aws_lb_target_group_kubebox_worker_id1_arn" {
  value       = "${aws_lb_target_group.kubebox_worker_id1.arn}"
}



