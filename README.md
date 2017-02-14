# kubernetes-cumulus-l3-clos

Kuberneters + Cumulus L3 to the Host (Router on a Host) integration.

## Topology

![L3 Topology ](https://lh3.googleusercontent.com/-6NUEFJABlyY/WJmcyyzBXhI/AAAAAAAANj4/hyCGCCWlb5w4_DG5MXjgH5SCgIUrVdZlgCLcB/s0/cumulus-kubernetes.png "cumulus-kubernetes.png")

## Installation

### Hardware Prequisites
* Laptop or Server needs to be at have at a minimum:

3 CPU Cores running at 1.6Ghz+
8 GB Ram Free
150 GB Hard disk free.

* Ansible 2.0+

* Internet connection to download Vagrant boxes (images) and Kubernete admin containers.

### Virtualbox

* Install [Vagrant 1.8.7](https://vagrantup.com). Vagrant 1.9+ has a bug with Xenial 16.04 and Virtualbox.
* Change to the `./vagrant` directory.
* Install any missing vagrant plugins
```
vagrant plugin install vagrant-cumulus
```
* Symlink Vagrantfile.vbox to Vagrantfile
```
ln -s Vagrantbox.vbox Vagrantfile
```
* Run ``./install.sh`` to  install the VMs. The VM will automatically download the correct box image from [atlas.hashicorp.com](atlas.hashicorp.com)
* Vagrant provisioning will install this repo and [Kargo](https://github.com/kubernetes-incubator/kargo) and deploy Kubernetes the servers.

### Libvirt

* Install [Vagrant](https://vagrantup.com) and [vagrant-libvirt version](https://github.com/vagrant-libvirt/") v0.0.37. Install vagrant 1.8.7. Vagrant 1.9+ has bugs.
* change to the `./vagrant directory`
* Make sure no other KVM instances created by Vagrant. There could be a UDP port conflict that causes the VMs to fail.
* Install any missing vagrant plugins

```
vagrant plugin install vagrant-libvirt
vagrant plugin install vagrant-cumulus
```
* Symlink Vagrantfile.vbox to Vagrantfile
```
ln -s Vagrantbox.vbox Vagrantfile
```
* Run ``./install.sh`` to  install the VMs. The VM will automatically download the correct box image from [atlas.hashicorp.com](atlas.hashicorp.com)
* Vagrant provisioning will install this repo and [Kargo](https://github.com/kubernetes-incubator/kargo) and deploy Kubernetes the servers.


### Reinstalling Kubernetes

In case you mess up the Kubernetes setup, do the following to restore a pristine setup

```
cd ./vagrant
vagrant destroy k8s1 k8s2 k8s3
./provision.sh
```
