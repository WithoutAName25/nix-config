{ ... }:

{
  home.file.".steam/steam/steam_dev.cfg".text = ''
    @ShaderBackgroundProcessingThreads 8
    unShaderBackgroundProcessingThreads 8
  '';
}
