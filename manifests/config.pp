class aws_cli::config {

  file { "aws_config_dir_${aws_cli::user}":
    ensure => directory,
    path   => "${aws_cli::final_home}/.aws",
    owner  => $aws_cli::user,
    group  => 'nogroup',
    mode   => '0775',
  }

  file { "aws_config_file_${aws_cli::user}":
    ensure  => present,
    path    => "${aws_cli::final_home}/.aws/config",
    owner   => $aws_cli::user,
    group   => 'nogroup',
    mode    => '0600',
    content => "[default]
region = eu-west-1
",
  }

  file { "aws_credentials_file_${aws_cli::user}":
    ensure  => present,
    path    => "${aws_cli::final_home}/.aws/credentials",
    owner   => $aws_cli::user,
    group   => 'nogroup',
    mode    => '0600',
    content => "[default]
aws_access_key_id = ${aws_cli::aws_access_key_id}
aws_secret_access_key = ${aws_cli::aws_secret_access_key}
",
  }
}
