lib = File.expand_path('../../../lib/', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'criteo_api'

def client_login
  criteo = CriteoApi::Api.new("/Users/equus/Documents/progs/work/fs/criteo_api/criteo_api.yml")
  ns_index = "v20"
  criteo.auth_method = :CRITEO
  criteo.header_info = {"#{ns_index}:authToken" => "xxxxxx",
                        "#{ns_index}:appToken" => "yyyyy",
                        "#{ns_index}:clientVersion" => "3.6"}

  criteo_srv = criteo.service(:AdvertiserService, API_VERSION)

  puts criteo_srv.get_account()
  # puts criteo_srv.client_login('hoge','fuga','mogu')
end

if __FILE__ == $0
  API_VERSION = :v201010
  begin
    client_login
  rescue => e
    puts e
  end
end
