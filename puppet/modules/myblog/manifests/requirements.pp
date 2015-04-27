class myblog::requirements {
  $packages = ["python-dev","python-pip"]

  package { $packages:
    ensure => installed
  }

  $pip_packages = ["Mezzanine"]

  package { $pip_packages:
    ensure => installed,
    provider => pip,
    require Package[$packages]
  }

  user { "mezzanine": {
      ensure => present
    }
  file { "myblog::app_path": 
    ensure => "Directory",
    owner => "mezzanine",
    group => "mezzanine",
    require => User["mezzanine"]

  }
}


