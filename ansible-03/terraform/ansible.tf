resource "local_file" "inventory_cfg" {
    content = templatefile("${path.module}/prod.tftpl",
    { 
        clickhouse = module.clickhouse.vm
        vector     = module.vector.vm
        lighthouse = module.lighthouse.vm
    }  )

    filename = "${abspath(path.module)}/../playbook/inventory/prod.yml"
}
