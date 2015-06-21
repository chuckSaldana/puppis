class ButtonView < BaseView

  button :has_label,        marked: 'button label'
  button :has_no_label,     text: 'Button with no accessibilty label'
  button :segment_part_one, class: 'UISegment', index: 0
  button :segment_part_two, class: 'UISegment', index: 1
  button :first_button,     index: 0
end