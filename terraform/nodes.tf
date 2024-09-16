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

# Teamcity-Server
#resource "yandex_compute_instance" "teamcity-server" {
#  count      = 1
#  name       = "teamsity-server-${count.index}"
#  zone       = "${var.subnet-zones[count.index]}"
#  hostname   = "teamsity-server-${count.index}"
#  allow_stopping_for_update = true
#    labels = {
#    index = "${count.index}"
#    }
#  platform_id = "standard-v3"
#  resources {
#    cores         = var.teamcity_resources_server.cores
#    memory        = var.teamcity_resources_server.memory
#    core_fraction = var.teamcity_resources_server.core_fraction
#  }

#  boot_disk {
#    initialize_params {
#      image_id = "${var.ubuntu-2004-lts}"
#      size     = var.teamcity_resources_server.size
#    }
#  }

#  scheduling_policy {
#    preemptible = true
#  }

#   network_interface {
#    subnet_id  = "${yandex_vpc_subnet.subnet-zones[count.index].id}"
#    nat           = true
#    ip_address    = "10.10.1.44"
#  } 

#  metadata = {
#    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
#  } 
#}

# Teamcity-Agent
#resource "yandex_compute_instance" "teamcity-agent" {
#  count      = 1
#  name       = "teamsity-agent-${count.index}"
#  zone       = "${var.subnet-zones[count.index]}"
#  hostname   = "teamsity-agent-${count.index}"
#  allow_stopping_for_update = true
#  labels = {
#    index = "${count.index}"
#  }
#  platform_id = "standard-v3"
#  resources {
#    cores         = var.teamcity_resources_agent.cores
#    memory        = var.teamcity_resources_agent.memory
#    core_fraction = var.teamcity_resources_agent.core_fraction
#  }

#  boot_disk {
#    initialize_params {
#      image_id = "${var.ubuntu-2004-lts}"
#      size     = var.teamcity_resources_agent.size
#    }
#  }

#  scheduling_policy {
#    preemptible = true
#  }

#   network_interface {
#    subnet_id  = "${yandex_vpc_subnet.subnet-zones[count.index].id}"
#    nat           = true
#    ip_address    = "10.10.1.34"
#  } 

#  metadata = {
#    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
#  } 
#}


