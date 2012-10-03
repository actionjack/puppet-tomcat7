# config.pp
#
class tomcat::config {
  $javaopts = $tomcat::params::javaopts
  $appenv   = $tomcat::params::appenv

  file{'/etc/sysconfig/tomcat7':
    owner   => root,
    group   => root,
    content => template('tomcat/tomcat7.erb'),
  }
}
