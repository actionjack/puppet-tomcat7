# tomcat::service
class tomcat::service {
  service { 'tomcat7':
    ensure     => 'running',
    hasrestart => true,
    hasstatus  => true,
    enable     => true,
  }
}
