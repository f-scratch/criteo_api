lib = File.expand_path('../../../lib/', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'criteo_api'

def client_login
  criteo = CriteoApi::Api.new
  criteo.auth_method = :CRITEO_LOGIN
  criteo_srv = criteo.service(:AdvertiserService, API_VERSION)
  response = criteo_srv.client_login(ENV["CRITEO_ID"], ENV["CRITEO_PASSWD"], 'test_source')
  puts "Logged in successfully: [authToken] '%s' " % response[:client_login_result]
end

if __FILE__ == $0
  API_VERSION = :v201010
  begin
    client_login
  rescue Shampoohat::Errors::ApiException => e
    puts e.message
  end
end
