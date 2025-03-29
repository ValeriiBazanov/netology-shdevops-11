resource "local_file" "inventory_cfg" {
    content = templatefile("${path.module}/prod.tftpl",
    { 
        sentry = module.sentry.vm
    }  )

    filename = "${abspath(path.module)}/../playbook/inventory/prod.yml"
}