resource "yandex_compute_instance" "vm" {  
  count   = 3
  name                      = "node-${count.index}"
  zone                      = "${var.subnet-zones[count.index]}"
  hostname                  = "node-${count.index}"
  allow_stopping_for_update = true
  platform_id = "standard-v3"
  labels = {
    index = "${count.index}"

  } 
 
  scheduling_policy {
  preemptible = true  // Прерываемая ВМ
  }

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu-2004-lts}"
      type        = "network-hdd"
      size        = "20"
    }
  }

  network_interface {
    
    subnet_id  = "${yandex_vpc_subnet.subnet-zones[count.index].id}"
    nat        = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}


