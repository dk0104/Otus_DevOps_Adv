{
  pkgs,
  ...
}:
{
  # https://devenv.sh/basics/
  env.GREET = "Wellcome to DevOps Advanced setup";

  # https://devenv.sh/packages/
  packages = with pkgs; [
    git
    jq
    terraform
    yandex-cloud
  ];

  # https://devenv.sh/scripts/
  scripts.hello.exec = ''
    echo "############################################################"
    echo $GREET
    git --version # Use packages
    terraform version
    yc version
    echo "############################################################"
  '';

  # https://devenv.sh/basics/
  enterShell = ''
    hello         # Run scripts directly
  '';
}
