{
  networking.networkmanager.ensureProfiles = {
    eth0 = {
      connection = {
        id = "eth0";
        type = "ethernet";
        interface-name = "enp4s0";
        autoconnect = true;
      };

      ipv4 = {
        method = "manual";
        dns = "1.1.1.1;1.0.0.1;";
        dns-search = "192.168.10.0";
        address1 = "192.168.10.128/24";
        gateway = "192.168.10.1";
        ignore-auto-dns = true;
        ignore-auto-routes = true;
        may-fail = false;
      };
      ipv6 = {
        method = "disabled";
      };
    };
  };
}
