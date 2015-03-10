# Polyfillrb [![Code Climate](https://codeclimate.com/github/blainekasten/polyfillrb/badges/gpa.svg)](https://codeclimate.com/github/blainekasten/polyfillrb)

A simple ruby wrapper for the phenominal [Polyfill.io Service by FTLabs](https://cdn.polyfill.io/v1/docs/) for Rails applications.


### How to use
The library provides a simple view helper to load in the polyfills. Simply in any view file add the `polyfills` call. Make sure to load it prior to running any other javascript. Here's an example `app/views/layouts/welcome.erb`:

    <html>
      <head>
        <title>Welcome</title>
        <%= stylesheet_link_tag 'application', media: 'all' %>
        <%= csrf_meta_tokens %>
      </head>
      <body>
      
        <%= yield %>
        
        <%= polyfills %>
        <%= javascript_include_tag 'application' %>
      
      </body>
    </html>

### Installing

Add the gem to your Gemfile: `gem "polyfillrb", "~>1.1.0"`


### Future Plans

* Cache polyfills to avoid node IO calls (especially in production)
* Ensure we are doing the most performant javascript executions.

