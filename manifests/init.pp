# = Class: tomcat
#
# This class installs and configures the tomcat service.
#
# == Parameters:
#
# [*tomcatvalues*]
#   Array of Tomcat values e.g. JAVA_HONE or CATALINA_BASE.
#
# [*version*]
#   Version of Tomcat7 to install. The default is latest.
#
# == Actions:
#   Installs and configures the tomcat service.
#
# == Requires:
#   - Package["tomcat"] in your local repo
#   - Package["java>=1.7.0"] in your local repo
#
# == Sample Usage:
#
# nodes.pp:
#    class {'tomcat':
#        tomcatvalues => "array of tomcat values"
#    }
#
# == Todo:
#
#
#
class tomcat (
  $install_jre = true,
  $tomcat_manager_username = undef,
  $tomcat_manager_password = undef,
  $tomcatvalues = undef,
  $version = 'latest'
) {

  validate_re($version, 'present|installed|latest|^[._0-9a-zA-Z:-]+$')

  package { 'tomcat7': ensure => $version }
  if $install_jre == true {
    package { 'jre': ensure => 'installed' }
  }

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
  file{ '/etc/sysconfig/tomcat7':
    content => template('tomcat/tomcat7.erb'),
  }
  file{ '/etc/tomcat7/tomcat-users.xml':
      content =>  template('tomcat/tomcat-users.xml.erb'),
  }
  file{ '/etc/tomcat7/server.xml':
    source => 'puppet:///modules/tomcat/etc/tomcat7/server.xml',
  }
}
