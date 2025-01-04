resource "local_file" "inventory_cfg" {
    content = templatefile("${path.module}/prod.tftpl",
    { 
        sonar = module.sonar.vm
        nexus     = module.nexus.vm
    }  )

    filename = "${abspath(path.module)}/../infrastructure/inventory/cicd/hosts.yml"
}
