# = tomcat::params
class tomcat::params {
  $eeyumrepopath = 'http://ip-10-242-61-184.ec2.internal/repo/equalexperts'
  if $virtual == 'virtualbox' {
    $eeyumrepoenabled = '0'
  } else {
    $eeyumrepoenabled = '1'
  }
}
