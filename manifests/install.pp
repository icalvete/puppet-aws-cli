class aws_cli::install {

  package { 'python-pip':
    ensure =>  present
  }

  package { 'awscli':
    ensure   => present,
    provider => 'pip',
    require  => Package['python-pip']
  }
}
