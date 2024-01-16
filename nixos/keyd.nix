{ ... }: {
  services.keyd = {
    enable = true;
    keyboards."*".settings = {
      main = {
        # capslock = "layer(caps)";
        # rightalt = "layer(rightalt)";
        rightalt = "layer(altgr)";
        space = "overload(space, shift)";
        capslock = "esc";
      };

      altgr = {
        "u" = "G-7";
        "i" = "G-8";
        "o" = "G-9";
        "p" = "G-0";
      };

      caps = {
        h = "left";
        j = "down";
        k = "up";
        l = "right";
      };
    };
  };
}
