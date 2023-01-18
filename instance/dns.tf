resource "google_dns_record_set" "instance" {
  name = "${var.name}.${var.dns_zone.dns_name}"
  type = "A"
  ttl  = 1

  managed_zone = var.dns_zone.name

  rrdatas = [
    google_compute_instance.instance.network_interface[0].network_ip
  ]
}