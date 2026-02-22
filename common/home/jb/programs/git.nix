{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "WithoutAName";
        email = "withoutaname@withoutaname.eu";
      };

      init.defaultBranch = "main";

      pull.rebase = true;

      core = {
        editor = "nvim";
      };

      alias = {
        a = "add";
        c = "commit";
        d = "diff";
        s = "status";
      };
    };
  };
}
