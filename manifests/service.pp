# tomcat::service
class tomcat::service {

  $tomcatvalues = $tomcat::tomcatvalues

  service { 'tomcat7':
    ensure     => 'running',
    hasrestart => true,
    hasstatus  => true,
    enable     => true,
  }
  File{
    owner   => root,
    group   => root,
    notify  => Service['tomcat7'],
  }
  file{'/etc/sysconfig/tomcat7':
    content => template('tomcat/tomcat7.erb'),
  }
  file{'/etc/tomcat7/server.xml':
    source => 'puppet:///modules/tomcat/etc/tomcat7/server.xml',
  }
}
