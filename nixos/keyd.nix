{ ... }: {
  systemd.services.customKeyd = {
    description = "custom keyd";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];

    serviceConfig = {
      ExecStart = "/home/nils/Documents/keyd/bin/keyd";
      Restart = "always";
      User = "root";
    };
  };

  environment.etc."keyd/default.conf".text = ''
    [ids]

    *

    [main]

    # Maps capslock to escape when pressed and control when held.
    capslock = overload(control, esc)

    j = lettermod(shift, j, 200, 150)
    f = lettermod(shift, f, 200, 150)

    k = lettermod(control, k, 200, 150)
    d = lettermod(control, d, 200, 150)

    s = lettermod(altgr, s, 200, 150)
    l = lettermod(alt, l, 200, 150)

    space = lettermod(layer1, space, 200, 150) 

    alt = return
    altgr = backspace 

    # [control:C]
    # e = macro(control + tab)

    [layer1]
    o = backspace
    e = tab
    r = enter
  '';

  services.keyd = {
    enable = false; # disabled until i get the nice new features
    keyboards."*".settings = {
      main = {
        # capslock = "overload(control, esc)";

        # j = "overloadi(j, overloadt2(shift, j, 200), 150)";
        # f = "overloadi(f, overloadt2(shift, f, 200), 150)";
        #
        # k = "overloadi(k, overloadt2(control, k, 200), 150)";
        # d = "overloadi(d, overloadt2(control, d, 200), 150)";
        #
        # s = "overloadi(s, overloadt2(altgr, s, 200), 150)";
        # l = "overloadi(l, overloadt2(altgr, l, 200), 150)";

        # shift = "oneshot(shift)";
        # meta = "oneshot(meta)";
        # control = "oneshot(control)";

        # leftalt = "oneshot(alt)";
        # rightalt = "oneshot(altgr)";
      };
    };
  };
}
