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
    backspace = noop
    tab = noop
    enter = noop

    j = lettermod(control, j, 200, 140)
    f = lettermod(control, f, 200, 140)

    k = lettermod(symbols, k, 200, 140)
    d = lettermod(symbols, d, 200, 140)

    # \ = oneshot(control) 
    #
    # [mods]
    # k = oneshot(control)

    [symbols]
    j = macro(C-backspace)
    s = macro(A-tab)
    d = macro(A-tab)
    l = macro(A-tab)

    f = enter

    a = tab

    # , = S-,
    # . = S-.
    # - = S--
    # "<" = S-<

    c = G-7
    v = G-8
    n = G-9
    m = G-0


    # h = left
    # j = down
    # k = up
    # l = right
  '';

  services.keyd.enable = true;
}
