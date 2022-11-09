packer {
  required_plugins {
    windows-update = {
      version = "0.14.1"
      source = "github.com/rgl/windows-update"
    }
  }
}

source "vsphere-iso" "server-2022" {
  CPUs                 = "${var.vm_cpu_num}"
  RAM                  = "${var.vm_mem_size}"
  CPU_hot_plug         = true
  RAM_hot_plug         = true
  cluster              = "${var.vsphere_cluster}"
  communicator         = "winrm"
  convert_to_template  = "false"
  datacenter           = "${var.vsphere_datacenter}"
  datastore            = "${var.vsphere_datastore}"
  disk_controller_type = ["pvscsi"]
  firmware             = "bios"
  folder               = "${var.vsphere_folder}"
  guest_os_type        = "windows2019srv_64Guest"
  insecure_connection  = "true"
  iso_paths            = ["${var.iso_path}", "[] /vmimages/tools-isoimages/windows.iso"]
  cd_files = [
    "../scripts/"
  ]
  cd_content = {
    "autounattend.xml" = templatefile("${abspath(path.root)}/autounattend.pkrtpl.hcl", {
      winadmin_password    = var.winadmin_password
    })
  }
  network_adapters {
    network      = "${var.vsphere_network}"
    network_card = "vmxnet3"
  }
  password = "${var.vsphere_password}"
  storage {
    disk_size             = "${var.vm_disk_size}"
    disk_thin_provisioned = true
  }
  username       = "${var.vsphere_user}"
  vcenter_server = "${var.vsphere_server}"
  vm_name        = "${var.vm_name}"
  winrm_password = "${var.winadmin_password}"
  winrm_username = "Administrator"
}

build {
  sources = ["source.vsphere-iso.server-2022"]

  provisioner "windows-shell" {
    inline = ["ipconfig"]
  }

  provisioner "windows-update" {
    filters         = ["exclude:$_.Title -like '*Preview*'", "include:$true"]
    search_criteria = "IsInstalled=0"
    update_limit    = 25
  }

}
