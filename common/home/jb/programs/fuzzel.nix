{ ... }:

{
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        fields = "filename,name,generic,categories,keywords,comment";
        terminal = "kitty";
        icons-enabled = false;
        dpi-aware = "no";
        horizontal-pad = 16;
        vertical-pad = 16;
      };

      colors = {
        background = "00000044";
        # background = "1e1e2edd";
        text = "cdd6f4ff";
        prompt = "bac2deff";
        placeholder = "7f849cff";
        input = "cdd6f4ff";
        match = "74c7ecff";
        selection = "585b70ff";
        selection-text = "cdd6f4ff";
        selection-match = "74c7ecff";
        counter = "7f849cff";
        border = "74c7ecff";
      };
      border = {
        width = 0;
        radius = 12;
      };
    };
  };
}
