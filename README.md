# Fidelity gem
A Ruby on Rails DSL for creating rapid prototypes. Depends on [Foundation](http://http://foundation.zurb.com/).

Install
-----

This is still in alpha and under development. But to test clone this rails engine:

		git clone@github.com/jhoglund/fidelity.git

And link to in from gem to your Gemfile in your Ruby on Rails 3.2 application:

    gem "fidelity", :path => 'path/to/the/git/repository'

Once you have it installed you need to run inside the rails applications root directory:
		
		rails g fidelity:install
		
		
How to use
-----

Below is a brief example of how to use the DSL (using HAML syntax). 
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

The gem also allows for adding pages for prototyping without the need to create routes or controller. To do so, add a `fidelity` directory in your `app/views` directory and add an index file ('index.html.erb'). That page will be the root of your app. You can add deeper structures by adding nested folders with index files in them. Like this:

		rails_app
			app
				views
					fidelity
						index.html.erb # localhost:3000
						users
							index.html.erb # localhost:3000/users
							user
								index.html.erb # localhost:3000/users/user
							
Any concurring route added to the routes file of the rails application will overwrite the structure created by the Fidelity gem.