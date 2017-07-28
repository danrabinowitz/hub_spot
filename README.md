# HubSpot

[![Gem Version](https://badge.fury.io/rb/hub_spot.svg)](https://badge.fury.io/rb/hub_spot)
[![Code Climate](https://codeclimate.com/github/danrabinowitz/hub_spot/badges/gpa.svg)](https://codeclimate.com/github/danrabinowitz/hub_spot)
[![Build Status](https://travis-ci.org/danrabinowitz/hub_spot.svg?branch=master)](https://travis-ci.org/danrabinowitz/hub_spot)
[![Test Coverage](https://codeclimate.com/github/danrabinowitz/hub_spot/badges/coverage.svg)](https://codeclimate.com/github/danrabinowitz/hub_spot/coverage)
[![Gem](https://img.shields.io/gem/dt/hub_spot.svg?maxAge=2592000)](https://rubygems.org/gems/hub_spot)


## Usage

1) Add the gem to your Gemfile
```ruby
gem 'hub_spot'
```

2) Run the following setup code on initialization:
```ruby
HubSpot::Configuration.client_id = ENV.fetch("HUBSPOT_CLIENT_ID")
HubSpot::Configuration.client_secret = ENV.fetch("HUBSPOT_CLIENT_SECRET")
HubSpot::Configuration.refresh_token = ENV.fetch("HUBSPOT_REFRESH_TOKEN")
HubSpot::Configuration.redirect_uri = ENV.fetch("HUBSPOT_REDIRECT_URI")
```

3) Call the api...


## Contributing
PRs are welcome!

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HubSpot project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/danrabinowitz/hub_spot/blob/master/CODE_OF_CONDUCT.md).
