variable "iso_path" {
  type = string
}

variable "vm_cpu_num" {
  type = number
}

variable "vm_disk_size" {
  type = number
}

variable "vm_mem_size" {
  type = number
}

variable "vm_name" {
  type    = string
  default = "windows_server_2019_std"
}

variable "vsphere_server" {
  type = string
}

variable "vsphere_user" {
  type      = string
  sensitive = true
}

variable "vsphere_password" {
  type      = string
  sensitive = true
}

variable "vsphere_cluster" {
  type = string
}

variable "vsphere_datacenter" {
  type = string
}

variable "vsphere_datastore" {
  type = string
}

variable "vsphere_folder" {
  type    = string
  default = "templates"
}

variable "vsphere_network" {
  type = string
}

variable "winadmin_password" {
  type      = string
  sensitive = true
}
