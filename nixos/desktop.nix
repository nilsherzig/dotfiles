{ config, lib, ... }:
lib.mkIf (config.networking.hostName == "desktop") {
  # Enable swap on luks
  boot.initrd.luks.devices."luks-c9eb19e3-05fa-4057-a251-60d49d38de4c".device =
    "/dev/disk/by-uuid/c9eb19e3-05fa-4057-a251-60d49d38de4c";
  boot.initrd.luks.devices."luks-c9eb19e3-05fa-4057-a251-60d49d38de4c".keyFile =
    "/crypto_keyfile.bin";

  # boot.initrd.kernelModules = [ "usb_storage" ];

  # boot.initrd.luks.devices = {
  #   luksroot = {
  #     device = "/dev/disk/by-uuid/c9eb19e3-05fa-4057-a251-60d49d38de4c";
  #     allowDiscards = true;
  #     keyFileSize = 4096;
  #     keyFile = "/dev/disk/by-uuid/3926a9cb-ad4d-4e04-b2f8-a0ee004f2252";
  #   };
  # };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 53 80 443 2049 8123 9090 8096 6443 ];
    allowedUDPPorts = [ 22 53 80 443 8123 9090 8096 ];
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };

  users.users.nils.openssh.authorizedKeys.keyFiles =
    [ /home/nils/dotfiles/nilsherzig.keys ];

  fileSystems."/data" = {
    device = "/dev/disk/by-label/ssd1tb";
    fsType = "ext4";
  };

  # fileSystems."/bigdata" = {
  #   device = "/dev/disk/by-label/hdd12tb";
  #   fsType = "ext4";
  # };

  # boot.initrd.availableKernelModules = [ "iwlwifi" "r8169" ];
  # # boot.initrd.availableKernelModules = [ "r8169" ];
  # boot.kernelParams = [ "ip=dhcp" ];

  # boot.initrd.network.enable = true;
  # boot.initrd.network.ssh = {
  #   enable = true;
  #   port = 22;
  #   # shell = "/bin/cryptsetup-askpass";
  #   authorizedKeys = [
  #     "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCF2Jqb4iSAEBV7AKfVefqzqmZTfFJ/Ab1DpKbW6UdHlT9xXw/U165eAeRQOcxuSfgy2HxOxvvtpcsU9FNSwRhol2nnhtY8kx9rdtQpZ7Lju/kUCi68VQZfq3rFFQas1U+u2R7OYHKt7I0TZWFzaepU8Yb2b6eQLQegm0t1L1jcOb962LbCal2SEJhPpFEwKCBuENQF7ivgDCTpLNtoKaYzVvPjR0+hMfQhdw8gCtWFIgxcBzC0cwe7qVQPGl+Q0AsVrbB92j3wWVc20FjJP7Ij8ZiwHaGPrJDiFnXepVQlzwPpqdR4bLNRqPmxxpTBkrZ53RGtWyhtFDcrygRCC3Q2PWcjYCx2EVKZR2OtXprqKxaF7bmYls2w1NDWPdqtBTjY0Sswz9cCj0U/avgc4bcISLS3rrrTwPKrkVVZH60qa1duTGyTANlAb9ul5IqTmzvnYgbSZw4/HTYc/xr1qj7JGbcTSWSvavvEH2ADruH78NQ/rJeUQdk5AxYrIXdviPs="
  #     "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDO1tbzO7yn4mveUDm+kWMZWTzfvS9J13lwDAC2P1OxEzrPW/zUNhk+KEq2VVKZDeKnrJzDPGvg0+81fmqkSiEWie8tHLLplQEc5V/fx9Adbm26d/xbIhRklGsCg8Nk6+lAPorNzlbEMDjgC5RubTY4L6qIqQx3kARddSlCta7vuSO5NEtbdGj40LQzm5Hi3Zi0vn3sgdaI+YU1gqi7E+cs6FhVbfQhI8O9sXAbeu6wHETfBTi7DjRvPWaFMsh47YtlXhInqpc1U9a4mRqYOPRwzFWXxa5We8Wt5q0/E1r6WQJy/wOYUZslyKq//h5V8XMOVS/bq3Ymlxj+M5Z+aeZ6RQNtKLA7Nal1DmntW3QQYD9bxR3FsnJ8L0V9xpmPcLpnU83zpyyFo3DmBUPUqiUOhAWY05gwvTZfh2HwIRCW0xjMtaoXoljM9rs+9GXciLaafQfrXhvdQj7EVI5lEZDLfjbU8Vhji64A6932RLS5qdoHvaoqnB108wrGqDPCxsk="
  #     "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCb1KXNu4DB/4nFu6W+CaXM2SCNTG5TCj47lRcZiLgi21OdcUIPZefkW8+AaXePfDyKJPpAa4dfCf6HskK71hfgkkozWv+BOUr7yxKh1Ay+PwcJWLNcFl0S8i/jgmm0SXTDT7qE/E3/5rCOjw5C1+GlOJVQZicb6H55Swdwoa54WYZ3OXcbuhJN6+WTeewZy863/HNqht6NwFC5jE+UaKX/2aCgmJoD/+RjNYxtd0dwiEBIPx8NKSfzyucwQuPzUUzA1YJAjBAHa2+9Wuh+Q25xXM7F4lcBjbVTPdWKmGBHbOHc2MooybwkZl+B423zVeOS5+SQZIiu93qcbiFFhwl0egr2erZwAwjFFl1LHQd+KXOJKDRQD0TaDsZPNl2nnG57oaeXsKBhHBp3XslvC/Mapll1p469aMKdaw6kylp/ltwtjGPHDqQEoB2O7IS0rDjYBbmYMRgkISpAHrNrqstdo/FY8cpgrvyPqlFBUU+GH1zYY1Ownj6/MDEM7Vgspb0="
  #   ];
  #   hostKeys = [ "/etc/secrets/initrd/ssh_host_rsa_key" ];
  # };
  virtualisation.vmVariant = {
    virtualisation = {
      memorySize = 5000; # Use 2048MiB memory.
      cores = 6;
    };
  };

  # services.k3s.enable = false;

  # services.nfs.server.enable = true;
  # services.nfs.server.exports = ''
  #   /bigdata/media/         127.0.0.1/24(rw,insecure,no_subtree_check)
  # '';

  # fileSystems."/mnt/test" = {
  #   device = "desktop:/bigdata/media/";
  #   fsType = "nfs";
  # };
}
