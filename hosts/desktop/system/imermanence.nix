{ ... }:

{
  environment.persistence = {
    "/persistent/cache/" = {
      directories = [ "/var/lib/private/ollama" ];
    };
    "/persistent/system" = {
      directories = [
        "/etc/tailord"
        "/var/lib/OpenRGB"
      ];
    };
  };
}
