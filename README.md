# Suma-Vagrant

This is a demo project showing how Vagrant, VirtualBox, and Ansible can be used to create an easy way to demo [Suma](https://github.com/cazzerson/Suma).

## Installation

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html).
2. Clone or Download this repository.
3. From a terminal application, type `vagrant up` from the Suma-Vagrant directory and hit the `Return` key. Note: If you are on OSX, you may need to enter your administrator password. This is so the timezone of the virtual machine (guest) may be configured to match that of the host.
4. Visit [http://localhost:19679](http://localhost:19679) in your web browser.

> Parallels is also a supported provider, and can be selected
by executing `vagrant up --provider=parallels` in step 3 above.

## Configuration

To modify your Suma configuration, just edit the files in the `config` directory.

## Shutdown

To suspend your virtual machine, just type `vagrant suspend` from the `Suma-Vagrant` directory. To shut the machine down, type `vagrant halt`. You can start it back up again with `vagrant up`.

## Admin Tools

The Suma admin tools can be found at [http://localhost:19679/sumaserver/admin](http://localhost:19679/sumaserver/admin). The default admin username is "sumaadmin" and admin password is "sumaadmin".

## Using Suma-Vagrant as a development environment for Suma

This project includes a bash script "guest_ansible.sh" for doing additional provisioning of the guest in order to prepare it as a Suma development environment and excucute build tasks on the guest from the host. This allows the developer to work in the Suma repository on the host environment using their own configured text editor. From a terminal application, type `./guest_ansible.sh provision-dev` and hit the `Return` key to provision the development environment. This script has additional subcommands that are listed below:

  * apache-configs - Copy apache configs
  * bower-clean    - Clean bower_components directory
  * bower-install  - Execute bower install for analysis tools
  * suma-configs   - Copy suma configs
  * grunt          - Execute grunt lint, test, and build for analysis tools
  * grunt-build    - Execute grunt build task for analysis tools
  * grunt-lint     - Execute grunt lint for analysis tools
  * grunt-test     - Execute grunt tests for analysis tools
  * grunt-watch    - Execute grunt watch for analysis tools
  * npm-clean      - Clean node_modules directory
  * npm-install    - Execute npm install for analysis tools
  * provision-dev  - Provision the development environment on the guest

## NOTICE

This project is a demo project only and is not intended for production use at this time. *Please use this only for testing or development deployments*.

## Suma-Docker

[Tested for Ubuntu-14.04 and xOS10.9.5]

 - Install [Docker](https://docs.docker.com/engine/installation/) version 1.10.3
 - Install [Docker Compose](https://docs.docker.com/compose/install/)

 1) Clone this repository
 
 2) Run the command `sh DockerStart.sh`
 
 3) Visit [http://localhost:80](http://localhost:80) on your web browser
 
####Run Docker using Vagrantfile without VM:[Tested for ubuntu 14.04 not tested on MAC]

Need vagrant version 1.6 or greater, tested for version 1.8
 
1) Change the DOCKER_OPTS in /etc/default/docker to:

 ` DOCKER_OPTS="-H <ip:port>" `

 2) Restart docker
 
 ` sudo restart docker `

 3) Make sure that docker is running on <ip:port> 
 
 ` $ netstat -ant  |grep port `
 
 4) Set DOCKER_HOST and VAGRANT_NO_PARALLEL(.bashrc)
 
 ` export DOCKER_HOST=<ip:port> `
 ` export VAGRANT_NO_PARALLEL=true `
       
 RUN
 `vagrant up`
 

