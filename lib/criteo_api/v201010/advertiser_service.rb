# Encoding: utf-8
#
# This is auto-generated code, changes will be overwritten.
#
# Copyright:: Copyright 2015, Google Inc. All Rights Reserved.
# License:: Licensed under the Apache License, Version 2.0.
#
# Code generated by Shampoohat library 0.0.1 on 2015-06-13 14:37:52.

require 'shampoohat/savon_service'
require 'criteo_api/v201010/advertiser_service_registry'

module CriteoApi; module V201010; module AdvertiserService
  class AdvertiserService < Shampoohat::SavonService
    def initialize(config, endpoint)
      namespace = 'https://advertising.criteo.com/API/v201010'
      default_ns = 'v20'
      super(config, endpoint, namespace, :v201010, default_ns)
    end

    def client_login(*args, &block)
      return execute_action('client_login', args, &block)
    end

    def partner_login(*args, &block)
      return execute_action('partner_login', args, &block)
    end

    def get_account(*args, &block)
      return execute_action('get_account', args, &block)
    end

    def get_campaigns(*args, &block)
      return execute_action('get_campaigns', args, &block)
    end

    def mutate_campaigns(*args, &block)
      return execute_action('mutate_campaigns', args, &block)
    end

    def get_categories(*args, &block)
      return execute_action('get_categories', args, &block)
    end

    def mutate_categories(*args, &block)
      return execute_action('mutate_categories', args, &block)
    end

    def get_budgets(*args, &block)
      return execute_action('get_budgets', args, &block)
    end

    def schedule_report_job(*args, &block)
      return execute_action('schedule_report_job', args, &block)
    end

    def get_job_status(*args, &block)
      return execute_action('get_job_status', args, &block)
    end

    def get_report_download_url(*args, &block)
      return execute_action('get_report_download_url', args, &block)
    end

    def get_statistics_last_update(*args, &block)
      return execute_action('get_statistics_last_update', args, &block)
    end

    private

    def get_service_registry()
      return AdvertiserServiceRegistry
    end

    def get_module()
      return CriteoApi::V201010::AdvertiserService
    end
  end
end; end; end
