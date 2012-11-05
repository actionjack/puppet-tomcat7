# tomcat::service
class tomcat::service {

  $tomcatvalues = $tomcat::tomcatvalues

  service { 'tomcat7':
    ensure     => 'running',
    hasrestart => true,
    hasstatus  => true,
    enable     => true,
  }
  file{'/etc/sysconfig/tomcat7':
    owner   => root,
    group   => root,
    content => template('tomcat/tomcat7.erb'),
    notify  => Service['tomcat7'],
  }
}
