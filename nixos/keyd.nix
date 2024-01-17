{ ... }: {
  services.keyd = {
    enable = true;
    keyboards."*".settings = {
      main = {
        j = "overloadt(modLayerOne, j, 300)";
        f = "overloadt(modLayerOne, f, 300)";

        k = "overloadt(control, k, 300)";
        d = "overloadt(control, d, 300)";

        s = "overloadt(altgr, s, 300)";
        l = "overloadt(altgr, l, 300)";

        caps = "overload(caps, caps)";
      };

      modLayerOne = {
        # chars use position on us layout for some reason
        "1" = "!";
        "2" = "@";
        "3" = "#";
        "4" = "$";
        "5" = "%";
        "6" = "^";
        "7" = "&";
        "8" = "*";
        "9" = "(";
        "0" = ")";
        "," = "<";
        "." = ">";
        "m" = "backspace";
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
