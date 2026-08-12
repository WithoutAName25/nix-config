{ ... }:

{
  home.persistence."/persistent/cache" = {
    directories = [
      ".local/share/Steam"
      ".steam"
    ];
  };
  home.persistence."/persistent/data" = {
    directories = [
      ".local/share/Steam-userdata"
    ];
  };
}
