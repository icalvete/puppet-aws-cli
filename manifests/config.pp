class aws_cli::config {

  aws_cli::configure{"aws_cli_configure_${aws_cli::user}":
    user                  => $aws_cli::user,
    home                  => $aws_cli::final_home,
    aws_access_key_id     => $aws_cli::aws_access_key_id,
    aws_secret_access_key => $aws_cli::aws_secret_access_key
  }
}
