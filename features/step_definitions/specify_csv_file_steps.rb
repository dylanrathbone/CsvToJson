require 'FileTransformer'
require 'ApplicationHelper'
require 'stringio'


Given(/^a the valid csv file "(.*?)"$/) do |csv_file|
  set_standard_out
  FileTransformer.new(JsonGenerator.new(csv_file))
end

Given(/^the invalid csv file "(.*?)"$/) do |csv_file|
  set_standard_out
  FileTransformer.new(JsonGenerator.new(csv_file))
end

Then(/^the user should receive the message "(.*?)"$/) do |message|
  expect($stdout.string).to include(message)
end

And(/^standard output for the stock data should display the valid json:$/) do |json_output|
  expect($stdout.string).to include(json_output)
  reset_standard_out
end


def set_standard_out
  $stdout = StringIO.new
end

def reset_standard_out
  $stdout = STDOUT
end


