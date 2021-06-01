resource "google_compute_global_address" "reddit" {
  name = "reddit-balancer-ip"
}

resource "google_compute_global_forwarding_rule" "reddit" {
  project    = var.project
  name       = "reddit-port-80"
  ip_address = google_compute_global_address.reddit.address
  port_range = "80"
  target     = google_compute_target_http_proxy.reddit-proxy.self_link
}

resource "google_compute_target_http_proxy" "reddit-proxy" {
  name        = "reddit-proxy"
  description = "a description"
  url_map     = google_compute_url_map.reddit-map.id
}

resource "google_compute_url_map" "reddit-map" {
  name            = "reddit-map"
  default_service = google_compute_backend_service.reddit-service.self_link
}

resource "google_compute_backend_service" "reddit-service" {
  name          = "backend-service"
  health_checks = [google_compute_http_health_check.reddit-health-check.self_link]
  port_name     = "http"
  protocol      = "HTTP"
  backend {
    group = google_compute_instance_group.reddit-group.self_link
  }
}

resource "google_compute_http_health_check" "reddit-health-check" {
  name = "reddit-health-check"
  port = 9292
}

resource "google_compute_instance_group" "reddit-group" {
  name      = "reddit-group"
  zone      = var.zone
  instances = google_compute_instance.app.*.self_link
  named_port {
    name = "http"
    port = 9292
  }
}
