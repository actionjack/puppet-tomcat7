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
class tomcat (
  $tomcatvalues = undef,
  $version = 'latest'
) {

  validate_re($version, [ '^latest$', '^installed$', '^[0-9\-\.]+$' ])

  class { 'tomcat::packages':
      version => $version
  } ->
  class { 'tomcat::service':
      tomcatvalues => $tomcatvalues
  }
}
