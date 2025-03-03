system: hostname: username: fullname: email: {
  # general
  system = system;
  hostname = hostname;
  timeZone = "Europe/Berlin";
  # user
  defaultUser = username;
  defaultUserUID = 1000;
  defaultUserGID = 1000;
  defaultUserFullName = fullname;
  defaultUserEmail = email;

  # networking
  # wireguardInterface = "wg0";
  # hosts

  # domains
  #domain = "local.luana.casa";
  #externalDomain = "external.luana.casa";

  # configs
  servicesConfigRoot = "/persistent/opt/services";
  containersConfigRoot = "/persistent/opt/containers";
}
