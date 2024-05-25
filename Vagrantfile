Vagrant.configure("2") do |config|
  # Define the master server
  config.vm.define "master" do |master|
    master.vm.box = "ubuntu/bionic64"  # Ubuntu 18.04
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: "192.168.56.10"

    master.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 2
    end

    master.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y software-properties-common
      apt-add-repository --yes --update ppa:ansible/ansible
      apt-get install -y ansible
    SHELL

    master.vm.provision "shell", inline: <<-SHELL
      echo "vagrant:vagrant" | chpasswd
      sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
      sed -i 's/^PasswordAuthentication no/#PasswordAuthentication no/' /etc/ssh/sshd_config
      service ssh restart
    SHELL
  end

  # Define node1 (CentOS)
  config.vm.define "node1" do |node|
    node.vm.box = "centos/7"
    node.vm.hostname = "node1"
    node.vm.network "private_network", ip: "192.168.56.11"

    node.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
      vb.cpus = 1
    end

    node.vm.provision "shell", inline: <<-SHELL
      echo "vagrant:vagrant" | chpasswd
      sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
      sed -i 's/^PasswordAuthentication no/#PasswordAuthentication no/' /etc/ssh/sshd_config
      systemctl restart sshd
    SHELL
  end

  # Define node2 (Ubuntu)
  config.vm.define "node2" do |node|
    node.vm.box = "ubuntu/bionic64"
    node.vm.hostname = "node2"
    node.vm.network "private_network", ip: "192.168.56.12"

    node.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
      vb.cpus = 1
    end

    node.vm.provision "shell", inline: <<-SHELL
      echo "vagrant:vagrant" | chpasswd
      sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
      sed -i 's/^PasswordAuthentication no/#PasswordAuthentication no/' /etc/ssh/sshd_config
      service ssh restart
    SHELL
  end

  # Define node3 (CentOS)
  config.vm.define "node3" do |node|
    node.vm.box = "centos/7"
    node.vm.hostname = "node3"
    node.vm.network "private_network", ip: "192.168.56.13"

    node.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
      vb.cpus = 1
    end

    node.vm.provision "shell", inline: <<-SHELL
      echo "vagrant:vagrant" | chpasswd
      sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
      sed -i 's/^PasswordAuthentication no/#PasswordAuthentication no/' /etc/ssh/sshd_config
      systemctl restart sshd
    SHELL
  end
end
