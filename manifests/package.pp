class jenkins::package($version = 'installed') {
  case $::operatingsystem {
    gentoo: {
      package {
        'jenkins-bin' :
          ensure => $version;
      }
    }
    default: {
      package {
        'jenkins' :
          ensure => $version;
      }
    }
  }
}

