# = tomcat::packages
class tomcat::packages {
    $packagelist = ['tomcat7','jdk']
    package { $packagelist: ensure => latest }
}
