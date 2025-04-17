{ ... }: {
  environment.etc."keyd/default.conf".text = ''
    [ids]
    # logitech ergo
    046d:4088
    0001:0001
    004c:026c
    05ac:026c
    046d:c52b

    8087:0029

    [main]
    space = overload(shift, space);

    capslock = esc
    # esc = capslock

    esc = noop
    shift = noop
    control = noop

    k = lettermod(control, k, 200, 140)
    d = lettermod(control, d, 200, 140)

    f = lettermod(symbols, f, 200, 140)
    j = lettermod(symbols, j, 200, 140)

    [symbols]
    d = backspace
    f = enter

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

  services.keyd.enable = true;
}
