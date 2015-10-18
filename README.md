vm-ftp
===========


Prerequisites and download
==========================

Git is used to download the project. VirtualBox and Vagrant are used to run it.
On Debian-based systems, something like the following should install everything
necessary:

```
$ sudo apt-get install git virtualbox vagrant
```

To download the project, run the following:

```
git clone https://github.com/briansteffens/vm-ftp
cd vm-ftp
```


Configuration
=============

Before the VM can be built, some configuration must be done. The following files
must be created:

* __local/config.sh__ - Controls how the VM is built.

An example `config.sh` file is included. Copy and edit it with the
following:

```
$ cp local/config.sh.example local/config.sh
$ nano local/config.sh
```

Your VPN service should have provided you with a private key. Copy that key to
`local/openvpn.key`.


Building the VM
===============

Now that everything is configured, we can try to build the VM. Make sure you're
in the root of the git repository (probably the folder
`vm-ftp/`) and run:

```
$ vagrant up
```

