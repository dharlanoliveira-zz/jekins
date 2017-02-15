Vagrant.configure("2") do |config|

  config.vm.define "master" do |master|
    master.vm.box = "master.jenkins"
    master.vm.box = "centos7.1"
    master.vm.hostname = "master.jenkins"
    master.vm.provision :shell, path: "bootstrap.sh"
    config.vm.network "public_network", ip: "192.168.50.10"
    master.vm.network "forwarded_port", guest: 8080, host: 8080
    master.vm.network "forwarded_port", guest: 8090, host: 8090
    master.vm.synced_folder "./master/", "/jenkins", owner: 'vagrant', group: 'vagrant', mount_options: ['dmode=775,fmode=775']
    config.vm.provider "virtualbox" do |v|
      v.memory = 3072
      v.cpus = 2
    end
  end

  config.vm.define "slave" do |slave|
    slave.vm.box = "slave.jenkins"
    slave.vm.box = "centos7.1"
    slave.vm.hostname = "slave.jenkins"
    slave.vm.provision :shell, path: "bootstrap.sh"
    config.vm.network "public_network", ip: "192.168.50.20"
    slave.vm.network "forwarded_port", guest: 50000, host: 50000
    slave.vm.synced_folder "./slave", "/jenkins", owner: 'vagrant', group: 'vagrant', mount_options: ['dmode=775,fmode=775']
    config.vm.provider "virtualbox" do |v|
      v.memory = 3072
      v.cpus = 2
    end
  end


end
