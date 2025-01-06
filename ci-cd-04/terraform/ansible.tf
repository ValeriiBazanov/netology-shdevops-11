resource "local_file" "inventory_cfg" {
    content = templatefile("${path.module}/prod.tftpl",
    { 
        jenkins-master = module.jenkins-master.vm
        jenkins-agent     = module.jenkins-agent.vm
    }  )

    filename = "${abspath(path.module)}/../infrastructure/inventory/cicd/hosts.yml"
}
