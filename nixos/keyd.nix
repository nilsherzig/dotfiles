{ ... }: {

  environment.etc."keyd/default.conf".text = ''
    [ids]
    0001:0001  
    004c:026c

    [main]

    capslock = escape

    j = lettermod(symbols, j, 200, 140)
    f = lettermod(symbols, f, 200, 140)

    k = lettermod(control, k, 200, 140)
    d = lettermod(control, d, 200, 140)

    n = lettermod(altgr, n, 200, 150)
    v = lettermod(altgr, v, 200, 150) 
    space = lettermod(shift, space, 200, 150) 

    altgr = enter 

    shift = noop 
    backspace = noop 
    control = noop
    enter = noop
    # right = noop
    # left = noop
    # up = noop
    # down = noop

    [symbols:S]
    k = backspace
    d = backspace

    # , = S-,  
    # . = S-.
    # - = S--
    # "<" = S-<

    c = G-7
    v = G-8 
    n = G-9 
    m = G-0

    h = left
    j = down
    k = up
    l = right
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
