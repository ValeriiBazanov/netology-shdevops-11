resource "local_file" "inventory_cfg" {
    content = templatefile("${path.module}/host.tftpl",
    { 
        master = module.master.vm
        worker = module.worker.vm
    }  )

    filename = "${abspath(path.module)}/host.yml"
}