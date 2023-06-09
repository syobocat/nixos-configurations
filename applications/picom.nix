{ config, ... }:

{
  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
    inactiveOpacity = 0.9;
    settings = {
      glx-no-rebind-pixmap = true;
    };
    opacityRules = [
      "100:role = 'PictureInPicture'"
    ];
  };
}
