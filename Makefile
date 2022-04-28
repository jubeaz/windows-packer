VARFILE = 2k19-qemu.pkrvars.hcl

init:
	packer init .
	wget https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.217-1/virtio-win-0.1.217.iso -P drivers/ 

validate:
	packer validate -var-file $(VARFILE) .

build:
	packer build -on-error=ask -timestamp-ui -var-file $(VARFILE) .

