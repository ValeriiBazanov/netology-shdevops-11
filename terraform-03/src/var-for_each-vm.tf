### variables for for_each-vm.tf

variable "db_image_family" {
    type        = string
    default     = "ubuntu-2004-lts"
    description = "DB image family name"
}

variable "db_user" {
    type        = string
    default     = "ubuntu-2004-lts"
    description = "DB image family name"
}

variable "db_params" {
    type = list(object({ 
        vm_name=string, 
        zone=string, 
        cores=number, 
        memory=number, 
        core_fraction=number, 
        platform_id=string, 
        nat=bool, 
        preemptible=bool,
        disk_type=string,
        disk_size=number
    }))

    default = [ {
        vm_name = "main",
        zone = "ru-central1-a",
        cores = 4,
        memory = 2,
        core_fraction = 20,
        platform_id = "standard-v1",
        nat = true,
        preemptible = true,
        disk_type = "network-hdd",
        disk_size = 10
    },
    {
        vm_name = "replica",
        zone = "ru-central1-a",
        cores = 2,
        memory = 1,
        core_fraction = 20,
        platform_id = "standard-v1",
        nat = true,
        preemptible = true,
        disk_type = "network-hdd",
        disk_size = 5
    } ]
    
    description = "DB VM params"
}