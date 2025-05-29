output "instance_public_ip" {
  description = "Public IP address of the created virtual machine"
  value       = yandex_compute_instance.vm-ubuntu.network_interface.0.nat_ip_address
}
output "name" {
  description = "Name of the created virtual machine"
  value       = yandex_compute_instance.vm-ubuntu.name
}
