{...}: {
  services.dnscrypt-proxy2 = {
    enable = true;

    settings = {
      fallback_resolvers = ["9.9.9.9:53" "1.1.1.1:53"];
      ignore_system_dns = true;

      netprobe_address = "9.9.9.9:53";
    };
  };
}
