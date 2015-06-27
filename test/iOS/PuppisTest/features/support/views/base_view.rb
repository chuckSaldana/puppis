class BaseView
  include Puppis

  button :button_tab, marked: 'Button', class: 'UITabBarButton'
  button :input_tab, marked: 'Input', class: 'UITabBarButton'
end