# Fetches and install kerberos credentials.
#
# == Examples
#
# Invoke the definition providing the kerberos service type:
#
#   cern::keytab { "cern-keytab-nfs": serviceType => "nfs" }
#
# == Authors
#
# CERN IT/GT/DMS <it-dep-gt-dms@cern.ch>
#
define cern::keytab($serviceType="host") {

  package { "cern-config-keytab": ensure => present, }

  exec {
    "cern-config-keytab-$serviceType":
      path    => "/usr/bin:/usr/sbin:/bin:/sbin:/usr/kerberos/bin",
      command => "cern-config-keytab -t $serviceType",
      unless  => "klist -kt | grep nfs",
      require => Package["cern-config-keytab"],
  }
}
