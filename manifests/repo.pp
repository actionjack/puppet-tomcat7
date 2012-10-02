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
  yumrepo {'jre':
    descr    => 'jre repo',
    baseurl  => "${tomcat::params::jreyumrepopath}",
    enabled  => "${tomcat::params::jreyumrepoenabled}",
    gpgcheck => '0',
    priority => '5',
  }
}
