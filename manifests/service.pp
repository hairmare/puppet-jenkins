class jenkins::service ($jenkins_port) {
  service { 'jenkins':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
  case $::operatingsystem {
    gentoo: {
      file { '/etc/conf.d/jenkins':
	ensure	=> file,
	owner	=> root, group => root,
	mode	=> 600,
	content	=> template("${module_name}/jenkins-config.erb"),
	notify	=> Service['jenkins'],
      }
    }
    default: {
      file { '/etc/sysconfig/jenkins':
	ensure	=> file,
	owner	=> root, group => root,
	mode	=> 600,
	content	=> template("${module_name}/jenkins-config.erb"),
	notify	=> Service['jenkins'],
      }
    }
  }
}

