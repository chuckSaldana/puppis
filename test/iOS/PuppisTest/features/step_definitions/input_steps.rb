Then(/^I should be able to find a text field identified by (.*)/) do |location_method|
  expect(InputView.new.send("text_field_by_#{location_method}?")).to eq(true)
end


When(/^I set the value fo the first text field to "([^"]*)"$/) do |val|
  @val = val
  InputView.new.first_text_field = @val
end

Then(/^the value of the field should be set$/) do
  expect(InputView.new.first_text_field).to eq @val
end