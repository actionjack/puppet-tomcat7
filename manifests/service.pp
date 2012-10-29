# tomcat::service
class tomcat::service {

  $appenvvar    = hiera('appenvvar')
  $appenvvarval = hiera('appenvvarval')
  $appjavaopts  = hiera('appjavaopts')

  service { 'tomcat7':
    ensure     => 'running',
    hasrestart => true,
    hasstatus  => true,
    enable     => true,
  }
  exec {'enable-oracle-jre':
    unless  => 'alternatives --display java | egrep /usr/java',
    command => 'alternatives --install /usr/bin/java java /usr/java/default/bin/java 2 &&
                alternatives --set java /usr/java/default/bin/java',
    path    => '/bin:/usr/sbin',
    notify  => Service['tomcat7'],
  }
  exec {'enable-oracle-jps':
    unless  => 'alternatives --display jps | egrep /usr/jps',
    command => 'alternatives --install /usr/bin/jps jps /usr/java/default/bin/jps 2 &&
                alternatives --set jps /usr/java/default/bin/jps',
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
