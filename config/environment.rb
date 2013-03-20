# Load the rails application
require File.expand_path('../application', __FILE__)
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACf5f4db7f01baea0319b34296c19894ac'
auth_token = '357a03f1a5319b778683b27c07957855'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token
# Initialize the rails application
RoboLove::Application.initialize!
