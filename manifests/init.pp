# = Class: jenkins
#
# This class installs/configures/manages Jenkins continuous build system.
#
# == Parameters:
#
# $jenkins_port:: The internet port Jenkins should run on. Default = '8080'
#
# == Requires:
#
# Java JRE
#
# == Sample Usage:
#
# class {'jenkins':
#    jenkins_port => '8082',
# } 
#
class jenkins ($jenkins_port = '8080') {
  package {
    'jre':
        ensure => '1.7.0',
        noop   => true
  }
  include jenkins::repo
  include jenkins::package
  class {'jenkins::service':
    jenkins_port => $jenkins_port,
  }
  #class jenkins::firewall {
  #  jenkins_port = $jenkins_port,
  #}

  Class['jenkins::repo'] -> Class['jenkins::package']
  -> Class['jenkins::service']
}
# vim: ts=2 et sw=2 autoindent
