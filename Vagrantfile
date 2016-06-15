Vagrant.configure("2") do |config|
  config.vm.box = "centos7.1"
  config.vm.hostname = "jenkins.box"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.network "public_network"
  config.vm.network "forwarded_port", guest: 8080, host: 8081
  config.vm.synced_folder ".", "/jenkins", owner: 'vagrant', group: 'vagrant', mount_options: ['dmode=775,fmode=775']

  config.vm.provider "virtualbox" do |v|
    v.name = "jenkins.box"
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/projeto", "1"]
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate//projeto", "1"]
    v.memory = 3072
    v.cpus = 2
  end
end
