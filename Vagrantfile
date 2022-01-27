# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "centos/7"

  config.vm.box_check_update = false

  config.vm.boot_timeout = 600

  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false

    vb.cpus = "1"
    vb.memory = "1536"

    vb.customize ["modifyvm", :id, "--audio", "none"]
  end

  config.vm.define "jenkins-master", autostart: true do |inst|

    inst.vm.hostname = "jenkins-master"

    inst.vm.network :forwarded_port, guest: 8080, host: 8181
    inst.vm.network :forwarded_port, guest: 51515, host: 51515

    inst.vm.provision "ansible_local" do |ansible|
      ansible.compatibility_mode = "2.0"
      ansible.playbook = "provisioning/setup_vagrant.yaml"
    end

    inst.vm.provision "ansible_local" do |ansible|
      ansible.compatibility_mode = "2.0"

      ansible.galaxy_role_file = "provisioning/jenkins-master_collections.yaml"
      ansible.galaxy_roles_path = "/home/vagrant/.ansible/collections"
      ansible.galaxy_command = "ansible-galaxy collection install --force --requirements-file=%{role_file} --collections-path=%{roles_path}"

      ansible.playbook = "provisioning/placebo_vagrant.yaml"
    end

    inst.vm.provision "ansible_local" do |ansible|
      ansible.compatibility_mode = "2.0"

      ansible.galaxy_role_file = "provisioning/jenkins-master_requirements.yaml"
      ansible.galaxy_roles_path = "/home/vagrant/.ansible/roles"
      ansible.galaxy_command = "ansible-galaxy install --force --role-file=%{role_file} --roles-path=%{roles_path}"

      ansible.playbook = "provisioning/jenkins-master_vagrant.yaml"
    end

  end

end
