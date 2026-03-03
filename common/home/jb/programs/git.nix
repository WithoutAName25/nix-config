{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    includes = [
      {
        condition = "gitdir:~/Projects/Studium/";
        contents = {
          user = {
            name = "Jakob Bühler";
            email = "j_buehler22@cs.uni-kl.de";
          };
        };
      }
    ];

    settings = {
      user = {
        name = "WithoutAName";
        email = "withoutaname@withoutaname.eu";
        signingkey = "~/.ssh/rk_touch.pub";
      };

      init.defaultBranch = "main";

      pull.rebase = true;

      alias = {
        a = "add";
        c = "commit";
        d = "diff";
        s = "status";
      };

      core = {
        editor = "nvim";
      };

      commit = {
        gpgsign = true;
      };

      gpg = {
        format = "ssh";
        ssh.allowedSignersFile = toString (
          pkgs.writeText "git-allowed-signers" ''
            withoutaname@withoutaname.eu sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIGmSRnak0xY4AX0NJ+7vHmRvOPsxQvPsmVnQGB/YuJBOAAAABHNzaDo=
          ''
        );
      };
    };
  };
}
