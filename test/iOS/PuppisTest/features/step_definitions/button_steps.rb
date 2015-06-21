Then /^I should see the first button has the text "([^"]*)"$/ do |button_text|
  expect(ButtonView.new.first_button_text).to eq(button_text)
end