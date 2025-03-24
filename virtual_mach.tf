resource "azurerm_linux_virtual_machine" "vm" {
  count               = 2
  name                = "vm-${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B1s"
  admin_username      = "azureuser"
  
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("c:/Users/TARUN/terraform-fldr/azure_prac_e1a528a1a87c/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]

    connection {
      type        = "ssh"
      user        = "azureuser"
      private_key = file("c:/Users/TARUN/terraform-fldr/azure_prac_e1a528a1a87c/.ssh/id_rsa.pem")
      host        = azurerm_public_ip.vm_public_ip[count.index].ip_address
    }
  }
}