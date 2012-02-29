# Fidelity gem
A Ruby on Rails DSL for creating rapid prototypes. Depends on [Foundation](http://http://foundation.zurb.com/).

Install
-----

This is still in alpha and under development. But to test clone this rails engine:

		git clone@github.com/jhoglund/fidelity.git

Link to in from gem to your Gemfile in your Ruby on Rails 3.2 application and add the 'zurb-foundation' gem:

    gem "fidelity", :path => 'path/to/the/git/repository'
		gem 'zurb-foundation'

Once you have it installed you need to run inside the rails applications root directory:
		
		rails g fidelity:install
		
		
How to use
-----

Below is a brief example of how to use the DSL (the example is a HAML template so don't forget to include the haml gem in your Gemfile to make the example work ). 

```ruby
	= fidelity_for(:width => 960) do |f|
		= f.row do
			= f.column(3) do
				= f.widget :heading, 'Label'
			= f.column(9) do
				= f.widget :label, :content => 'This is the content of the label'
		= f.row(:border => true) do
			= f.column(3) do
				= f.widget :heading, 'Alert'
			= f.column(9) do
				= f.widget(:alert, :type => :success) do
					This is a success alert 
				= f.widget(:alert, :type => :error) do
					This is a error alert 
		= f.row(:border => true) do
			= f.column(3) do
				= f.widget :heading, 'Buttons'
			= f.column(9) do
				%p= f.widget :button, :size => 'medium', :corners => 'radius', :style => 'nice', :color => 'red', :label => 'Medium red nice looking button'
```