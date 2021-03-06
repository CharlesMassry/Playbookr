Playbookr
=========

A secure app for sharing plays with your team.

Technologies
------------

* Ruby on Rails 4 to build the backend
* PostgreSQL for the database
* JQuery for some AJAX functionality
* AngularJS to push some server-side view logic to the client
* Bourbon to add mixins to SASS
* Delayed Jobs for backround Email sending
* RSpec, Capybara, and Factory Girl for testing

Usage
-----

    $ git clone https://github.com/CharlesMassry/Playbookr.git
    $ rake db:create
    $ rake db:migrate

You need to set Stripe API keys for the sign up process to work. Follow the `.env.sample` to get your API keys. You can then run:

    $ rails server

You also need to set up the Delayed Jobs backround worker to send out the Player Invitation Emails. For that, in a separate window run:

    $ rake jobs:work