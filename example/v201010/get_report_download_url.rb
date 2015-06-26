lib = File.expand_path('../../../lib/', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'criteo_api'

def client_login
  criteo = CriteoApi::Api.new
  criteo.auth_method = :CRITEO_LOGIN
  criteo_srv = criteo.service(:AdvertiserService, API_VERSION)
  response = criteo_srv.client_login(ENV["CRITEO_ID"], ENV["CRITEO_PASSWD"], 'test_source_is_anything_ok?')
  return response[:client_login_result]
end

def get_report_download_url(job_id)
  auth_token = client_login
  ns_index = "v20"
  criteo = CriteoApi::Api.new
  criteo.auth_method = :CRITEO
  criteo.header_info = {"#{ns_index}:authToken"     => auth_token,
                        "#{ns_index}:appToken"      => ENV["CRITEO_APPTOKEN"],
                        "#{ns_index}:clientVersion" => "3.6"}
  criteo_srv = criteo.service(:AdvertiserService, API_VERSION)
  response = criteo_srv.get_report_download_url(job_id)
  puts "Download URL of Job ID[#{job_id}] : #{response[:job_url]}"
end

if __FILE__ == $0
  API_VERSION = :v201010
  begin
    get_report_download_url(ARGV[0])
  rescue Shampoohat::Errors::ApiException => e
    puts e.message
  end
end
