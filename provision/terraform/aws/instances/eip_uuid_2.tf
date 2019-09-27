#resource "aws_eip" "kubebox_worker_id2" {
#  count = "${length(aws_network_interface.kubebox_worker_id2.private_ips)-1}"
#  network_interface         = "${aws_network_interface.kubebox_worker_id2.id}"
#  associate_with_private_ip = "${aws_network_interface.kubebox_worker_id2.private_ips[count.index]}"
#}