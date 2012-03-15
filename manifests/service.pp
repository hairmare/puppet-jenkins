class jenkins::service ($jenkins_port) {
  service { 'jenkins':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
  file { '/etc/sysconfig/jenkins':
	ensure	=> file,
	owner	=> root, group => root,
	mode	=> 600,
	content	=> template('jenkins/jenkins-config.erb'),
	notify	=> Service['jenkins'],
  }
}

