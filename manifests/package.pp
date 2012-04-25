class jenkins::package {
  case $::operatingsystem {
    gentoo: {
      package {
        'jenkins-bin' :
          ensure => installed;
      }
    }
    default: {
      package {
        'jenkins' :
          ensure => installed;
      }
    }
  }
}

