# = tomcat::packages
class tomcat::packages {
    $packagelist = ['tomcat7','jre']
    package { $packagelist: ensure => latest }
}
