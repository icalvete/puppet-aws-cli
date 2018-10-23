class aws_cli::config {

  aws_cli::configure{"aws_cli_configure_${aws_cli::user}":
    user                   => $aws_cli::user,
    home                   => $aws_cli::final_home,
    region                 => $aws_cli::region,
    aws_access_key_id      => $aws_cli::aws_access_key_id,
    aws_secret_access_key  => $aws_cli::aws_secret_access_key,
    output                 => $aws_cli::output,
    s3                     => $aws_cli::s3,
    s3_multipart_chunksize => $aws_cli::s3_multipart_chunksize,
    s3_multipart_threshold => $aws_cli::s3_multipart_threshold,
  }
}
