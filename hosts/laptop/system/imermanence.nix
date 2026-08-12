{ ... }:

{
  environment.persistence = {
    "/persistent/system" = {
      directories = [
        "/etc/tailord"
      ];
    };
  };
}
