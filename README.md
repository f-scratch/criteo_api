# Criteo API Client Library

This ruby gem is the client library for [Criteo API](http://kb.criteo.com/advertising/index.php?action=artikel&cat=9&id=27&artlang=en) .

It contains full support for all API services with full stubs, and a simplified
programming interface that lets you handle everything in native Ruby
collections.


# Docs for Users

## 1 - Installation

`criteo_api` is ruby gems.

Install them using the gem install command:

```Gemfile
gem 'criteo_api', git: "git@github.com:f-scratch/criteo_api.git"
```

The gem also depends on the
Shampoohat library, which will be installed automatically.

The following gem libraries are required:

 - savon
 - shampoohat

## 2 - Using the client library

By default, the API uses a config file in `ENV['HOME']/criteo_api.yml`.

You can also pass the API a manually constructed config hash like:

    criteo = CriteoApi::Api.new({
      :authentication => {
          :method => 'OAuth2',
          :oauth2_client_id => 'INSERT_OAUTH2_CLIENT_ID_HERE',
          :oauth2_client_secret => 'INSERT_OAUTH2_CLIENT_SECRET_HERE',
          :developer_token => 'DEVELOPER_TOKEN',
          :client_customer_id => '012-345-6789',
          :user_agent => 'Ruby Sample'
      },
      :service => {
        :environment => 'PRODUCTION'
      }
    })

Once you have all the requisite setup complete, you're ready to make an API
call.

The basics of making a request are:

 1. Include the library with `require`:

        require 'creteo_api'

 2. Create an API instance:

        criteo = CriteoApi::Api.new

 3. Specify which service you're looking to use, and which version:

        criteo_srv = criteo.service(:AdvertiserService, API_VERSION)

 4. You should now be able to just use the API methods in the returned object:

        criteo_srv.get_account

# Docs for Developers

## Rake targets

To regenerate all the stubs for all versions if needed:

    $ rake generate

To target a specific version:

    $ rake generate[version]

For example:

    $ rake generate[v201502]

To target a specific service in a specific version:

    $ rake generate[version,service]

For example:

    $ rake generate[v201502,CampaignService]

To build the gems:

    $ gem build criteo_api.gemspec

To run unit tests on the library:

    $ rake test

## Authors
- Junya Wako(junwako@gmail.com)
