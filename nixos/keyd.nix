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
    capslock = overload(control, esc)
    esc = capslock
  '';

  services.keyd.enable = true;
}
