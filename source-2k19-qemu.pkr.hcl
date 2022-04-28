# source blocks are generated from your builders; a source can be referenced in
# build blocks. A build block runs provisioner and post-processors on a
# source. Read the documentation for source blocks here:
# https://www.packer.io/docs/templates/hcl_templates/blocks/source
#
#
# https://github.com/xkisu/packer-windows
source "qemu" "win2k19" {
  accelerator      = "kvm"
  boot_wait        = "5s"
  cpus             = "${var.cpu}"
  disk_interface   = "virtio"
  disk_size        = "${var.disk_size}"
  format           = "qcow2"
  headless         = "${var.headless}"
  iso_checksum     = "${local.iso_checksum}"
  iso_url          = "${local.iso_url}"
  machine_type     = "q35"
  memory           = "${var.ram}"
  net_device       = "virtio-net"
  qemu_binary      = "qemu-system-x86_64"
  shutdown_command = "${var.shutdown_command}"
  shutdown_timeout = "${var.shutdown_timeout}"
  communicator     = "winrm"
  winrm_password   = "${var.winrm_password}"
  winrm_username   = "${var.winrm_username}"
  winrm_timeout    = "${var.winrm_timeout}"
  winrm_use_ssl    = "${var.winrm_use_ssl}"
  winrm_insecure   = "${var.winrm_insecure}"
  skip_compaction  = false
  vm_name          = "${local.vm_name}.qcow2"
  floppy_files     = [
			"scripts/autounattend.xml",
      "scripts/winrm.ps1"
	             ]
               #output_directory = "${var.qemu_out_dir}/${local.vm_name}"
  # Add additional custom args to the qemu command.
  qemuargs = [
    # Mount the virtio driver ISO as an additional CDROM drive.
    #
    # The Autounattend script is setup to automatically install
    # the appropriate drivers from the ISO.
    #
    # See: https://wiki.archlinux.org/title/QEMU#Preparing_a_Windows_guest
    [ "-drive", "file=${path.root}/drivers/virtio-win-0.1.217.iso,media=cdrom,index=3" ],

    # Adding the custom virtio drive will cause Packer to not populate
    # it's disk default args, so we manually add them back along with
    # specifying the drive indexes to known values.
    #
    # See: https://github.com/hashicorp/packer/issues/3348#issuecomment-605661528
    [ "-drive", "file=output-win2k19/${local.vm_name}.qcow2,if=virtio,cache=writeback,discard=ignore,format=qcow2,index=1" ],
    [ "-drive", "file=${local.iso_url},media=cdrom" ] # Installer ISO
  ]
}

