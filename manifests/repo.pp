# = tomcat::repo
class tomcat::repo {
  yumrepo {'jpackage':
    descr          => 'JPackage 6 generic',
    enabled        => '1',
    failovermethod => 'priority',
    gpgcheck       => '1',
    gpgkey         => 'http://www.jpackage.org/jpackage.asc',
    mirrorlist     => 'http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=6.0',
    priority       => '10',
  }
  yumrepo {'equalexperts':
    descr    => 'EE test repo',
    baseurl  => "${tomcat::params::eeyumrepopath}",
    enabled  => "${tomcat::params::eeyumrepoenabled}",
    priority => '5',
  }
}
