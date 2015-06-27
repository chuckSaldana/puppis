class InputView
  include Puppis

  text_field :first_text_field, index: 0
  text_field :text_field_by_index, index: 1
  text_field :text_field_by_class, class: 'UITextField'
  text_field :text_field_by_marked, marked: 'regular text field'
  text_field :text_field_by_label, label: 'regular text field'
  text_field :text_field_by_query, query: 'UITextField'
end