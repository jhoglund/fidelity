# Fidelity gem
A Ruby on Rails DSL for creating rapid prototypes. Depends on [Foundation](http://http://foundation.zurb.com/).

Install
-----

This is still in alpha and under development. To install add the gem to your Gemfile in your Ruby on Rails 3.2 application:

    gem "fidelity"

Once you have it installed you need to run inside the rails applications root directory:
		
    rails g fidelity:install
		
		
How to use
-----

View full documentation at: `http://localhost:3000/fidelity`

Below is a brief example of how to use the DSL (the example is a HAML template so don't forget to include the haml gem in your Gemfile to make the example work ). 

```ruby
	= fidelity_for do |f|
		= f.grid do
			= f.row do
				= f.column(3) do
					%h3 Label
				= f.column(9) do
					= f.widget :label, :content => 'This is the content of the label'
			= f.row(:border => true) do
				= f.column(3) do
					%h3 Alert
				= f.column(9) do
					= f.widget(:alert, :type => :success) do
						This is a success alert 
					= f.widget(:alert, :type => :error) do
						This is a error alert 
			= f.row(:border => true) do
				= f.column(3) do
					%h3 Buttons
				= f.column(9) do
					%p= f.widget :button, :size => 'medium', :corners => 'radius', :style => 'nice', :color => 'red', :label => 'Medium red nice looking button'
```