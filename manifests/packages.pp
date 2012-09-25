# = tomcat::packages
class tomcat::packages {
    $packagelist = ['tomcat7','java>=1.7.0']
    package { $packagelist: ensure => installed }
}
