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

def get_campaigns
  auth_token = client_login
  ns_index = "v20"
  criteo = CriteoApi::Api.new
  criteo.auth_method = :CRITEO
  criteo.header_info = {"#{ns_index}:authToken"     => auth_token,
                        "#{ns_index}:appToken"      => ENV["CRITEO_APPTOKEN"],
                        "#{ns_index}:clientVersion" => "3.6"}
  criteo_srv = criteo.service(:AdvertiserService, API_VERSION)
  response = criteo_srv.get_campaigns(campaign_params)
  response[:get_campaigns_result][:campaign].each_with_index do |campaign, i|
    str = []
    campaign.each do |key, value|
      str << "[#{key}] : #{value}" if key == :campaign_id || key == :campaign_name || key == :status
    end
    puts "NO.#{i+1} " + str.join(", ")
  end
end

def campaign_params
  {
    campaign_i_ds: {int: []},
    budget_i_ds: {int: []},
    campaign_status: {campaign_status: ["RUNNING"]}
  }
end

if __FILE__ == $0
  API_VERSION = :v201010
  begin
    get_campaigns
  rescue Shampoohat::Errors::ApiException => e
    puts e.message
  end
end
