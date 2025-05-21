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

    # f+j = oneshot(actions)
    # d+f = oneshot(actions) 
    # h+j = enter

    j+k = esc
    i+o = backspace

    # capslock = esc
    # capslock = overload(control, esc)
    # i = overload(macro(i), esc)
    # esc = capslock

    # esc = noop
    # capslock = noop
    shift = noop
    # control = noop
    # backspace = noop
    # enter = noop
    # tab = noop
    # alt = noop

    # j = lettermod(control, j, 200, 140)
    # f = lettermod(control, f, 200, 140)

    # d = lettermod(altgr, d, 200, 140)
    # k = lettermod(alt, k, 200, 140)

    [actions]
    d = oneshot(alt)
    k = oneshot(control)
    1 = M-1
    2 = M-2
    3 = M-3

    [altgr]
    j = G-7
    k = G-8
    l = G-9
    # ö = G-0

    # k = lettermod(symbols, k, 200, 140)
    # d = lettermod(symbols, d, 200, 140)

    # \ = oneshot(control) 
    #
    # [mods]
    # k = oneshot(control)

    [symbols]
    # j = macro(C-backspace)
    # s = macro(A-tab)
    # d = macro(A-tab)
    # l = macro(A-tab)

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
