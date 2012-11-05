# = Class: tomcat
#
# This class installs and configures the tomcat service.
#
# == Parameters:
#
# Check params.pp to configure
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
  $tomcatvalues = undef
) inherits tomcat::params {
  include tomcat::packages
  include tomcat::service

  Class['tomcat::packages'] -> Class['tomcat::service']
}
