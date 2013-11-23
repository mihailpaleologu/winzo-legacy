# Load the rails application
require File.expand_path('../application', __FILE__)

AWS::S3::DEFAULT_HOST = "winzo.s3.amazonaws.com"

# Initialize the rails application
Winzo::Application.initialize!
