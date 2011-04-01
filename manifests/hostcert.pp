# Fetches, install and updates a host certificate.
#
# == Examples
#
# All you need to do is include this class:
# 
#   include cern::hostcert
#
# == Authors
#
# CERN IT/GT/DMS <it-dep-gt-dms@cern.ch>
#
class cern::hostcert {

  package { 
    [ "perl-Compress-Zlib", "perl-HTML-Parser", "perl-HTML-Tagset", 
      "perl-TermReadKey", "perl-URI", "perl-libwww-perl" ]:
  }

  package { 
    "host-certificate-manager":
      source   => "http://swrepsrv.cern.ch/swrep/x86_64_slc5/host-certificate-manager-2.8-0.noarch.rpm",
      provider => "rpm",
      require  => Package["SINDES-tools"];
    "SINDES-tools":
      source   => "http://swrepsrv.cern.ch/swrep/x86_64_slc5/SINDES-tools-0.5-3.noarch.rpm",
      provider => "rpm",
      require  => Package[ "perl-Compress-Zlib", "perl-HTML-Parser", "perl-HTML-Tagset", 
                             "perl-TermReadKey", "perl-URI", "perl-libwww-perl" ];
  }

  file {
    "/etc/grid-security/hostcert.pem":
      mode    => "0644",
      require => [ File["/etc/grid-security"], Exec["hostcert_put"] ];
    "/etc/grid-security/hostkey.pem":
      mode    => "0400",
      require => [ File["/etc/grid-security/hostcert.pem"] ];
  }

  exec { 
    "hostcert_put":
      environment => "HCMPASS=$cern_hcm_pass",
      path        => "/usr/bin:/usr/sbin:/bin:/sbin",
      command     => "rm -f /tmp/*/`hostname -f`/*host*pem; echo \$HCMPASS | host-certificate-manager --username gdadmin --nosindes `hostname -s`; cp /tmp/*/`hostname -f`/host*.pem /etc/grid-security",
      creates     => [ "/etc/grid-security/hostcert.pem", "/etc/grid-security/hostkey.pem" ],
      require     => Package["host-certificate-manager"],
  }

}

