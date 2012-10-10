# tomcat::service
class tomcat::service {
  service { 'tomcat7':
    ensure     => 'running',
    hasrestart => true,
    hasstatus  => true,
    enable     => true,
  }
  exec {'enable-oracle-jre':
    unless  => 'alternatives --display java | egrep /usr/java',
    command => 'alternatives --install /usr/bin/java java /usr/java/jre1.7.0_07/bin/java 2 &&
                alternatives --set java /usr/java/jre1.7.0_07/bin/java',
    path    => '/bin:/usr/sbin',
    notify  => Service['tomcat7'],
  }
  file{'/etc/sysconfig/tomcat7':
    owner   => root,
    group   => root,
    content => template('tomcat/tomcat7.erb'),
    notify  => Service['tomcat7'],
  }
}
