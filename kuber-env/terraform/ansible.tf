resource "local_file" "inventory_cfg" {
    content = templatefile("${path.module}/prod.tftpl",
    { 
        kuber = module.kuber.vm
    }  )

    filename = "${abspath(path.module)}/../playbook/inventory/prod.yml"
}