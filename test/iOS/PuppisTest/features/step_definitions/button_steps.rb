Then /^I should see the first button has the text "([^"]*)"$/ do |button_text|
  expect(ButtonView.new.first_button_text).to eq(button_text)
end

Then(/^I should be able to find a button identified by (.*)/) do |location_method|
  expect(ButtonView.new.send("button_by_#{location_method}?")).to eq(true)
end

When(/^I touch a button$/) do
  ButtonView.new.touch_first_button
end

Then(/^I should see the button was touched$/) do
  expect(ButtonView.new.button_touched_element.exists?).to eq(true)
end