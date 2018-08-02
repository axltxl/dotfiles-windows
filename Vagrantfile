# -*- mode: ruby -*-
# # vi: set ft=ruby :

# Windows 10 vagrant box as development environment
# Note: Install VirtualBox Guest Additions manually and vagrant reload afterwards

Vagrant.configure("2") do |config|
  config.vm.box          = "sbrumley/windows10"
  config.vm.box_version  = "10.0"
  config.vm.guest        = :windows
  config.vm.communicator = :winrm
  config.vm.provider :virtualbox do |vb|
    vb.gui    = true
    vb.memory = 2048
    vb.cpus   = 2

    # An additional optical drive is needed on the IDE controller in order
    # to insert the VirtualBox Guest Additions ISO image
    vb.customize [
      "storageattach",
      :id,
      "--storagectl", "IDE Controller",
      "--port", "0",
      "--device", "1",
      "--type", "dvddrive",
      "--medium", "emptydrive"
    ]
  end

  # dotfiles available at C:\Users\vagrant\dotfiles
  config.vm.synced_folder ".", "/Users/vagrant/dotfiles"
end
