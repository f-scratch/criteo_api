lib = File.expand_path('../../../lib/', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'criteo_api'

def client_login
  criteo = CriteoApi::Api.new
  ns_index = "v20"
  criteo.auth_method = :NOTHING
  criteo_srv = criteo.service(:AdvertiserService, API_VERSION)
  puts criteo_srv.client_login('hoge','fuga','mogu')
end

if __FILE__ == $0
  API_VERSION = :v201010
  begin
    client_login
  rescue Shampoohat::Errors::ApiException => e
    puts e.message
  end
end
