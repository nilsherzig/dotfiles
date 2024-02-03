{ ... }: {

  environment.etc."keyd/default.conf".text = ''
    [ids]
    0001:0001  
    004c:026c

    [main]

    capslock = escape

    j = lettermod(symbols, j, 200, 150)
    f = lettermod(symbols, f, 200, 150)
    k = lettermod(control, k, 200, 150)
    d = lettermod(control, d, 200, 150)
    m = lettermod(altgr, m, 200, 150)
    c = lettermod(altgr, c, 200, 150) 
    space = lettermod(shift, space, 200, 150) 

    # j = overload(symbols, j)
    # f = overload(symbols, f)
    # k = overload(control, k)
    # d = overload(control, d)
    # m = overload(altgr, m)
    # c = overload(altgr, c)


    altgr = enter 

    shift = noop 
    backspace = noop 
    control = noop
    enter = noop
    right = noop
    left = noop
    up = noop
    down = noop

    [symbols]
    k = backspace
    d = backspace

    u = G-7
    i = G-8 
    o = G-9 
    p = G-0

    h = left
    j = down
    k = up
    l = right

    1 = S-1
    2 = S-2
    3 = S-3
    4 = S-4
    5 = S-5
    6 = S-6
    7 = S-7
    8 = S-8
    9 = S-9
    0 = S-0
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
