
class AppConfig
  cattr_accessor :crucible_base_url, :crucible_api_url, :crucible_user, :crucible_password


end

app_config =  YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]

AppConfig.crucible_base_url ="#{app_config['crucible_base_url']}"
AppConfig.crucible_api_url = "#{AppConfig.crucible_base_url}/rest-service"
AppConfig.crucible_user ="#{app_config['crucible_user']}"
AppConfig.crucible_password ="#{app_config['crucible_password']}"
