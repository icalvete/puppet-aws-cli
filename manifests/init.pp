class aws_cli (

  $user                  = $aws_cli::params::user,
  $home                  = undef,
  $region                = $aws_cli::params::region,
  $aws_access_key_id     = undef,
  $aws_secret_access_key = undef

) inherits aws_cli::params {

  if $aws_access_key_id == undef {
    fail('aws_access_key_id param is mandatoty')
  }

  if $aws_secret_access_key == undef {
    fail('aws_secret_access_key param is mandatoty')
  }

  if $home == undef {
    if $user == 'root' {
      $final_home = '/root'
    } else {
      $final_home = "/home/${user}"
    }
  } else {
    $final_home = $home
  }

  anchor {'aws_cli::begin':
    before => Class['aws_cli::install']
  }
  class {'aws_cli::install':
    require => Anchor['aws_cli::begin']
  }
  class {'aws_cli::config':
    require => Class['aws_cli::install']
  }
  anchor {'aws_cli::end':
    require => Class['aws_cli::config']
  }
}
