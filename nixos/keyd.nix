{ ... }: {
  environment.etc."keyd/default.conf".text = ''
    [ids]
    # logitech ergo
    046d:4088
    0001:0001
    004c:026c
    05ac:026c
    4b42:6071
    046d:c52b
    8087:0029

    [main]
    capslock = esc 
    # esc = capslock
    esc = noop

    k = lettermod(control, k, 200, 140)
    d = lettermod(control, d, 200, 140)
  '';

  services.keyd.enable = true;
}
