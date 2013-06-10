require 'spec_helper'

describe 'tomcat', :type => :class do
  context 'Install and configure Tomcat' do
    let :facts do
      {
          :osfamily => 'RedHat'
      }
    end
    let :params do {
        :tomcatvalues => ['JAVA_HOME="/usr/java/default"',
                          'CATALINA_OPTS="-Xms4096m -Xmx4096m -XX:PermSize=512m -XX:MaxPermSize=512m"']
    }
    end
    it { should contain_package('tomcat7').with_ensure('latest')}
    it { should contain_package('jre').with_ensure('latest')}
    it { should contain_service('tomcat7').with(
        :ensure => 'running',
        :enable => true
                )}
    it { should contain_file('/etc/sysconfig/tomcat7').with_content(/JAVA_HOME=".usr.java.default"/)}
    it { should contain_file('/etc/sysconfig/tomcat7').with_content(/CATALINA_OPTS="-Xms4096m -Xmx4096m -XX:PermSize=512m -XX:MaxPermSize=512m"/)}
    it { should contain_file('/etc/tomcat7/server.xml')}
  end
end