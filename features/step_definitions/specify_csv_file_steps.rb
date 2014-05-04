require 'FileTransformer'
require 'ApplicationHelper'
require 'stringio'


Given(/^a the valid csv file "(.*?)"$/) do |csv_file|
  FileTransformer.new(JsonGenerator.new(csv_file))

end

Then(/^the user should receive the message "(.*?)"$/) do |message|
  $stdout = StringIO.new
  FileTransformer.new(JsonGenerator.new("test_data.csv"))
  expect($stdout.string).to include(message)
  $stdout = STDOUT
end

And(/^standard output for the test data should display the valid json:$/) do |json_output|
  $stdout = StringIO.new
  FileTransformer.new(JsonGenerator.new("test_data.csv"))
  expect($stdout.string).to include(json_output)
  $stdout = STDOUT
end