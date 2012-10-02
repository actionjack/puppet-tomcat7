# = tomcat::params
class tomcat::params {
  $jreyumrepopath = 'http://ip-10-227-94-135.eu-west-1.compute.internal/repo/'
  if $virtual == 'virtualbox' {
    $eeyumrepoenabled = '0'
  } else {
    $eeyumrepoenabled = '1'
  }
}
