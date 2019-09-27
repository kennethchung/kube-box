// resource "aws_eip" "kubebox_worker_id1" {
//   count = "${length(aws_network_interface.kubebox_worker_id1.private_ips)-1}"
//   network_interface         = "${aws_network_interface.kubebox_worker_id1.id}"
//   associate_with_private_ip = "${aws_network_interface.kubebox_worker_id1.private_ips[count.index]}"
// }

// output "eip_id1_ids" {
//   value       = "${aws_eip.kubebox_worker_id1.*.id}"
// }
