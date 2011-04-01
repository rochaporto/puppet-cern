# Resources for a SLC5 (Scientific Linux CERN 5) setup.
# 
# == Examples
#
# To benefit from the additional SLC5 setup this module provides, simply include its class:
#   include cern::slc5
#
# == Authors
#
# CERN IT/GT/DMS <it-dep-gt-dms@cern.ch>
#
class cern::slc5 {

  yumrepo { 
    "slc5-os":
      descr    => "Scientific Linux CERN 5 (SLC5) base system packages",
      baseurl  => "http://linuxsoft.cern.ch/cern/slc5X/\$basearch/yum/os/",
      gpgkey   => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-cern\n\tfile:///etc/pki/rpm-gpg/RPM-GPG-KEY-jpolok\n\tfile:///etc/pki/rpm-gpg/RPM-GPG-KEY-csieh\n\tfile:///etc/pki/rpm-gpg/RPM-GPG-KEY-dawson",
      gpgcheck => 1,
      enabled  => 1,
      protect  => 1;
    "slc5-cernonly":
      descr    => "Scientific Linux CERN 5 (SLC5) CERN-only packages",
      baseurl  => "http://linuxsoft.cern.ch/onlycern/slc5X/\$basearch/yum/cernonly/",
      gpgkey   => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-cern\n\tfile:///etc/pki/rpm-gpg/RPM-GPG-KEY-jpolok",
      gpgcheck => 1,
      enabled  => 0,
      protect  => 1;
    "slc5-updates":
      descr    => "Scientific Linux CERN 5 (SLC5) bugfix and security updates",
      baseurl  => "http://linuxsoft.cern.ch/cern/slc5X/\$basearch/yum/updates/",
      gpgkey   => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-cern\n\tfile:///etc/pki/rpm-gpg/RPM-GPG-KEY-jpolok\n\tfile:///etc/pki/rpm-gpg/RPM-GPG-KEY-csieh\n\tfile:///etc/pki/rpm-gpg/RPM-GPG-KEY-dawson",
      gpgcheck => 1,
      enabled  => 1,
      protect  => 1;
    "slc5-extras":
      descr    => "Scientific Linux CERN 5 (SLC5) add-on packages, no formal support",
      baseurl  => "http://linuxsoft.cern.ch/cern/slc5X/\$basearch/yum/extras/",
      gpgkey   => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-cern\n\tfile:///etc/pki/rpm-gpg/RPM-GPG-KEY-jpolok",
      gpgcheck => 1,
      enabled  => 1,
      protect  => 1;
    "sl5-security":
      descr    => "SL 5 security updates",
      baseurl  => "http://linuxsoft.cern.ch/scientific/5x/\$basearch/updates/security",
      gpgkey   => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-sl\n\tfile:///etc/pki/rpm-gpg/RPM-GPG-KEY-sl5\n\tfile:///etc/pki/rpm-gpg/RPM-GPG-KEY-csieh\n\tfile:///etc/pki/rpm-gpg/RPM-GPG-KEY-dawson\n\tfile:///etc/pki/rpm-gpg/RPM-GPG-KEY-jpolok\n\tfile:///etc/pki/rpm-gpg/RPM-GPG-KEY-cern\n\tfile:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-5",
      gpgcheck => 1,
      enabled  => 1;
    "swrep_x86_64_slc5":
      descr    => "CERN SWrep x86_64_slc5",
      baseurl  => "http://swrepsrv.cern.ch/yum/CERN_CC/x86_64_slc5/",
      gpgcheck => 0,
      enabled  => 0;
    "epel":
      descr          => "Extra Packages for Enterprise Linux 5 - $basearch",
      mirrorlist     => "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-5&arch=\$basearch",
      failovermethod => "priority",
      enabled        => 1,
      gpgcheck       => 1,
      gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL";
    "lcg-ca":
      descr    => "LCG Certificate Authorities (CAs)",
      baseurl  => "http://linuxsoft.cern.ch/LCG-CAs/current",
      gpgcheck => 0,
      enabled  => 1;
  }

}

