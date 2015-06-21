class ButtonView < BaseView

  button :has_label,        marked: 'button label'
  button :has_no_label,     text: 'Button with no accessibility label'
  button :segment_part_one, class: 'UISegment', index: 0
  button :segment_part_two, class: 'UISegment', index: 1
  button :first_button,     index: 0

  button :button_by_class,  class: 'UISegment'
  button :button_by_marked, marked: 'button label'
  button :button_by_label,  label: 'Button label'
  button :button_by_text,   text: 'Button with no accessibility label'
  button :button_by_index,  index: 0
  button :button_by_query,  query: 'UIButton index:0'

end