# = Class: tomcat7
#
# This class installs and configures the tomcat7 service.
#
# == Parameters:
#
# Check params.pp to configure
#
# == Actions:
#   Installs and configures the tomcat7 service.
#
# == Requires:
#   - Package["tomcat7"] in your local repo
#   - Package["java>=1.7.0"] in your local repo
#
# == Sample Usage:
#
# site.pp:
#    import "tomcat7" (optional since it's in autoload format)
#
# nodes.pp:
#    class tomcat7server{
#        include tomcat7
#    }
#
class tomcat7 {}
