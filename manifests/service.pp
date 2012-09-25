# tomcat::service
class tomcat::service {
  service { 'tomcat7':
    hasrestart => 'true',
    hasstatus  => 'true',
    enable     => 'true',
    ensure     => 'running',
  }
}
