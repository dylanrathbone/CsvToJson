When(/^I provide the file "(.*?)"$/) do |arg1|
  arg1 = @json_generator.name
end

Then(/^the file should be validated$/) do
  @json_generator.valid == true
end

Then(/^I should receive the message "(.*?)"$/) do |arg1|
  @json_generator.import_message.eql(arg1.to_s)
end
