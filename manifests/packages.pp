# = tomcat::packages
class tomcat::packages (
  $version
) {
  package { 'tomcat7':
    ensure => $version
  }
  package { 'jre':
    ensure => 'installed'
  }
}
