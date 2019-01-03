# Environment variables
#
Rails.application.config.before_configuration do
  env_file = File.join(Rails.root, 'config', 'environment_variables.yml')
  if File.exist?(env_file)
    YAML.load_file(env_file)[Rails.env].each do |key, value|
      # rubocop:disable Security/Eval
      ENV[key.to_s] = value.include?('ENV') ? eval(value) : value
      # rubocop:enable Security/Eval
    end
  end
end