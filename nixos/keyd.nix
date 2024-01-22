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
    * # keyboard it filter 

    [main]

    capslock = escape

    j = lettermod(symbols, j, 100, 150)
    f = lettermod(symbols, f, 100, 150)

    k = lettermod(control, k, 100, 150)
    d = lettermod(control, d, 100, 150)

    m = lettermod(altgr, m, 100, 150)
    c = lettermod(altgr, c, 100, 150) 

    space = lettermod(shift, space, 100, 150) 

    altgr = enter 

    shift = noop 
    backspace = noop 
    control = noop
    enter = noop

    [symbols]
    k = backspace
    d = backspace

    u = G-7
    i = G-8 
    o = G-9 
    p = G-0
  '';

  services.keyd = {
    enable = false; # disabled until upstream gets lettermod
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
