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

def schedule_report_job
  auth_token = client_login
  ns_index = "v20"
  criteo = CriteoApi::Api.new
  criteo.auth_method = :CRITEO
  criteo.header_info = {"#{ns_index}:authToken"     => auth_token,
                        "#{ns_index}:appToken"      => ENV["CRITEO_APPTOKEN"],
                        "#{ns_index}:clientVersion" => "3.6"}
  criteo_srv = criteo.service(:AdvertiserService, API_VERSION)
  response = criteo_srv.schedule_report_job(report_job_params)
  response[:job_response].each do |key, value|
    puts "[#{key}] : #{value}" if key == :job_id || key == :job_status
  end
end

def report_job_params
  {
    :selected_columns => {:report_column => []},
    :report_selector => {:category_i_ds => {int: []}, :campaign_i_ds => {int: []}, :banner_i_ds => {int: []}},
    :report_type => 'Campaign',
    :aggregation_type => 'Daily',
    :start_date => '2015-06-19',
    :end_date => '2015-06-20',
    :is_result_gzipped => false
  }
end

if __FILE__ == $0
  API_VERSION = :v201010
  begin
    schedule_report_job
  rescue Shampoohat::Errors::ApiException => e
    puts e.message
  end
end
