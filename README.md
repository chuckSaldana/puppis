# Puppis

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/ehedrick/puppis?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge) [![Code Climate](https://codeclimate.com/github/ehedrick/puppis/badges/gpa.svg)](https://codeclimate.com/github/ehedrick/puppis) [![Test Coverage](https://codeclimate.com/github/ehedrick/puppis/badges/coverage.svg)](https://codeclimate.com/github/ehedrick/puppis/coverage) [![Build Status](https://travis-ci.org/ehedrick/puppis.svg?branch=develop)](https://travis-ci.org/ehedrick/puppis)

This gem is an implementation of the page object pattern for calabash. Currently this is still under heavy development with the focus being first on getting iOS tests working well. The longer term goal is to also integrate with android with the same interface and add some neat other additions(stay tuned!)

The goal of this gem is to easily give you the ability to extend on the base set of elements. The mobile world has many custom UI elements that cannot be easily captured as simple elements (button, label, teft_field, etc.)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'puppis'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install puppis

## Usage

To create a view object with puppis you just include it on your class. Then you can start adding the elements on that view.

Example:
```ruby
class Login
  include Puppis

  text_field :username, marked: 'username'
  text_field :password, marked: 'password'
  button :login, marked: 'login'
  button :forgot_password, marked: 'forgot password'
end
```

Functionality is added to the view for each element listed. For a complete list of what is added for each element please consult the documentation (TODO)

Once your views are defined they are easy to interact with.

```ruby
view = Login.new
view.username = 'jdoe'
view.password = 'p@ssword'
view.login
```

## Custom elements

Puppis is designed around the idea of convention over configuration. As such it takes minimal effort to create a new element. Puppis will scan the Puppis::Elements namespace for individual element classes and register them. The name of the class is used as the element type(for example TextField becomes text_field).

Every element adds actions to the view object class when called. The actions are the public interface into the element. There are some that are in every element, but you can also add your own custom actions.
These follow the format:
```ruby
custom_action action_name, action_called_lamda
```
The name of the individual element can be mixed in to the action using the {{name}} syntax. The lamda takes one to many paramters. The first will always be an instance of the element. Any others would be ones that are supplied when the action is called.

Here is an example of a custom element:
```ruby
module Puppis
  module Elements
    class MyElement < Puppis::Elements::Element
      custom_action '{{name}}_do_stuff', ->(me){ me.element_touch }
      custom_action '{{name}}_takes_info', ->(me, something){ puts something }
    end
  end
end

class HasCustomElement
  include Puppis

  my_element :cheese, marked: 'i like chocolate milk'
end

view = HasCustomElement.new
view.cheese_do_stuff                           # first custom action
view.cheese_take_info 'si and I like potatoes' # second custom action
view.cheese_element                            # standard action
```

## Available parts for elements(marked, query)

TODO

## Configuration

TODO: configuration (platform and logging)

## Contributing

1. Fork it ( https://github.com/ehedrick/puppis/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
