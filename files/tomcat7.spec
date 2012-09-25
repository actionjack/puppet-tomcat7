%global major_version 7
%global minor_version 0
%global micro_version 30
%global package_name apache-tomcat-%{version}

Name            : tomcat
Version         : %{major_version}.%{minor_version}.%{micro_version}
Release         : 1%{?dist}
Summary         : Apache Servlet/JSP Engine
Group           : System Environment/Daemons
URL		: http://tomcat.apache.org/
Source0         : http://www.apache.org/dist/tomcat/tomcat-%{major_version}/v%{version}/bin/%{package_name}.tar.gz
Vendor          : Apache
License         : ASL 2.0
Packager        : Martin Jackson <mjackson@equalexperts.com>
BuildArch       : noarch
BuildRoot       : %{_tmppath}/%{package_name}-%{version}-root
AutoReqProv     : no
Requires        : java >= 1:1.7.0
 
%description
Apache  Tomcat is  an open source software  implementation of the Java 
Servlet  and  JavaServer  Pages   technologies.  The  Java Servlet and 
JavaServer Pages specifications are developed under the Java Community 
Process.

%prep
%setup -q -n %{package_name}
#Removing example applications, documentation and managers under webroot

#Removing Information text files
 
%install
rm -rf %{buildroot}
mkdir -p %{buildroot}/usr/share/tomcat7
mkdir -p %{buildroot}/etc/init.d/
mkdir -p %{buildroot}/var/run/tomcat7
cp -R . %{buildroot}/usr/share/tomcat7

%clean
rm -rf %{buildroot}
 
%files
%defattr(-,root,root,-)
/usr/share/tomcat7
 
%pre

%preun
 
%post

%changelog

