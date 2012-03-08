class jenkins::repo::el {
  File {
    owner => 'root',
    group => 'root',
    mode  => 0644,
  }
  file { '/etc/yum.repos.d/jenkins.repo':
    source => "puppet:///modules/${module_name}/jenkins.repo",
  }
  file { '/etc/pki/rpm-gpg/jenkins-ci.org.key':
    source => "puppet:///modules/${module_name}/jenkins-ci.org.key",
  }
  exec { 'rpm --import /etc/pki/rpm-gpg/jenkins-ci.org.key':
    path    => '/bin:/usr/bin',
    require => File['/etc/pki/rpm-gpg/jenkins-ci.org.key'],
    unless  => 'rpm -q gpg-pubkey-d50582e6-4a3feef6',
  }
}

