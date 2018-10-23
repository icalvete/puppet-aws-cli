define aws_cli::configure (

  $user                   = 'root',
  $home                   = '/root',
  $profile                = 'default',
  $region                 = 'eu-west-1',
  $aws_access_key_id      = undef,
  $aws_secret_access_key  = undef,
  $output                 = undef,
  $s3                     = true,
  $s3_multipart_chunksize = '8MB',
  $s3_multipart_threshold = '8MB'

) {

  if $aws_access_key_id == undef {
    fail('aws_access_key_id param is mandatoty')
  }

  if $aws_secret_access_key == undef {
    fail('aws_secret_access_key param is mandatoty')
  }

  file { "aws_config_dir_${user}":
    ensure => directory,
    path   => "${home}/.aws",
    owner  => $user,
    group  => 'nogroup',
    mode   => '0775',
  }

  file { "aws_config_file_${user}":
    ensure  => present,
    path    => "$home/.aws/config",
    owner   => $user,
    group   => 'nogroup',
    mode    => '0600',
    content => template("${module_name}/config.erb")
  }

  file { "aws_credentials_file_${user}":
    ensure  => present,
    path    => "${home}/.aws/credentials",
    owner   => $user,
    group   => 'nogroup',
    mode    => '0600',
    content => template("${module_name}/credentials.erb")
  }
}
