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
# site.pp:
#    import "tomcat" (optional since it's in autoload format)
#
# nodes.pp:
#    class tomcatserver{
#        include tomcat
#    }
#
class tomcat {
  require tomcat::params
  include tomcat::packages
  include tomcat::service

  Class['tomcat::packages'] -> Class['tomcat::service']
}
