build {
  sources = ["source.qemu.win2k19"]

  provisioner "powershell" {
    environment_vars  = []
    script            = "scripts/setup.ps1"
  }
  provisioner "windows-restart" {
    restart_timeout = "30m"
  }
  provisioner "powershell" {
    environment_vars  = []
    script            = "scripts/win-update.ps1"
  }
  provisioner "windows-restart" {
    restart_timeout = "30m"
  }
  provisioner "powershell" {
    environment_vars  = []
    script            = "scripts/win-update.ps1"
  }
  provisioner "windows-restart" {
    restart_timeout = "30m"
  }
  provisioner "powershell" {
    environment_vars = []
    script            = "scripts/cleanup.ps1"
    pause_before     = "1m"
  }


  provisioner "file" {
    source = "scripts/sysprep.xml"
    destination = "c:\\sysprep.xml"
  }

    provisioner "powershell" {
      environment_vars = []
      script            = "scripts/sysprep.ps1"
      pause_before     = "1m"
    }  
}
