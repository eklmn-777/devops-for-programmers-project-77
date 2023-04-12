resource "yandex_compute_instance" "vm-1" {
  name = "terraform1"

  resources {
    cores  = 4
    memory = 4
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  boot_disk {
    initialize_params {
      image_id = "fd81hgrcv6lsnkremf32"
      size     = 15
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${var.admin_ssh_key}"
  }
}

resource "yandex_compute_instance" "vm-2" {
  name = "terraform2"

  resources {
    cores  = 4
    memory = 4
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  boot_disk {
    initialize_params {
      image_id = "fd81hgrcv6lsnkremf32"
      size     = 15
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${var.admin_ssh_key}"
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}

output "internal_ip_address_vm_2" {
  value = yandex_compute_instance.vm-2.network_interface.0.ip_address
}


output "external_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_2" {
  value = yandex_compute_instance.vm-2.network_interface.0.nat_ip_address
}
