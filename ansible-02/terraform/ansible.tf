resource "local_file" "inventory_cfg" {
    content = templatefile("${path.module}/prod.tftpl",
    { 
        clickhouse = module.clickhouse.vm
        vector     = module.vector.vm
    }  )

    filename = "${abspath(path.module)}/../playbook/inventory/prod.yml"
}
