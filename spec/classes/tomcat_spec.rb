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
    it { should contain_package('tomcat7').with_ensure('latest') }
    it { should contain_package('jre').with_ensure('installed') }
    it { should contain_service('tomcat7').with(
        :ensure => 'running',
        :enable => true
                )}
    it { should contain_file('/etc/sysconfig/tomcat7').with_content(/JAVA_HOME=".usr.java.default"/) }
    it { should contain_file('/etc/sysconfig/tomcat7').with_content(/CATALINA_OPTS="-Xms4096m -Xmx4096m -XX:PermSize=512m -XX:MaxPermSize=512m"/) }
    it { should_not contain_file('/etc/tomcat7/server.xml').with_content(/tomcat-user\s>/) }
  end

  context 'Install Tomcat version 7.0.37-1.24.amzn1' do
    let :facts do
      {
          :osfamily => 'RedHat'
      }
    end
    let :params do
      {
          :version => '7.0.37-1.24.amzn1',
          :tomcat_manager_username => 'tom',
          :tomcat_manager_password => 'jerry',
      }
    end
    it { should contain_package('tomcat7').with_ensure('7.0.37-1.24.amzn1') }
    it { should contain_file('/etc/tomcat7/tomcat-users.xml').with_content(/<user\susername="tom"\spassword="jerry"\sroles="manager-script,manager-gui"\/>/)}
  end

end