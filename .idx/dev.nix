{ pkgs, ... }: {
  channel = "stable-24.05";
  # https://search.nixos.org/packages
  packages = [
    pkgs.python3
  ];
  env = { };
  idx = {
    # https://open-vsx.org/
    extensions = [
      "streetsidesoftware.code-spell-checker"
      "ms-python.python"
      "yy0931.vscode-sqlite3-editor"
    ];
    previews = {
      enable = false;
      previews = { };
    };
    workspace = {
      onCreate = {
        default.openFiles = [
          "README.md"
        ];
      };
      onStart = { };
    };
  };
}
