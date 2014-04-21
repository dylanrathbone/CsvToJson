When(/^I provide the file "(.*?)"$/) do |arg1|
  arg1 = @csv.name
end

Then(/^the file should be validated$/) do
  @csv.valid == true
end

Then(/^I should receive the message "(.*?)"$/) do |arg1|
  @csv.import_message.eql(arg1.to_s)
end
