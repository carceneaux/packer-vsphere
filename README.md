# Packer builds for vSphere

This repository contains builds to be used when generating various vSphere templates. These builds are meant for use in a lab environment so I recommend reviewing each build configuration before using them in a production environment.

## Requirements

* [Packer](https://www.packer.io/downloads) to run the build process
* [VMware vCenter](https://www.vmware.com/products/vcenter-server.html) and [VMware ESXI](https://www.vmware.com/products/esxi-and-esx.html) as each build generates a VMware template

## Usage

* Navigate to the operating system folder for the template you're looking to build
* Rename the template file removing `.template` from the end of the filename
* Edit the file that was just renamed and set the variables according to your environment
* Run `packer init .` to ensure required Packer plugins are present
* Run `packer build .` to generate the VMware template as defined in the build configuration
