# Manage permissions and setup of AFS in the target machine.
# 
# == Examples
#
# To have AFS setup in the machine, simply include this class:
#   include cern::afs
#
# To add access to the machine using AFS tokens to a list of users, do:
#   cern::afs::user { ["user1", "user2"]: }
#
# == Authors
#
# CERN IT/GT/DMS <it-dep-gt-dms@cern.ch>
#
class cern::afs {

  package { ["openafs", "openafs-client", "openafs-krb5", "useraddcern"]: 
    require => Yumrepo["slc5-updates"], 
  }

  file { "afs_sysconfig":
    name  => "/etc/sysconfig/afs",
    owner => "root",
    group => "root",
    mode  => "0755",
  }

  file { "krb5_config":
    name    => "/etc/krb5.conf",
    owner   => "root",
    group   => "root",
    mode    => "0644",
    content => template("cern/krb5.conf"),
  }

  service { "afs":
    enable     => true,
    ensure     => running,
    hasrestart => true,
    subscribe  => File["afs_sysconfig", "krb5_config"],
    require    => [
      Package["openafs", "openafs-client", "openafs-krb5"], 
      File["afs_sysconfig", "krb5_config"],
    ]
  }

  define user {
    exec { "afsuser_$name":
      path    => "/usr/bin:/usr/sbin:/bin:/sbin",
      command => "useraddcern $name",
      unless  => "grep $name /etc/passwd",
      require => Package["useraddcern"],
    }
  }
}


