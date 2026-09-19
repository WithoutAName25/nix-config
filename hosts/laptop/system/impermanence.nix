{ ... }:

{
  environment.persistence = {
    "/persistent/system" = {
      directories = [
        "/etc/tailord"
        {
          directory = "/var/lib/bluetooth";
          user = "root";
          group = "root";
          mode = "0700";
        }
      ];
    };
  };
}
