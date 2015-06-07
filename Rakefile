require "bundler/gem_tasks"

lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Google common ads library used for wrapper code generation.
require 'shampoohat/build/savon_generator'
require 'criteo_api/api_config'

desc 'Generate the Adwords API stubs.'
task :generate, :version, :service do |_, args|
  logger = Logger.new(STDOUT)
  logger.level = Logger::INFO

  api_config = CriteoApi::ApiConfig
  version = args[:version]
  versions = api_config.versions()
  unless version.nil?
    versions.select! {|v| v == version.to_sym}
    raise 'Invalid version specified: %s' % version if versions.empty?
  end
  service = args[:service]

  versions.each do |version|
    code_path = 'lib/%s/%s' % [api_config.api_name.to_s.snakecase, version]
    wsdls = CriteoApi::ApiConfig.get_wsdls(version)
    wsdls.each do |service_name, wsdl_url|
      next unless service.nil? or service_name.eql?(service)
      wsdl_url = "https://advertising.criteo.com/API/v201010/AdvertiserService.asmx?WSDL"
      logger.info('Processing %s at [%s]...' % [service_name, wsdl_url])
      generator = Shampoohat::Build::SavonGenerator.new(
          wsdl_url, code_path, api_config.api_name, version, service_name)
      generator.process_wsdl()
    end
  end
end
