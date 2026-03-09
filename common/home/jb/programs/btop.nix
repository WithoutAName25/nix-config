{ pkgs, ... }:

{
  programs.btop = {
    enable = true;
    package = (
      pkgs.symlinkJoin {
        name = "btop";
        paths = [ pkgs.btop ];
        buildInputs = [ pkgs.makeWrapper ];
        postBuild = ''
          wrapProgram $out/bin/btop \
            --prefix LD_LIBRARY_PATH : /run/opengl-driver/lib
        '';
      }
    );

    settings = {
      shown_boxes = "cpu mem net proc gpu0";
      update_ms = 1000;
      cpu_single_graph = true;
      gpu_mirror_graph = false;
      proc_per_core = true;
    };
  };
}
