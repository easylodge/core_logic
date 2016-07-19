# Corelogic

Core logic gem for EasyLodge

## Installation

Add this line to your application's Gemfile:

    gem 'corelogic'

And then execute:

    $ bundle

Then run install generator:

    rails g corelogic:install

You can also copy the gem rspec tests to your local app with:

    rails g corelogic:rspec

Then run migrations:

    rake db:migrate

Complete the Core logic details in config/corelogic_config.yml

## Usage

### Authentication

Authentication credentials can be obtained by following instructions [Here](https://developer.corelogic.asia/access_token).

### CorelogicProperty

####Available scopes:

*   .detail(property_id)

    > The Property Detail Service allows users to obtain detailed property information for a single property. User can pass a Property ID and specify what information they would like returned.

*   .search_by_point(longitude, latitude)

    > The Search By Point service allows users to a pass a geo coordinate (latitude and longitude) and it will return the property (or properties) that fall on that point.

*   .profile_pdf(params={})

    > The Profile Service allows users to obtain a Property Profile Report (PDF) that provides insightful information for a particular property and the state of its local market. In order to successfully generate a report, a Property ID and a Report ID must be passed in addition to a number of optional report variables.

*   .suggestion_service(q, limit=nil, include_units=nil, include_body_corporates=nil, return_suggestion=nil)

    > The Suggest service allows users to retrieve suggestions and associated IDs for a street address, street name, locality (suburb) and/or postcode.


    For more detailed information, explore the [Corelogic Docs For Property](https://developer.corelogic.asia/explore_property).

### CorelogicSearch

####Available scopes:

*   .match_address(client_name=nil, match_profile_id=nil, q)

    > The CoreLogic Address Matcher service allows a single address string to be matched with a valid property that exists within the CoreLogic database.

*   .find_by_address(client_name=nil, match_profile_id=nil, q)

    > This is a combination of the corelogic address matcher and property detail services. It takes in an address as query and yields the property details of a valid existing property


    For more detailed information, explore the [Corelogic Docs For Searches](https://developer.corelogic.asia/explore_search).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
