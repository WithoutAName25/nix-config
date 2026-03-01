{ ... }:

{
  programs.btop = {
    enable = true;

    settings = {
      cpu_single_graph = true;
      update_ms = 1000;
    };
  };
}
